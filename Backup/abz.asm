;Compiler Delaration Section

format PE console

entry !Start
stack $100000

macro align value { rb (value-1) - (rva $ + value-1) mod value }

_BufSize=500
; End of Declaration Section

include 'include\kernel.inc'
include 'include\user.inc'
include 'include\gdi.inc'
include 'include\comctl.inc'
include 'include\comdlg.inc'
include 'include\shell.inc'
include 'include\cproc.inc'
include 'include\riched.inc'

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
	richedit,'RichEd20.dll',\
	scintilla,'SciLexer.dll'

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
        import	CallWindowProc,'CallWindowProcA',\
	  	CheckDlgButton,'CheckDlgButton',\
		CheckRadioButton,'CheckRadioButton',\
         	CreateWindowEx,'CreateWindowExA',\
         	DefWindowProc,'DefWindowProcA',\
		DestroyWindow,'DestroyWindow',\
         	DispatchMessage,'DispatchMessageA',\
		EnableWindow,'EnableWindow',\
		GetAncestor,'GetAncestor',\
         	GetClientRect,'GetClientRect',\
		GetComboBoxInfo,'GetComboBoxInfo',\
         	GetMessage,'GetMessageA',\
		GetParent,'GetParent',\
		InvalidateRect,'InvalidateRect',\
		KillTimer,'KillTimer',\
         	LoadCursor,'LoadCursorA',\
         	LoadIcon,'LoadIconA',\
         	LoadMenu,'LoadMenuA',\
         	MessageBox,'MessageBoxA',\
		PostMessage,'PostMessageA',\
         	MoveWindow,'MoveWindow',\
         	PostQuitMessage,'PostQuitMessage',\
         	RedrawWindow,'RedrawWindow',\
		RegisterClass,'RegisterClassA',\
         	SendMessage,'SendMessageA',\
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
        import  ChooseFont,'ChooseColorA',\
		GetOpenFileName,'GetOpenFileNameA',\
		GetSaveFileName,'GetSaveFileNameA',\
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

richedit:
	import CreateTextServices,'CreateTextServices'

scintilla:

; End of Import Section



section '.data' data readable writeable

align 4

ERR dd 0
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
; LN:1 ' OmniBasic Copyright 1995-2003 Innomation Systems, Inc.
; LN:2 ' All Rights Reserved
; LN:3 '
; LN:4 ' This source file is provided for educational, documentary, and porting
; LN:5 ' purposes only. The recipient agrees to hold this information in strict
; LN:6 ' confidence. The recipient agrees to these terms by accepting this software
; LN:7 ' source code. Violations may result in criminal and/or civil penalties under
; LN:8 ' the copyright and trade secret laws of the United States of America.
; LN:10 ' Edition History
; LN:12 ' 10-19-02 OmniBasic release 1.44 as base for adaptation
; LN:13 ' 11-16-02 Began conversion to x86 asm
; LN:15 ' MACROS
; LN:208 DIM OpSizeStr AS STRING*16
align 4
OpSizeStr dd OpSizeStr+12
 dd 16
 dd 0
 rb 16
; LN:213 DIM TableName AS STRING*28
align 4
TableName dd TableName+12
 dd 28
 dd 0
 rb 28
; LN:240 DIM Comment AS STRING*64
align 4
Comment dd Comment+12
 dd 64
 dd 0
 rb 64
; LN:256 DIM B AS STRING*10
align 4
B dd B+12
 dd 10
 dd 0
 rb 10
; LN:259 DIM Fmt AS STRING*79
align 4
Fmt dd Fmt+12
 dd 79
 dd 0
 rb 79
; LN:263 DIM VectorName AS STRING*28
align 4
VectorName dd VectorName+12
 dd 28
 dd 0
 rb 28
; LN:267 DIM FcnName AS STRING*28
align 4
FcnName dd FcnName+12
 dd 28
 dd 0
 rb 28
; LN:279 DIM Opt AS STRING*1
align 4
Opt dd Opt+12
 dd 1
 dd 0
 rb 1
; LN:286 DIM AddInst AS STRING*5
align 4
AddInst dd AddInst+12
 dd 5
 dd 0
 rb 5
; LN:287 DIM DecInc AS STRING*3
align 4
DecInc dd DecInc+12
 dd 3
 dd 0
 rb 3
; LN:299 DIM LastStmt AS STRING*8
align 4
LastStmt dd LastStmt+12
 dd 8
 dd 0
 rb 8
; LN:311 DIM LdRegName AS STRING*16
align 4
LdRegName dd LdRegName+12
 dd 16
 dd 0
 rb 16
; LN:312 DIM Reg0Name AS STRING*16
align 4
Reg0Name dd Reg0Name+12
 dd 16
 dd 0
 rb 16
; LN:313 DIM Reg1Name AS STRING*16
align 4
Reg1Name dd Reg1Name+12
 dd 16
 dd 0
 rb 16
; LN:314 DIM _DataType AS STRING*16
align 4
_DataType dd _DataType+12
 dd 16
 dd 0
 rb 16
; LN:315 DIM DWSafe AS STRING*3
align 4
DWSafe dd DWSafe+12
 dd 3
 dd 0
 rb 3
; LN:333 DIM Op1Name AS STRING*42
align 4
Op1Name dd Op1Name+12
 dd 42
 dd 0
 rb 42
; LN:334 DIM Op2Name AS STRING*42
align 4
Op2Name dd Op2Name+12
 dd 42
 dd 0
 rb 42
; LN:339 DIM VarName AS STRING*28
align 4
VarName dd VarName+12
 dd 28
 dd 0
 rb 28
; LN:340 DIM BufName AS STRING*28
align 4
BufName dd BufName+12
 dd 28
 dd 0
 rb 28
; LN:342 DIM AccMode AS STRING*40
align 4
AccMode dd AccMode+12
 dd 40
 dd 0
 rb 40
; LN:343 DIM CreatMode AS STRING*40
align 4
CreatMode dd CreatMode+12
 dd 40
 dd 0
 rb 40
; LN:344 DIM PathVar AS STRING*42
align 4
PathVar dd PathVar+12
 dd 42
 dd 0
 rb 42
; LN:345 DIM PathName AS STRING*28
align 4
PathName dd PathName+12
 dd 28
 dd 0
 rb 28
; LN:347 DIM ToSub AS STRING*5
align 4
ToSub dd ToSub+12
 dd 5
 dd 0
 rb 5
; LN:385 DIM RawData AS STRING*1
align 4
RawData dd RawData+12
 dd 1
 dd 0
 rb 1
; LN:386 DIM TempStr AS STRING*_BufSize
align 4
TempStr dd TempStr+12
 dd 500
 dd 0
 rb 500
; LN:387 DIM FcnOp1Nam AS STRING*28
align 4
FcnOp1Nam dd FcnOp1Nam+12
 dd 28
 dd 0
 rb 28
; LN:388 DIM FcnOp2Nam AS STRING*28
align 4
FcnOp2Nam dd FcnOp2Nam+12
 dd 28
 dd 0
 rb 28
; LN:389 DIM TempName AS STRING*28
align 4
TempName dd TempName+12
 dd 28
 dd 0
 rb 28
; LN:392 DIM TempByte AS STRING*1
align 4
TempByte dd TempByte+12
 dd 1
 dd 0
 rb 1
; LN:394 DIM NextByte AS STRING*1
align 4
NextByte dd NextByte+12
 dd 1
 dd 0
 rb 1
; LN:454 DIM CVOp AS STRING*2
align 4
CVOp dd CVOp+12
 dd 2
 dd 0
 rb 2
; LN:467 DIM SymType AS STRING*32
align 4
SymType dd SymType+12
 dd 32
 dd 0
 rb 32
; LN:468 DIM SimpleOp AS STRING*8
align 4
SimpleOp dd SimpleOp+12
 dd 8
 dd 0
 rb 8
; LN:469 DIM SimpleStructOp AS STRING*8
align 4
SimpleStructOp dd SimpleStructOp+12
 dd 8
 dd 0
 rb 8
; LN:473 DIM TSymName AS STRING*28
align 4
TSymName dd TSymName+12
 dd 28
 dd 0
 rb 28
; LN:474 DIM VSymName AS STRING*28
align 4
VSymName dd VSymName+12
 dd 28
 dd 0
 rb 28
; LN:489 DIM SrcLine AS STRING*_BufSize
align 4
SrcLine dd SrcLine+12
 dd 500
 dd 0
 rb 500
; LN:490 DIM SrcLineSaf AS STRING*_BufSize
align 4
SrcLineSaf dd SrcLineSaf+12
 dd 500
 dd 0
 rb 500
; LN:491 DIM OutBuf AS STRING*_BufSize
align 4
OutBuf dd OutBuf+12
 dd 500
 dd 0
 rb 500
; LN:492 DIM TokenBuf AS STRING*_BufSize
align 4
TokenBuf dd TokenBuf+12
 dd 500
 dd 0
 rb 500
; LN:501 DIM TokenSaf AS STRING*_BufSize
align 4
TokenSaf dd TokenSaf+12
 dd 500
 dd 0
 rb 500
; LN:502 DIM RootSym AS STRING*29
align 4
RootSym dd RootSym+12
 dd 29
 dd 0
 rb 29
; LN:505 DIM KeyWord AS STRING*29
align 4
KeyWord dd KeyWord+12
 dd 29
 dd 0
 rb 29
; LN:507 DIM SymbolSaf AS STRING*29
align 4
SymbolSaf dd SymbolSaf+12
 dd 29
 dd 0
 rb 29
; LN:557 DIM TFileName AS STRING*28
align 4
TFileName dd TFileName+12
 dd 28
 dd 0
 rb 28
; LN:558 DIM FileName AS STRING*28
align 4
FileName dd FileName+12
 dd 28
 dd 0
 rb 28
; LN:559 DIM UseFilNam AS STRING*28
align 4
UseFilNam dd UseFilNam+12
 dd 28
 dd 0
 rb 28
_StrConst1 db "OmniBasic Version 0.2",0
_StrConst2 db "Copyright  1995-2003 Innomation Systems, Inc.",0
_StrConst3 db "All Rights Reserved",0
_StrConst4 db "No input file",0
_StrConst5 db "-?",0
_StrConst6 db ".b",0
_StrConst7 db ".B",0
_StrConst8 db "No Recognized Extension",0
_StrConst9 db "_DeclareFile",0
_StrConst10 db "_DeclareFile",0
_StrConst11 db "_PreCodeFile",0
_StrConst12 db "_PreCodeFile",0
_StrConst13 db "_CodeFile",0
_StrConst14 db "_CodeFile",0
_StrConst15 db "_DataFile",0
_StrConst16 db "_DataFile",0
_StrConst17 db "_DimFile",0
_StrConst18 db "_DimFile",0
_StrConst19 db "_FunctionFile",0
_StrConst20 db "_FunctionFile",0
_StrConst21 db "_ExportFile",0
_StrConst22 db "_ExportFile",0
_StrConst23 db "_ResourceFile",0
_StrConst24 db "_ResourceFile",0
_StrConst25 db "%",0
_StrConst26 db "%",0
TailStrLib:
 db "__TailStr:",0
 db "push ebx",0
 db "mov edi,[esi]",0
 db "mov ecx,[esi+4]",0
 db "xor edx,edx",0
 db "dec eax",0
 db "add eax,edi",0
 db "__TailStrLen:",0
 db "mov bl,[edi]",0
 db "or bl,bl",0
 db "je __TailStr2",0
 db "dec ecx",0
 db "je __TailStr1",0
 db "inc edi",0
 db "inc edx",0
 db "jmp __TailStrLen",0
 db "__TailStr1:",0
 db "inc edi",0
 db "__TailStr2:",0
 db "mov [esi],eax",0
 db "mov [esi+4],edx",0
 db "pop ebx",0
 db "ret",0
 db "ENDTEXT",0
LCaseLib:
 db "__LCase:",0
 db "mov ecx,[esi+4]",0
 db "mov esi,[esi]",0
 db "__LCaseLoop:",0
 db "mov al,[esi]",0
 db "or al,al",0
 db "je __LCaseDone",0
 db "cmp al,$41",0
 db "jb __NotUpper",0
 db "cmp al, $5a",0
 db "ja __NotUpper",0
 db "or al,$20",0
 db "__NotUpper:",0
 db "mov [esi],al",0
 db "inc esi",0
 db "dec ecx",0
 db "jne __LCaseLoop",0
 db "__LCaseDone:",0
 db "ret",0
 db "ENDTEXT",0
UCaseLib:
 db "__UCase:",0
 db "mov ecx,[esi+4]",0
 db "mov esi,[esi]",0
 db "__UCaseLoop:",0
 db "mov al,[esi]",0
 db "or al,al",0
 db "je __UCaseDone ",0
 db "cmp al,$61",0
 db "jb __NotLower",0
 db "cmp al, $7a",0
 db "ja __NotLower",0
 db "and al,$df",0
 db "__NotLower:",0
 db "mov [esi],al",0
 db "inc esi",0
 db "dec ecx",0
 db "jne __UCaseLoop",0
 db "__UCaseDone:",0
 db "ret",0
 db "ENDTEXT",0
SetStrConstLib:
 db "__SetStrConst:",0
 db "mov al,[esi]",0
 db "mov [edi],al",0
 db "or al,al",0
 db "je __SetStrConstDone",0
 db "inc esi",0
 db "inc edi",0
 db "jmp __SetStrConst",0
 db "__SetStrConstDone:",0
 db "ret",0
 db "ENDTEXT",0
DataLib:
 db "__ReadBool:",0
 db "mov edi,[_DataPtr]",0
 db "mov al,[edi]",0
 db "cmp al,$30",0
 db "jne __ReadBoolTrue",0
 db "xor al,al",0
 db "jmp __ReadBoolDone",0
 db "__ReadBoolTrue:",0
 db "mov al,1",0
 db "__ReadBoolDone:",0
 db "mov [esi],al",0
 db "add edi,2",0
 db "mov [_DataPtr],edi",0
 db "ret",0
 db "__ReadByte:",0
 db "push esi",0
 db "cinvoke atol,[_DataPtr]",0
 db "pop esi",0
 db "mov [esi],al",0
 db "call __UpDateDataPtr",0
 db "ret",0
 db "__ReadShort:",0
 db "push esi",0
 db "cinvoke atol,[_DataPtr]",0
 db "pop esi",0
 db "mov [esi],ax",0
 db "call __UpDateDataPtr",0
 db "ret",0
 db "__ReadLong:",0
 db "push esi",0
 db "cinvoke atol,[_DataPtr]",0
 db "pop esi",0
 db "mov [esi],eax",0
 db "call __UpDateDataPtr",0
 db "ret",0
 db "__ReadFlt:",0
 db "ret",0
 db "__ReadStr:",0
 db "mov edi,[_DataPtr]",0
 db "__ReadStrLoop:",0
 db "mov al,[edi]",0
 db "mov [esi],al",0
 db "inc edi",0
 db "inc esi",0
 db "cmp al,0",0
 db "jne __ReadStrLoop",0
 db "mov [_DataPtr],edi",0
 db "ret",0
 db "__UpDateDataPtr:",0
 db "mov esi,[_DataPtr]",0
 db "__UpDateDataPtrLoop:",0
 db "mov al,[esi]",0
 db "cmp al,0",0
 db "je __UpDateDataPtrDone",0
 db "inc esi",0
 db "jmp __UpDateDataPtrLoop",0
 db "__UpDateDataPtrDone:",0
 db "inc esi",0
 db "mov [_DataPtr],esi",0
 db "ret",0
 db "ENDTEXT",0
InpDataLib:
 db "__InpData:",0
 db "invoke ReadConsole,[_InHandle],[_IOBuffer],_BufSize,XferCount,0",0
 db "push eax",0
 db "cmp [_ArgSafe1],6",0
 db "je __InpDataString",0
 db "cmp [_ArgSafe1],1",0
 db "je __InpDataBool",0
 db "cmp [_ArgSafe1],2",0
 db "je __InpDataByte",0
 db "cmp [_ArgSafe1],3",0
 db "je __InpDataShort",0
 db "cmp [_ArgSafe1],5",0
 db "je __InpDataFloat",0
 db "call __GetNumVal",0
 db "mov [esi],eax",0
 db "jmp __InpDataDone",0
 db "__InpDataString:",0
 db "mov edi,[_ArgSafe0]",0
 db "mov edx,edi",0
 db "add edx,4",0
 db "mov edx,[edx]",0
 db "mov edi,[edi]",0
 db "mov ecx,[XferCount]",0
 db "mov esi,[_IOBuffer]",0
 db "__InpDataStringLp:",0
 db "mov al,[esi]",0
 db "cmp al,$0d",0
 db "jne __NotCR",0
 db "mov byte [edi],0",0
 db "jmp __InpDataDone",0
 db "__NotCR:",0
 db "mov [edi],al",0
 db "dec edx",0
 db "je __InpDataDone",0
 db "inc esi",0
 db "inc edi",0
 db "jne __InpDataStringLp",0
 db "jmp __InpDataDone",0
 db "__InpDataBool:",0
 db "jmp __InpDataDone",0
 db "__InpDataByte:",0
 db "call __GetNumVal",0
 db "mov [esi],al",0
 db "jmp __InpDataDone",0
 db "__InpDataShort:",0
 db "call __GetNumVal",0
 db "mov [esi],ax",0
 db "jmp __InpDataDone",0
 db "__InpDataFloat:",0
 db "__InpDataDone:",0
 db "pop eax",0
 db "ret",0
 db "__GetNumVal:",0
 db "mov esi,[_IOBuffer]",0
 db "cinvoke atol,[_IOBuffer]",0
 db "mov esi,[_ArgSafe0]",0
 db "mov esi,[esi]",0
 db "ret",0
 db "ENDTEXT",0
BtoALib:
 db "__BtoA:",0
 db "mov edi,[_ConvBuf1]",0
 db "or al,al",0
 db "je __BoolFalse",0
 db "mov esi,_TrueStr",0
 db "jmp __BldBool",0
 db "__BoolFalse:",0
 db "mov esi,_FalseStr",0
 db "__BldBool:",0
 db "mov al,[esi]",0
 db "mov [edi],al",0
 db "cmp al,0",0
 db "je __BtoADone",0
 db "inc esi",0
 db "inc edi",0
 db "jmp __BldBool",0
 db "__BtoADone:",0
 db "mov [edi],al",0
 db "ret",0
 db "ENDTEXT",0
MidStrLib:
 db "__MidStr:",0
 db "dec eax",0
 db "mov edi,[esi]",0
 db "add edi,eax",0
 db "mov [esi],edi",0
 db "mov [esi+4],edx",0
 db "ret",0
 db "ENDTEXT",0
MovArgLib:
 db "__MovArg:",0
 db "mov esi,[_ArgList]",0
 db "mov edx,[edi+4]",0
 db "mov edi,[edi]",0
 db "__MovArg1:",0
 db "mov al,[esi]",0
 db "cmp al,32",0
 db "je __MovArgSpace",0
 db "mov [edi],al",0
 db "or al,al",0
 db "je __MovArgDone",0
 db "inc esi",0
 db "inc edi",0
 db "dec edx",0
 db "je __MovArgDone",0
 db "jmp __MovArg1",0
 db "__MovArgSpace:",0
 db "xor al,al",0
 db "mov [edi],al",0
 db "inc esi",0
 db "__MovArgDone:",0
 db "mov [_ArgList],esi",0
 db "ret",0
 db "ENDTEXT",0
CmpStrLib:
 db "__CmpStr:",0
 db "mov edx,[edi+4]",0
 db "mov edi,[edi]",0
 db "mov ecx,[esi+4]",0
 db "mov esi,[esi]",0
 db "__CmpStrLoop:",0
 db "mov al,[edi]",0
 db "mov ah,[esi]",0
 db "cmp al,0",0
 db "je __CmpStrDone",0
 db "cmp ah,0",0
 db "je __CmpStrDone",0
 db "cmp al,ah",0
 db "jne __CmpStrDiff",0
 db "inc edi",0
 db "inc esi",0
 db "dec edx",0
 db "je __CmpStrDone",0
 db "dec ecx",0
 db "jne __CmpStrLoop",0
 db "__CmpStrDone:",0
 db "cmp al,ah",0
 db "__CmpStrDiff:",0
 db "ret",0
 db "ENDTEXT",0
MovStrLib:
 db "__MovStr:",0
 db "push ebx",0
 db "mov edx,[edi+4]",0
 db "mov edi,[edi]",0
 db "__MovStr1:",0
 db "mov ecx,[esi+4]",0
 db "or ecx,ecx",0
 db "je __MovStrDone1",0
 db "mov ebx,[esi]",0
 db "__MovStr2:",0
 db "mov al,[ebx]",0
 db "mov [edi],al",0
 db "inc edi",0
 db "inc ebx",0
 db "dec edx",0
 db "je __MovStrDone2",0
 db "or al,al",0
 db "je __MovStr3",0
 db "dec ecx",0
 db "jne __MovStr2",0
 db "jmp __MovStr4",0
 db "__MovStr3:",0
 db "dec edi",0
 db "__MovStr4:",0
 db "mov ecx,[esi+8]",0
 db "or ecx,ecx",0
 db "je __MovStrDone1",0
 db "mov esi,ecx",0
 db "jmp __MovStr1",0
 db "__MovStrDone1:",0
 db "mov byte [edi],0",0
 db "__MovStrDone2:",0
 db "pop ebx",0
 db "ret",0
 db "ENDTEXT",0
AtoLLib:
 db "__AtoL:",0
 db "mov dl,[esi]",0
 db "cmp dl,'$'",0
 db "jne __NotHex",0
 db "call __NumScan",0
 db "__HexLoop:",0
 db "dec esi",0
 db "xor edx,edx",0
 db "mov dl,[esi]",0
 db "cmp dl,'$'",0
 db "je __AtoLDone",0
 db "cmp dl,$39",0
 db "jg __HexLetter",0
 db "and dl,$0f",0
 db "jmp __HexAcc",0
 db "__HexLetter:",0
 db "and dl,$0f",0
 db "add dl,9",0
 db "__HexAcc:",0
 db "imul edx,ecx",0
 db "add eax,edx",0
 db "imul ecx,16 ",0
 db "jmp __HexLoop",0
 db "__NotHex:",0
 db "cmp dl,'%'",0
 db "jne __NotOctal",0
 db "call __NumScan",0
 db "__OctalLoop:",0
 db "dec esi",0
 db "xor edx,edx",0
 db "mov dl,[esi]",0
 db "cmp dl,'%'",0
 db "je __AtoLDone",0
 db "and dl,$07",0
 db "imul edx,ecx",0
 db "add eax,edx",0
 db "imul ecx,8",0
 db "jmp __OctalLoop",0
 db "__NotOctal:",0
 db "cmp dl,'&'",0
 db "jne __NotBinary",0
 db "call __NumScan",0
 db "__BinaryLoop:",0
 db "dec esi",0
 db "xor edx,edx",0
 db "mov dl,[esi]",0
 db "cmp dl,'&'",0
 db "je __AtoLDone",0
 db "and dl,$01",0
 db "imul edx,ecx",0
 db "add eax,edx",0
 db "imul ecx,2",0
 db "jmp __OctalLoop",0
 db "__NotBinary:",0
 db "cinvoke atol,esi",0
 db "__AtoLDone:",0
 db "ret",0
 db "__NumScan:",0
 db "inc esi",0
 db "mov dl,[esi]",0
 db "cmp dl,0",0
 db "jne __NumScan",0
 db "xor eax,eax",0
 db "mov ecx,1",0
 db "ret",0
 db "ENDTEXT",0
StrLenLib:
 db "__StrLen:",0
 db "xor eax,eax",0
 db "__StrLenGetVec:",0
 db "mov edi,[esi]",0
 db "mov edx,[esi+4]",0
 db "__StrLenLp:",0
 db "mov cl,[edi]",0
 db "cmp cl,0",0
 db "je __StrLenChkLnk",0
 db "inc eax",0
 db "dec edx",0
 db "je __StrLenChkLnk",0
 db "inc edi",0
 db "jmp __StrLenLp",0
 db "__StrLenChkLnk:",0
 db "mov esi,[esi+8]",0
 db "or esi,esi",0
 db "jne __StrLenGetVec",0
 db "ret",0
 db "ENDTEXT",0
RightStrLib:
 db "__RightStr:",0
 db "mov edi,[esi]",0
 db "mov ecx,[esi+4]",0
 db "__RightStrLen:",0
 db "mov dl,[edi]",0
 db "or dl,dl",0
 db "je __RightStr2",0
 db "dec ecx",0
 db "je __RightStr1",0
 db "inc edi",0
 db "jmp __RightStrLen",0
 db "__RightStr1:",0
 db "inc edi",0
 db "__RightStr2:",0
 db "sub edi,eax",0
 db "mov [esi],edi",0
 db "mov [esi+4],eax",0
 db "ret",0
 db "ENDTEXT",0

align 4
KeyTable:
dd 0
db "data",0,0,0,0,0,0,0,0,0,0,0,0
dd DataX
dd 0
db "restore",0,0,0,0,0,0,0,0,0
dd RestoreX
dd 0
db "poke",0,0,0,0,0,0,0,0,0,0,0,0
dd PokeX
dd 0
db "return",0,0,0,0,0,0,0,0,0,0
dd ReturnX
dd 0
db "seek",0,0,0,0,0,0,0,0,0,0,0,0
dd SeekX
dd 0
db "type",0,0,0,0,0,0,0,0,0,0,0,0
dd TypeX
dd 0
db "dim",0,0,0,0,0,0,0,0,0,0,0,0,0
dd DimX
dd 0
db "let",0,0,0,0,0,0,0,0,0,0,0,0,0
dd LetX
dd 0
db "for",0,0,0,0,0,0,0,0,0,0,0,0,0
dd ForX
dd 0
db "if",0,0,0,0,0,0,0,0,0,0,0,0,0,0
dd IfX
dd 0
db "goto",0,0,0,0,0,0,0,0,0,0,0,0
dd GotoX
dd 0
db "gosub",0,0,0,0,0,0,0,0,0,0,0
dd GosubX
dd 0
db "on",0,0,0,0,0,0,0,0,0,0,0,0,0,0
dd OnX
dd 0
db "print",0,0,0,0,0,0,0,0,0,0,0
dd PrintX
dd 0
db "input",0,0,0,0,0,0,0,0,0,0,0
dd InputX
dd 0
db "read",0,0,0,0,0,0,0,0,0,0,0,0
dd ReadX
dd 0
db "write",0,0,0,0,0,0,0,0,0,0,0
dd WriteX
dd 0
db "get",0,0,0,0,0,0,0,0,0,0,0,0,0
dd GetX
dd 0
db "put",0,0,0,0,0,0,0,0,0,0,0,0,0
dd PutX
dd 0
db "end",0,0,0,0,0,0,0,0,0,0,0,0,0
dd EndX
dd 0
db "create",0,0,0,0,0,0,0,0,0,0
dd CreateX
dd 0
db "open",0,0,0,0,0,0,0,0,0,0,0,0
dd OpenX
dd 0
db "close",0,0,0,0,0,0,0,0,0,0,0
dd CloseX
dd 0
db "while",0,0,0,0,0,0,0,0,0,0,0
dd WhileX
dd 0
db "endwhile",0,0,0,0,0,0,0,0
dd EndWhileX
dd 0
db "next",0,0,0,0,0,0,0,0,0,0,0,0
dd NextX
dd 0
db "rem",0,0,0,0,0,0,0,0,0,0,0,0,0
dd RemX
dd 0
db "else",0,0,0,0,0,0,0,0,0,0,0,0
dd ElseX
dd 0
db "endif",0,0,0,0,0,0,0,0,0,0,0
dd EndIfX
dd 0
db "delete",0,0,0,0,0,0,0,0,0,0
dd DeleteX
dd 0
db "buffer",0,0,0,0,0,0,0,0,0,0
dd BufferX
dd 0
db "loop",0,0,0,0,0,0,0,0,0,0,0,0
dd LoopX
dd 0
db "endloop",0,0,0,0,0,0,0,0,0
dd EndLoopX
dd 0
db "repeat",0,0,0,0,0,0,0,0,0,0
dd RepeatX
dd 0
db "until",0,0,0,0,0,0,0,0,0,0,0
dd UntilX
dd 0
db "exitif",0,0,0,0,0,0,0,0,0,0
dd ExitIfX
dd 0
db "shell",0,0,0,0,0,0,0,0,0,0,0
dd ShellX
dd 0
db "fprint",0,0,0,0,0,0,0,0,0,0
dd FPrintX
dd 0
db "finput",0,0,0,0,0,0,0,0,0,0
dd FInputX
dd 0
db "base",0,0,0,0,0,0,0,0,0,0,0,0
dd BaseX
dd 0
db "inc",0,0,0,0,0,0,0,0,0,0,0,0,0
dd IncX
dd 0
db "dec",0,0,0,0,0,0,0,0,0,0,0,0,0
dd DecX
dd 0
db "bufread",0,0,0,0,0,0,0,0,0
dd BufReadX
dd 0
db "bufwrite",0,0,0,0,0,0,0,0
dd BufWriteX
dd 0
db "decimals",0,0,0,0,0,0,0,0
dd DecimalsX
dd 0
db "exchange",0,0,0,0,0,0,0,0
dd ExchangeX
dd 0
db "beep",0,0,0,0,0,0,0,0,0,0,0,0
dd BeepX
dd 0
db "endexit",0,0,0,0,0,0,0,0,0
dd EndExitX
dd 0
db "redim",0,0,0,0,0,0,0,0,0,0,0
dd ReDimX
dd 0
db "playwave",0,0,0,0,0,0,0,0
dd PlayWaveX
dd 0
db "setvec",0,0,0,0,0,0,0,0,0,0
dd SetVecX
dd 0
db "digits",0,0,0,0,0,0,0,0,0,0
dd DigitsX
dd 0
db "macro",0,0,0,0,0,0,0,0,0,0,0
dd MacroX
dd 0
db "endmacro",0,0,0,0,0,0,0,0
dd EndMacroX
dd 0
db "table",0,0,0,0,0,0,0,0,0,0,0
dd TableX
dd 0
db "endtable",0,0,0,0,0,0,0,0
dd EndTableX
dd 0
db "include",0,0,0,0,0,0,0,0,0
dd IncludeX
dd 0
db "freeze",0,0,0,0,0,0,0,0,0,0
dd FreezeX
dd 0
db "call",0,0,0,0,0,0,0,0,0,0,0,0
dd CallX
dd 0
db "chdir",0,0,0,0,0,0,0,0,0,0,0
dd ChDirX
dd 0
db "mkdir",0,0,0,0,0,0,0,0,0,0,0
dd MkDirX
dd 0
db "rmdir",0,0,0,0,0,0,0,0,0,0,0
dd RmDirX
dd 0
db "settimer",0,0,0,0,0,0,0,0
dd SetTimerX
dd 0
db "endfunction",0,0,0,0,0
dd EndFunctionX
dd 0
db "endprocedure",0,0,0,0
dd EndProcedureX
dd 0
db "randomize",0,0,0,0,0,0,0
dd RandomizeX
dd 0
db "declare",0,0,0,0,0,0,0,0,0
dd DeclareX
dd 0
db "function",0,0,0,0,0,0,0,0
dd FunctionX
dd 0
db "procedure",0,0,0,0,0,0,0
dd ProcedureX
dd 0
db "wend",0,0,0,0,0,0,0,0,0,0,0,0
dd WendX
dd 0
db "continue",0,0,0,0,0,0,0,0
dd ContinueX
dd 0
db "select",0,0,0,0,0,0,0,0,0,0
dd SelectX
dd 0
db "endselect",0,0,0,0,0,0,0
dd EndSelectX
dd 0
db "case",0,0,0,0,0,0,0,0,0,0,0,0
dd CaseX
dd 0
db "endcase",0,0,0,0,0,0,0,0,0
dd EndCaseX
dd 0
db "const",0,0,0,0,0,0,0,0,0,0,0
dd ConstX
dd 0
db "swap",0,0,0,0,0,0,0,0,0,0,0,0
dd SwapX
dd 0
db "program",0,0,0,0,0,0,0,0,0
dd ProgramX
dd 0
db "Vacant13",0,0,0,0,0,0,0,0
dd Vacant13X
dd 0
db "makelower",0,0,0,0,0,0,0
dd MakeLowerX
dd 0
db "makeupper",0,0,0,0,0,0,0
dd MakeUpperX
dd 0
db "text",0,0,0,0,0,0,0,0,0,0,0,0
dd TextX
dd 0
db "endtext",0,0,0,0,0,0,0,0,0
dd EndTextX
dd 0
db "endtype",0,0,0,0,0,0,0,0,0
dd EndTypeX
dd 0
db "%",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
dd MainLoop
; End of table

_StrConst27 db "%",0
_StrConst28 db ";Compiler Delaration Section",0
_StrConst29 db "format PE ",0
_StrConst30 db "console",0
_StrConst31 db "GUI",0
_StrConst32 db " DLL",0
_StrConst33 db "entry _Start",0
_StrConst34 db "macro align value { rb (value-1) - (rva $ + value-1) mod value }",0
_StrConst35 db "_BufSize=300",0
_StrConst36 db "section '.data' data readable writeable",0
_StrConst37 db "align 4",0
_StrConst38 db "ERR dd 0",0
_StrConst39 db "_ErrVec dd 0",0
_StrConst40 db "STATUS dd 0",0
_StrConst41 db "POS dd 0",0
_StrConst42 db "XferCount dd 0",0
_StrConst43 db "_TrueStr db ",0
_StrConst44 db "TRUE",0
_StrConst45 db ",0",0
_StrConst46 db "_FalseStr db ",0
_StrConst47 db "FALSE",0
_StrConst48 db ",0",0
_StrConst49 db "align 4",0
_StrConst50 db "%",0
_StrConst51 db "align 4",0
_StrConst52 db "section '.code' code readable executable",0
_StrConst53 db "; Main Code Section",0
_StrConst54 db "align 4",0
_StrConst55 db "_Start:",0
_StrConst56 db "invoke GetModuleHandle, NULL",0
_StrConst57 db "mov dword [_hInstance], eax",0
_StrConst58 db "invoke GetCommandLine",0
_StrConst59 db "mov dword [_ArgList],eax",0
_StrConst60 db "mov dword edi,ProgramName",0
_StrConst61 db "call __MovArg",0
_StrConst62 db "invoke GetStdHandle, STD_INPUT_HANDLE",0
_StrConst63 db "mov dword [_InHandle], eax",0
_StrConst64 db "invoke GetStdHandle, STD_OUTPUT_HANDLE",0
_StrConst65 db "mov dword [_OutHandle], eax",0
_StrConst66 db "mov byte [_CRLF+12],13",0
_StrConst67 db "mov byte [_CRLF+13],10",0
_StrConst68 db "mov byte [_CRLF+14],0",0
_StrConst69 db "mov byte [_Prompt+12],63",0
_StrConst70 db "mov byte [_Prompt+13],0",0
_StrConst71 db "mov byte [_NullStr+12],0",0
_StrConst72 db "mov dword [_ErrVec],_ErrExit",0
_StrConst73 db "_ErrExitMsg db 'Error exit',0",0
_StrConst74 db "%",0
_StrConst75 db "align 4",0
_StrConst76 db " dd ",0
_StrConst77 db "+12",0
_StrConst78 db " dd ",0
_StrConst79 db " dd 0",0
_StrConst80 db " rb ",0
_StrConst81 db "; Function Code Section",0
_StrConst82 db "section '.edata' export data readable",0
_StrConst83 db "section '.rsrc' resource data readable",0
_StrConst84 db "; End of Resource Section",0
_StrConst85 db "section '.reloc' fixups data readable discardable",0
_StrConst86 db "Fatal Error... MACRO argument error in line ",0
_StrConst87 db " ",0
_StrConst88 db "^",0
_StrConst89 db "Fatal Error... Symbol Table Full",0
_StrConst90 db "$",0
_StrConst91 db "if",0
_StrConst92 db "else",0
_StrConst93 db "endif",0
_StrConst94 db "if",0
_StrConst95 db "else",0
_StrConst96 db "$",0
_StrConst97 db "endasm",0
_StrConst98 db "'",0
_StrConst99 db "+",0
_StrConst100 db ".",0
_StrConst101 db "$",0
_StrConst102 db "if",0
_StrConst103 db "else",0
_StrConst104 db "endif",0
_StrConst105 db "asm",0
_StrConst106 db ":",0
_StrConst107 db "data",0
_StrConst108 db ":",0
_StrConst109 db "STATUS",0
_StrConst110 db " ",0
_StrConst111 db ",",0
_StrConst112 db ",",0
_StrConst113 db ",",0
_StrConst114 db "mov dword edi,",0
_StrConst115 db "call __MovArg",0
_StrConst116 db "-",0
_StrConst117 db "-",0
_StrConst118 db "--",0
_StrConst119 db "<",0
_StrConst120 db "<",0
_StrConst121 db ">>",0
_StrConst122 db "+",0
_StrConst123 db "-",0
_StrConst124 db "*",0
_StrConst125 db "/",0
_StrConst126 db "&",0
_StrConst127 db "|",0
_StrConst128 db "<",0
_StrConst129 db ">>",0
_StrConst130 db " equ ",0
_StrConst131 db "FATAL ERROR.. EOF in MACRO",0
_StrConst132 db "macro",0
_StrConst133 db "endmacro",0
_StrConst134 db "end",0
_StrConst135 db "macro",0
_StrConst136 db "~",0
_StrConst137 db "0",0
_StrConst138 db "9",0
_StrConst139 db "A",0
_StrConst140 db "F",0
_StrConst141 db "FATAL Error Conditional stack overflow",0
_StrConst142 db "-",0
_StrConst143 db "-",0
_StrConst144 db "--",0
_StrConst145 db "FATAL ERROR Conditional stack error (#ELSE)",0
_StrConst146 db "FATAL ERROR Conditional stack error (#ENDIF)",0
_StrConst147 db "FATAL ERROR... DATA block with no label in line ",0
_StrConst148 db "data",0
_StrConst149 db ":",0
_StrConst150 db ",",0
_StrConst151 db ",",0
_StrConst152 db "true",0
_StrConst153 db "false",0
_StrConst154 db "true",0
_StrConst155 db "1",0
_StrConst156 db "0",0
_StrConst157 db "db ",0
_StrConst158 db ",0",0
_StrConst159 db "mov dword [_DataPtr],",0
_StrConst160 db "mov dword _Poker=eax",0
_StrConst161 db "mov dword [_Poker],eax",0
_StrConst162 db "mov byte al,[",0
_StrConst163 db "]",0
_StrConst164 db "~",0
_StrConst165 db "mov eax,[",0
_StrConst166 db "]",0
_StrConst167 db "mov [_LongRet],eax",0
_StrConst168 db "mov edi,[",0
_StrConst169 db "]",0
_StrConst170 db "mov [_StringRet],edi",0
_StrConst171 db "mov edi,[",0
_StrConst172 db "+4]",0
_StrConst173 db "mov [_StringRet+4],edi",0
_StrConst174 db "mov edi,[",0
_StrConst175 db "+8]",0
_StrConst176 db "mov [_StringRet+8],edi",0
_StrConst177 db "ret",0
_StrConst178 db "invoke SetFilePointer,[_IOPthNum],eax,0,FILE_BEGIN",0
_StrConst179 db "Fatal Error: EOF in TYPE",0
_StrConst180 db "end",0
_StrConst181 db "type",0
_StrConst182 db "endtype",0
_StrConst183 db "*",0
_StrConst184 db " byte ",0
_StrConst185 db " byte ",0
_StrConst186 db " word ",0
_StrConst187 db " dword ",0
_StrConst188 db " ",0
_StrConst189 db "NextArg",0
_StrConst190 db "=",0
_StrConst191 db "mov [",0
_StrConst192 db "+12],0",0
_StrConst193 db "+",0
_StrConst194 db "mov edi,[",0
_StrConst195 db "]",0
_StrConst196 db "mov esi,_StrConst",0
_StrConst197 db "call __SetStrConst",0
_StrConst198 db "mov dword [",0
_StrConst199 db "],",0
_StrConst200 db "mov dword esi,[",0
_StrConst201 db "]",0
_StrConst202 db "mov dword [esi], dword ",0
_StrConst203 db "NextArg",0
_StrConst204 db "~",0
_StrConst205 db "mov",0
_StrConst206 db "[",0
_StrConst207 db "],",0
_StrConst208 db "xor eax,eax",0
_StrConst209 db "mov al,[",0
_StrConst210 db "]",0
_StrConst211 db "mov ax,[",0
_StrConst212 db "]",0
_StrConst213 db "mov eax,[",0
_StrConst214 db "]",0
_StrConst215 db "mov edi,",0
_StrConst216 db "mov esi,",0
_StrConst217 db "call __MovStr",0
_StrConst218 db "mov edi,",0
_StrConst219 db "mov edi,[",0
_StrConst220 db "]",0
_StrConst221 db "mov esi,",0
_StrConst222 db "mov esi,[",0
_StrConst223 db "]; Get src addr",0
_StrConst224 db "mov ecx,",0
_StrConst225 db "_Lbl",0
_StrConst226 db ":",0
_StrConst227 db "mov al,byte [esi]",0
_StrConst228 db "mov byte [edi],al",0
_StrConst229 db "inc esi",0
_StrConst230 db "inc edi",0
_StrConst231 db "dec ecx",0
_StrConst232 db "jne ",0
_StrConst233 db "_Lbl",0
_StrConst234 db "Internal Error",0
_StrConst235 db "mov [",0
_StrConst236 db "],al",0
_StrConst237 db "mov [",0
_StrConst238 db "],ax",0
_StrConst239 db "mov [",0
_StrConst240 db "],eax",0
_StrConst241 db "~",0
_StrConst242 db "eax",0
_StrConst243 db "mov [",0
_StrConst244 db "],",0
_StrConst245 db "mov edi,[",0
_StrConst246 db "]",0
_StrConst247 db "mov eax,[edi]",0
_StrConst248 db "mov eax,[",0
_StrConst249 db "]",0
_StrConst250 db "mov [",0
_StrConst251 db "],eax",0
_StrConst252 db "to",0
_StrConst253 db "~",0
_StrConst254 db "mov edi,[",0
_StrConst255 db "]",0
_StrConst256 db "mov eax,[edi]",0
_StrConst257 db "~",0
_StrConst258 db "mov eax,[",0
_StrConst259 db "]",0
_StrConst260 db "mov [_LopVec",0
_StrConst261 db "],eax",0
_StrConst262 db "step",0
_StrConst263 db "~",0
_StrConst264 db "7",0
_StrConst265 db "~",0
_StrConst266 db "eax",0
_StrConst267 db "mov edi,[",0
_StrConst268 db "]",0
_StrConst269 db "mov eax,[edi]",0
_StrConst270 db "mov eax,[",0
_StrConst271 db "]",0
_StrConst272 db "mov [_LopVec",0
_StrConst273 db "+4],eax",0
_StrConst274 db "_Lbl",0
_StrConst275 db ":",0
_StrConst276 db "xor eax,eax",0
_StrConst277 db "mov eax,[",0
_StrConst278 db "]",0
_StrConst279 db "cmp eax,",0
_StrConst280 db "cmp eax,[_LopVec",0
_StrConst281 db "]",0
_StrConst282 db "jg ",0
_StrConst283 db "_Lbl",0
_StrConst284 db ";if (",0
_StrConst285 db "<",0
_StrConst286 db ") goto _Lbl",0
_StrConst287 db ";",0
_StrConst288 db ";if (",0
_StrConst289 db "<_LopVec",0
_StrConst290 db "._Limit) goto _Lbl",0
_StrConst291 db ";",0
_StrConst292 db ";if ((_LopVec",0
_StrConst293 db "._Step>=0) && (",0
_StrConst294 db ">_LopVec",0
_StrConst295 db "._Limit)) goto _Lbl",0
_StrConst296 db ";",0
_StrConst297 db ";if ((_LopVec",0
_StrConst298 db "._Step<0) && (",0
_StrConst299 db "<_LopVec",0
_StrConst300 db "._Limit)) goto _Lbl",0
_StrConst301 db ";",0
_StrConst302 db ";if ((_LopVec",0
_StrConst303 db "._Step>=0) && (",0
_StrConst304 db ">",0
_StrConst305 db ")) goto _Lbl",0
_StrConst306 db ";",0
_StrConst307 db ";if ((_LopVec",0
_StrConst308 db "._Step<0) && (",0
_StrConst309 db "<",0
_StrConst310 db ")) goto _Lbl",0
_StrConst311 db ";",0
_StrConst312 db "then",0
_StrConst313 db "cmp [",0
_StrConst314 db "],",0
_StrConst315 db "je ",0
_StrConst316 db "_Lbl",0
_StrConst317 db "jmp ",0
_StrConst318 db "_Lbl",0
_StrConst319 db ":",0
_StrConst320 db "je ",0
_StrConst321 db "_Lbl",0
_StrConst322 db "_Lbl",0
_StrConst323 db "jmp ",0
_StrConst324 db "[",0
_StrConst325 db "]",0
_StrConst326 db "mov esi,[",0
_StrConst327 db "]",0
_StrConst328 db "dword [esi]",0
_StrConst329 db "[",0
_StrConst330 db "]",0
_StrConst331 db "call ",0
_StrConst332 db "error",0
_StrConst333 db "align 4",0
_StrConst334 db "_Table",0
_StrConst335 db ":",0
_StrConst336 db "goto",0
_StrConst337 db "gosub",0
_StrConst338 db "goto",0
_StrConst339 db ",",0
_StrConst340 db ",",0
_StrConst341 db ",",0
_StrConst342 db "dd ",0
_StrConst343 db "cmp eax,1",0
_StrConst344 db "jl ",0
_StrConst345 db "_Lbl",0
_StrConst346 db "cmp eax,",0
_StrConst347 db "jg ",0
_StrConst348 db "_Lbl",0
_StrConst349 db "dec eax",0
_StrConst350 db "shl eax,2",0
_StrConst351 db "add eax,_Table",0
_StrConst352 db "mov eax,[eax]",0
_StrConst353 db "jmp dword eax",0
_StrConst354 db "call dword eax",0
_StrConst355 db "_Lbl",0
_StrConst356 db ":",0
_StrConst357 db "mov [_ErrVec],_ErrExit",0
_StrConst358 db "goto",0
_StrConst359 db "mov [_ErrVec],",0
_StrConst360 db "using",0
_StrConst361 db "mov esi,",0
_StrConst362 db "mov edi,_PrintBuf",0
_StrConst363 db "call __MovStr",0
_StrConst364 db "mov esi,_PrintBuf",0
_StrConst365 db "call __StrLen",0
_StrConst366 db "mov edx,eax",0
_StrConst367 db "add edx,[POS]",0
_StrConst368 db "mov [POS],edx",0
_StrConst369 db "invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL",0
_StrConst370 db ",",0
_StrConst371 db ";",0
_StrConst372 db ",",0
_StrConst373 db "xor eax,eax",0
_StrConst374 db ";",0
_StrConst375 db ",",0
_StrConst376 db ";",0
_StrConst377 db "invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL",0
_StrConst378 db "mov [POS],0",0
_StrConst379 db "invoke WriteConsole,[_OutHandle],[",0
_StrConst380 db "],[",0
_StrConst381 db "+4],XferCount,NULL",0
_StrConst382 db "invoke WriteConsole,[_OutHandle],[_Prompt],1,XferCount,NULL",0
_StrConst383 db "mov esi,",0
_StrConst384 db "mov [_ArgSafe0],esi",0
_StrConst385 db "mov [_ArgSafe1],",0
_StrConst386 db "call __InpData",0
_StrConst387 db ",",0
_StrConst388 db "#",0
_StrConst389 db ",",0
_StrConst390 db "call __ReadBool",0
_StrConst391 db "call __ReadByte",0
_StrConst392 db "call __ReadShort",0
_StrConst393 db "call __ReadLong",0
_StrConst394 db "call __ReadFlt",0
_StrConst395 db "mov eax,",0
_StrConst396 db "call __ReadStr",0
_StrConst397 db "_Lbl",0
_StrConst398 db ":",0
_StrConst399 db "mov [_ArgSafe0],esi",0
_StrConst400 db "invoke ReadFile,[_IOPthNum],[_IOBuffer],1,XferCount,0",0
_StrConst401 db "cmp eax,0",0
_StrConst402 db "je ",0
_StrConst403 db "_Lbl",0
_StrConst404 db "cmp [XferCount],0",0
_StrConst405 db "je ",0
_StrConst406 db "_Lbl",0
_StrConst407 db "cmp byte [_IOBuffer+12],13",0
_StrConst408 db "je _Lbl",0
_StrConst409 db "cmp byte [_IOBuffer+12],10",0
_StrConst410 db "je ",0
_StrConst411 db "_Lbl",0
_StrConst412 db "cmp [_ByteCounter],0",0
_StrConst413 db "je ",0
_StrConst414 db "_Lbl",0
_StrConst415 db "mov al, byte [_IOBuffer+12]",0
_StrConst416 db "mov esi,[_ArgSafe0]",0
_StrConst417 db "mov [esi],al",0
_StrConst418 db "inc esi",0
_StrConst419 db "mov [_ArgSafe0],esi",0
_StrConst420 db "dec [_ByteCounter]",0
_StrConst421 db "jmp ",0
_StrConst422 db "_Lbl",0
_StrConst423 db "_Lbl",0
_StrConst424 db ":",0
_StrConst425 db "cmp [_ByteCounter],0",0
_StrConst426 db "je ",0
_StrConst427 db "_OELbl",0
_StrConst428 db "mov esi,[_ArgSafe0]",0
_StrConst429 db "mov byte [esi],0",0
_StrConst430 db "jmp _OELbl",0
_StrConst431 db "_Lbl",0
_StrConst432 db ":",0
_StrConst433 db "mov [XferCount],0",0
_StrConst434 db "_Lbl",0
_StrConst435 db ":",0
_StrConst436 db "cmp byte [esi],0; Null?",0
_StrConst437 db "je ",0
_StrConst438 db "_Lbl",0
_StrConst439 db "inc esi",0
_StrConst440 db "inc [XferCount]",0
_StrConst441 db "dec [_ByteCounter]",0
_StrConst442 db "jne ",0
_StrConst443 db "_Lbl",0
_StrConst444 db "_Lbl",0
_StrConst445 db ":",0
_StrConst446 db "mov edx,[XferCount]",0
_StrConst447 db "mov [_ArgSafe0],edx",0
_StrConst448 db "mov eax,[_CRLF]",0
_StrConst449 db "mov [_XferAddr],eax",0
_StrConst450 db "mov [XferCount],2",0
_StrConst451 db "mov edx,[_ArgSafe0]",0
_StrConst452 db "add edx,[XferCount]",0
_StrConst453 db "mov [XferCount],edx",0
_StrConst454 db "if",0
_StrConst455 db "loop",0
_StrConst456 db "while",0
_StrConst457 db "exit",0
_StrConst458 db "select",0
_StrConst459 db "case",0
_StrConst460 db "function",0
_StrConst461 db "procedure",0
_StrConst462 db "table",0
_StrConst463 db "text",0
_StrConst464 db "type",0
_StrConst465 db "xor eax,eax",0
_StrConst466 db "invoke ExitProcess, eax",0
_StrConst467 db "invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0",0
_StrConst468 db "mov [STATUS],eax",0
_StrConst469 db "mov [",0
_StrConst470 db "],eax",0
_StrConst471 db "|A_DIR",0
_StrConst472 db "invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0",0
_StrConst473 db "mov [STATUS],eax",0
_StrConst474 db "mov [",0
_StrConst475 db "],eax",0
_StrConst476 db "mov edi,[",0
_StrConst477 db "]",0
_StrConst478 db "mov [edi],eax",0
_StrConst479 db "invoke CloseHandle,[_IOPthNum]",0
_StrConst480 db ",",0
_StrConst481 db "_Lbl",0
_StrConst482 db ":",0
_StrConst483 db "do",0
_StrConst484 db "je ",0
_StrConst485 db "_Lbl",0
_StrConst486 db "jmp ",0
_StrConst487 db "_Lbl",0
_StrConst488 db "_Lbl",0
_StrConst489 db ":",0
_StrConst490 db "_Lbl",0
_StrConst491 db ":",0
_StrConst492 db "inc [",0
_StrConst493 db "]",0
_StrConst494 db ";",0
_StrConst495 db "=",0
_StrConst496 db "+_LopVec",0
_StrConst497 db "._Step;",0
_StrConst498 db ";",0
_StrConst499 db "=",0
_StrConst500 db "+",0
_StrConst501 db ";",0
_StrConst502 db "jmp ",0
_StrConst503 db "_Lbl",0
_StrConst504 db "_Lbl",0
_StrConst505 db ":",0
_StrConst506 db "jmp ",0
_StrConst507 db "_Lbl",0
_StrConst508 db "_Lbl",0
_StrConst509 db ":",0
_StrConst510 db "_Lbl",0
_StrConst511 db ":",0
_StrConst512 db "invoke DeleteFile,[_IOBuffer]",0
_StrConst513 db "~",0
_StrConst514 db "0",0
_StrConst515 db "count",0
_StrConst516 db "mov [_LoopCtr+",0
_StrConst517 db "],",0
_StrConst518 db "_Lbl",0
_StrConst519 db ":",0
_StrConst520 db "jmp ",0
_StrConst521 db "_Lbl",0
_StrConst522 db "dec [_LoopCtr",0
_StrConst523 db "+",0
_StrConst524 db "];",0
_StrConst525 db "jne ",0
_StrConst526 db "_Lbl",0
_StrConst527 db "_Lbl",0
_StrConst528 db ":",0
_StrConst529 db "_Lbl",0
_StrConst530 db ":",0
_StrConst531 db "_Lbl",0
_StrConst532 db ":",0
_StrConst533 db "je ",0
_StrConst534 db "_Lbl",0
_StrConst535 db "_Lbl",0
_StrConst536 db ":",0
_StrConst537 db "jne ",0
_StrConst538 db "_Lbl",0
_StrConst539 db "then",0
_StrConst540 db "je ",0
_StrConst541 db "_Lbl",0
_StrConst542 db "mov edi,_IOBuffer",0
_StrConst543 db "mov esi,",0
_StrConst544 db "; Get src",0
_StrConst545 db "call __MovStr",0
_StrConst546 db "cinvoke system,[_IOBuffer]",0
_StrConst547 db "0",0
_StrConst548 db "1",0
_StrConst549 db "0",0
_StrConst550 db "inc",0
_StrConst551 db "mov esi,[",0
_StrConst552 db "]",0
_StrConst553 db "[esi]; INC/DEC operand",0
_StrConst554 db " [",0
_StrConst555 db "]",0
_StrConst556 db ";(long)",0
_StrConst557 db "._Ptr=(long)",0
_StrConst558 db "._Ptr",0
_StrConst559 db ";",0
_StrConst560 db ";*((long*)esi)=(long)",0
_StrConst561 db "._Ptr;",0
_StrConst562 db ";",0
_StrConst563 db "=",0
_StrConst564 db ";",0
_StrConst565 db "dec",0
_StrConst566 db "mov [_Decimals],eax",0
_StrConst567 db "mov [_Digits],eax",0
_StrConst568 db "NextArg",0
_StrConst569 db "NextArg",0
_StrConst570 db "mov eax,edx",0
_StrConst571 db "mov esi,",0
_StrConst572 db "mov esi,[",0
_StrConst573 db "]",0
_StrConst574 db "mov esi,[esi]",0
_StrConst575 db "mov esi,",0
_StrConst576 db "mov esi,[",0
_StrConst577 db "]",0
_StrConst578 db "mov esi,[esi]",0
_StrConst579 db "mov edx,",0
_StrConst580 db "_Lbl",0
_StrConst581 db ":",0
_StrConst582 db "mov al,[esi]",0
_StrConst583 db "mov ah,[edi]",0
_StrConst584 db "mov [esi],ah",0
_StrConst585 db "mov [edi],al",0
_StrConst586 db "inc esi",0
_StrConst587 db "inc edi",0
_StrConst588 db "dec edx",0
_StrConst589 db "jne ",0
_StrConst590 db "_Lbl",0
_StrConst591 db "jmp ",0
_StrConst592 db "_Lbl",0
_StrConst593 db "_Lbl",0
_StrConst594 db ":",0
_StrConst595 db "(",0
_StrConst596 db ",",0
_StrConst597 db "~",0
_StrConst598 db "imul eax,",0
_StrConst599 db "0",0
_StrConst600 db "mov esi,",0
_StrConst601 db "mov eax,[esi]",0
_StrConst602 db "mov [_ArgSafe0],eax",0
_StrConst603 db "mov [_ArgSafe1],0",0
_StrConst604 db "~",0
_StrConst605 db "mov _ArgSafe1,eax",0
_StrConst606 db "invoke sndPlaySound,[_ArgSafe0],[_ArgSafe1]",0
_StrConst607 db "sub eax,",0
_StrConst608 db "mov [",0
_StrConst609 db "],eax",0
_StrConst610 db "mov [",0
_StrConst611 db "+4],",0
_StrConst612 db ",",0
_StrConst613 db "mov [",0
_StrConst614 db "+4],eax",0
_StrConst615 db "mov [",0
_StrConst616 db "+8],0",0
_StrConst617 db "as",0
_StrConst618 db "align 4",0
_StrConst619 db ":",0
_StrConst620 db "boolean",0
_StrConst621 db "byte",0
_StrConst622 db "integer",0
_StrConst623 db "long",0
_StrConst624 db "double",0
_StrConst625 db "label",0
_StrConst626 db "string",0
_StrConst627 db "*",0
_StrConst628 db "repeat",0
_StrConst629 db "until",0
_StrConst630 db "Fatal Error: EOF in TABLE",0
_StrConst631 db "end",0
_StrConst632 db "endtable",0
_StrConst633 db "end",0
_StrConst634 db "table",0
_StrConst635 db "; End of table",0
_StrConst636 db ",",0
_StrConst637 db ",",0
_StrConst638 db "true",0
_StrConst639 db "db 1",0
_StrConst640 db "false",0
_StrConst641 db "db 0",0
_StrConst642 db "db ",0
_StrConst643 db "dw ",0
_StrConst644 db "dd ",0
_StrConst645 db "dd ",0
_StrConst646 db "Fatal Error: Oversize string in table",0
_StrConst647 db "db ",0
_StrConst648 db ",0",0
_StrConst649 db "db 0",0
_StrConst650 db ",0",0
_StrConst651 db "Fatal Error: EndTable while not in table",0
_StrConst652 db "FATAL ERROR Use Stack OverFlow",0
_StrConst653 db "Cannot open file: ",0
_StrConst654 db "Cannot open Import File",0
_StrConst655 db "call ",0
_StrConst656 db "invoke SetCurrentDirectory,[_IOBuffer]",0
_StrConst657 db "invoke CreateDirectory,[_IOBuffer],0",0
_StrConst658 db "invoke RemoveDirectory,[_IOBuffer]",0
_StrConst659 db "mov [_BoolRet],0",0
_StrConst660 db "mov [_LongRet],0",0
_StrConst661 db "mov edi,_NullStr",0
_StrConst662 db "mov [_StringRet],edi",0
_StrConst663 db "mov [_StringRet+4],0",0
_StrConst664 db "mov [_StringRet+8],0",0
_StrConst665 db "ret",0
_StrConst666 db "ret",0
_StrConst667 db ";srand(eax);",0
_StrConst668 db ";srand(time(NULL)/2);",0
_StrConst669 db "procedure",0
_StrConst670 db "function",0
_StrConst671 db "public",0
_StrConst672 db "(",0
_StrConst673 db ")",0
_StrConst674 db "as",0
_StrConst675 db "boolean",0
_StrConst676 db "integer",0
_StrConst677 db "string",0
_StrConst678 db "double",0
_StrConst679 db ",",0
_StrConst680 db ",",0
_StrConst681 db "boolean",0
_StrConst682 db "integer",0
_StrConst683 db "string",0
_StrConst684 db "double",0
_StrConst685 db "if",0
_StrConst686 db "if",0
_StrConst687 db "jne ",0
_StrConst688 db "_Lbl",0
_StrConst689 db "case",0
_StrConst690 db "~",0
_StrConst691 db "mov [_SwitchInt],eax",0
_StrConst692 db "mov edi,[",0
_StrConst693 db "]",0
_StrConst694 db "mov [_SwitchStr],edi",0
_StrConst695 db "mov edi,[",0
_StrConst696 db "+4]",0
_StrConst697 db "mov [_SwitchStr+4],edi",0
_StrConst698 db "mov edi,[",0
_StrConst699 db "+8]",0
_StrConst700 db "mov [_SwitchStr+8],edi",0
_StrConst701 db "_Lbl",0
_StrConst702 db ":",0
_StrConst703 db "else",0
_StrConst704 db "~",0
_StrConst705 db "to",0
_StrConst706 db "jne ",0
_StrConst707 db "<",0
_StrConst708 db "~",0
_StrConst709 db ">",0
_StrConst710 db "mov esi,",0
_StrConst711 db "call __LCase",0
_StrConst712 db "mov esi,",0
_StrConst713 db "call __UCase",0
_StrConst714 db ":",0
_StrConst715 db "FATAL ERROR.. EOF in Text",0
_StrConst716 db " db ",0
_StrConst717 db ",0",0
_StrConst718 db "end",0
_StrConst719 db "text",0
_StrConst720 db "endtext",0
_StrConst721 db "Fatal Error: EndText while not in Text",0
_StrConst722 db "Fatal Error: EndType while not in Type",0
; LN:4797 ErrorTbl: DATA "Undefined symbol"' ErrUDSym
ErrorTbl:
db "Undefined symbol",0
; LN:4798 DATA "Invalid symbol name"' ErrIVSNam
db "Invalid symbol name",0
; LN:4799 DATA "Type mismatch or wrong type"' ErrTypMis
db "Type mismatch or wrong type",0
; LN:4800 DATA "Invalid Expression"' ErrIVExp
db "Invalid Expression",0
; LN:4801 DATA "Syntax Error"' ErrSyntax
db "Syntax Error",0
; LN:4802 DATA "Symbol already defined"' ErrDupSym
db "Symbol already defined",0
; LN:4803 DATA "Symbol table full"' ErrSymFul
db "Symbol table full",0
; LN:4804 DATA "Undefined Function"' ErrUDFcn
db "Undefined Function",0
; LN:4805 DATA "Invalid data type"' ErrIVType
db "Invalid data type",0
; LN:4806 DATA "Invalid data type modifier"' ErrIVMod
db "Invalid data type modifier",0
; LN:4807 DATA "Macro argument error"' ErrMacArg
db "Macro argument error",0
; LN:4808 DATA "Invalid directive"' ErrIVDir
db "Invalid directive",0
; LN:4809 DATA "Macro already defined"' ErrDupMac
db "Macro already defined",0
; LN:4810 DATA "Undefined Error"' ErrEndStr
db "Undefined Error",0
; LN:4811 DATA "Nested macro"' ErrMacNst
db "Nested macro",0
; LN:4812 DATA "Macro buffer full"' ErrMacBuf
db "Macro buffer full",0
; LN:4813 DATA "Invalid macro"' ErrIVMac
db "Invalid macro",0
; LN:4814 DATA "ENDMACRO without MACRO"'  ErrEndm
db "ENDMACRO without MACRO",0
; LN:4815 DATA "Unbalanced control structure"' ErrUBCon
db "Unbalanced control structure",0
; LN:4816 DATA "Nested too deep"' ErrNDeep
db "Nested too deep",0
; LN:4817 DATA "Illegal Declaration inside Function or Subroutine"' ErrDecFcn
db "Illegal Declaration inside Function or Subroutine",0
; LN:4818 DATA "Invalid parameter"' ErrIVParm
db "Invalid parameter",0
; LN:4819 DATA "Parameter Statement out of Place"' ErrErrParm
db "Parameter Statement out of Place",0
; LN:4820 DATA "Expression too complex"' ErrCpxExp
db "Expression too complex",0
; LN:4821 DATA "Invalid function"'  ErrIVFunc
db "Invalid function",0
; LN:4822 DATA "No more temps available"' ErrTmpUse
db "No more temps available",0
; LN:4823 DATA "Unbalanced parens"' ErrParen
db "Unbalanced parens",0
; LN:4824 DATA "Function error"' ErrFcn
db "Function error",0
; LN:4825 DATA "Invalid target"' ErrIVTarg
db "Invalid target",0
; LN:4826 DATA "Function/Subroutine nested"' ErrFSNest
db "Function/Subroutine nested",0
; LN:4827 DATA "Undefined Error"' ErrTblArr
db "Undefined Error",0
; LN:4828 DATA "EndFunction statement not in function"' ErrEndFcn
db "EndFunction statement not in function",0
; LN:4829 DATA "Array subscript error"' ErrArrSub
db "Array subscript error",0
; LN:4830 DATA "EndProcedure statement not in procedure"' ErrEndProc
db "EndProcedure statement not in procedure",0
; LN:4831 DATA "ENDTABLE without TABLE"' ErrEndTbl
db "ENDTABLE without TABLE",0
; LN:4832 DATA "Undefined Error"' ErrTblArgs
db "Undefined Error",0
; LN:4833 DATA "Wrong number of args in procedure or function"' ErrFcnArgs
db "Wrong number of args in procedure or function",0
; LN:4834 DATA "TYPE statement inside procedure of function"' ErrTypeFcn
db "TYPE statement inside procedure of function",0
; LN:4836 RunStringTbl: DATA "_IOBuffer",_BufSize
RunStringTbl:
db "_IOBuffer",0
db "500",0
; LN:4837 DATA "_PrintBuf",_BufSize
db "_PrintBuf",0
db "500",0
; LN:4838 DATA "_NullStr",1
db "_NullStr",0
db "1",0
; LN:4839 DATA "_CRLF",2
db "_CRLF",0
db "2",0
; LN:4840 DATA "_Prompt",1
db "_Prompt",0
db "1",0
; LN:4841 DATA "_ConvBuf",32
db "_ConvBuf",0
db "32",0
; LN:4842 DATA "_ConvBuf1",32
db "_ConvBuf1",0
db "32",0
; LN:4843 DATA "ProgramName",28
db "ProgramName",0
db "28",0
; LN:4844 DATA "_SwitchStr",_BufSize
db "_SwitchStr",0
db "500",0
; LN:4845 DATA "%",0
db "%",0
db "0",0
; LN:4847 RunVarTbl: DATA "_FltArgSafe0 rf 1"
RunVarTbl:
db "_FltArgSafe0 rf 1",0
; LN:4848 DATA "_FltArgSafe1 rf 1"
db "_FltArgSafe1 rf 1",0
; LN:4849 DATA "_FloatRet rf 1"
db "_FloatRet rf 1",0
; LN:4850 DATA "_LoopCtr rd 10"
db "_LoopCtr rd 10",0
; LN:4851 DATA "_hInstance rd 1"
db "_hInstance rd 1",0
; LN:4852 DATA "_InHandle rd 1"
db "_InHandle rd 1",0
; LN:4853 DATA "_OutHandle rd 1"
db "_OutHandle rd 1",0
; LN:4854 DATA "_IOPthNum rd 1"
db "_IOPthNum rd 1",0
; LN:4855 DATA "_XferAddr rd 1"
db "_XferAddr rd 1",0
; LN:4856 DATA "_PUArgs rd 15"
db "_PUArgs rd 15",0
; LN:4857 DATA "_ArgList rd 1"
db "_ArgList rd 1",0
; LN:4858 DATA "_ArgNum rd 1"
db "_ArgNum rd 1",0
; LN:4859 DATA "_Poker rd 1"
db "_Poker rd 1",0
; LN:4860 DATA "_DummyArg rd 1"
db "_DummyArg rd 1",0
; LN:4861 DATA "_FcnArg1 rd 1"
db "_FcnArg1 rd 1",0
; LN:4862 DATA "_FcnArg2 rd 1"
db "_FcnArg2 rd 1",0
; LN:4863 DATA "_FcnArg3 rd 1"
db "_FcnArg3 rd 1",0
; LN:4864 DATA "_FcnArg4 rd 1"
db "_FcnArg4 rd 1",0
; LN:4865 DATA "_FcnArg5 rd 1"
db "_FcnArg5 rd 1",0
; LN:4866 DATA "_FcnArg6 rd 1"
db "_FcnArg6 rd 1",0
; LN:4867 DATA "_FcnArg7 rd 1"
db "_FcnArg7 rd 1",0
; LN:4868 DATA "_LongRet rd 1"
db "_LongRet rd 1",0
; LN:4869 DATA "_StringRet rd 3"
db "_StringRet rd 3",0
; LN:4870 DATA "_ArgSafe0 rd 1"
db "_ArgSafe0 rd 1",0
; LN:4871 DATA "_ArgSafe1 rd 1"
db "_ArgSafe1 rd 1",0
; LN:4872 DATA "_SwitchInt rd 1"
db "_SwitchInt rd 1",0
; LN:4873 DATA "_ByteCounter rd 1"
db "_ByteCounter rd 1",0
; LN:4874 DATA "_PrtPthNum rd 1"
db "_PrtPthNum rd 1",0
; LN:4875 DATA "_DataPtr rd 1"
db "_DataPtr rd 1",0
; LN:4876 DATA "_Decimals rw 1"
db "_Decimals rw 1",0
; LN:4877 DATA "_Digits rw 1"
db "_Digits rw 1",0
; LN:4878 DATA "_BoolRet rb 1"
db "_BoolRet rb 1",0
; LN:4879 DATA "%"
db "%",0
; LN:4881 PreDefTbl: DATA "{",OPER,0,0,0,0
PreDefTbl:
db "{",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4882 DATA "}",OPER,0,0,0,0
db "}",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4883 DATA "[",OPER,0,0,0,0
db "[",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4884 DATA "]",OPER,0,0,0,0
db "]",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4885 DATA "(",OPER,0,0,0,0
db "(",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4886 DATA ")",OPER,0,0,0,0
db ")",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4887 DATA "=",OPER,0,0,0,0
db "=",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4888 DATA "<",OPER,0,0,0,0
db "<",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4889 DATA ">",OPER,0,0,0,0
db ">",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4890 DATA "<=",OPER,0,0,0,0
db "<=",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4891 DATA ">=",OPER,0,0,0,0
db ">=",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4892 DATA "<>",OPER,0,0,0,0
db "<>",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4893 DATA ".",OPER,0,0,0,0
db ".",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4894 DATA ",",OPER,0,0,0,0
db ",",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4895 DATA "+",OPER,0,0,0,0
db "+",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4896 DATA "-",OPER,0,0,0,0
db "-",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4897 DATA "*",OPER,0,0,0,0
db "*",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4898 DATA "/",OPER,0,0,0,0
db "/",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4899 DATA "~",OPER,4,0,0,0
db "~",0
db "9",0
db "4",0
db "0",0
db "0",0
db "0",0
; LN:4900 DATA "_NullStr",STRINGVAR,VectorBit,0,0,0
db "_NullStr",0
db "6",0
db "32",0
db "0",0
db "0",0
db "0",0
; LN:4901 DATA "0x0",LONGVAR,ConstBit,0,0,4
db "0x0",0
db "4",0
db "4",0
db "0",0
db "0",0
db "4",0
; LN:4902 DATA "<",OPER,0,0,0,0
db "<",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4903 DATA ">",OPER,0,0,0,0
db ">",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4904 DATA "(",OPER,0,0,0,0
db "(",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4905 DATA ")",OPER,0,0,0,0
db ")",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4906 DATA "*",OPER,0,0,0,0
db "*",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4907 DATA "",OPER,0,0,0,0
db "€",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4908 DATA "true",BOOLVAR,4,1,0,0
db "true",0
db "1",0
db "4",0
db "1",0
db "0",0
db "0",0
; LN:4909 DATA "false",BOOLVAR,4,0,0,0
db "false",0
db "1",0
db "4",0
db "0",0
db "0",0
db "0",0
; LN:4910 DATA "eof",FCN,0,1,0,0
db "eof",0
db "10",0
db "0",0
db "1",0
db "0",0
db "0",0
; LN:4911 DATA "len",FCN,0,2,0,0
db "len",0
db "10",0
db "0",0
db "2",0
db "0",0
db "0",0
; LN:4912 DATA "str$",FCN,0,3,0,0
db "str$",0
db "10",0
db "0",0
db "3",0
db "0",0
db "0",0
; LN:4913 DATA "val",FCN,0,4,0,0
db "val",0
db "10",0
db "0",0
db "4",0
db "0",0
db "0",0
; LN:4914 DATA "land",FCN,0,5,0,0
db "land",0
db "10",0
db "0",0
db "5",0
db "0",0
db "0",0
; LN:4915 DATA "mid$",FCN,0,6,0,0
db "mid$",0
db "10",0
db "0",0
db "6",0
db "0",0
db "0",0
; LN:4916 DATA "lor",FCN,0,7,0,0
db "lor",0
db "10",0
db "0",0
db "7",0
db "0",0
db "0",0
; LN:4917 DATA "left$",FCN,0,8,0,0
db "left$",0
db "10",0
db "0",0
db "8",0
db "0",0
db "0",0
; LN:4918 DATA "mod",FCN,0,9,0,0
db "mod",0
db "10",0
db "0",0
db "9",0
db "0",0
db "0",0
; LN:4919 DATA "chr$",FCN,0,10,0,0
db "chr$",0
db "10",0
db "0",0
db "10",0
db "0",0
db "0",0
; LN:4920 DATA "right$",FCN,0,11,0,0
db "right$",0
db "10",0
db "0",0
db "11",0
db "0",0
db "0",0
; LN:4921 DATA "asc",FCN,0,12,0,0
db "asc",0
db "10",0
db "0",0
db "12",0
db "0",0
db "0",0
; LN:4922 DATA "not",FCN,0,13,0,0
db "not",0
db "10",0
db "0",0
db "13",0
db "0",0
db "0",0
; LN:4923 DATA "bufadr",FCN,0,14,0,0
db "bufadr",0
db "10",0
db "0",0
db "14",0
db "0",0
db "0",0
; LN:4924 DATA "bufsiz",FCN,0,15,0,0
db "bufsiz",0
db "10",0
db "0",0
db "15",0
db "0",0
db "0",0
; LN:4925 DATA "tab",FCN,0,16,0,0
db "tab",0
db "10",0
db "0",0
db "16",0
db "0",0
db "0",0
; LN:4926 DATA "peek",FCN,0,17,0,0
db "peek",0
db "10",0
db "0",0
db "17",0
db "0",0
db "0",0
; LN:4927 DATA "addr",FCN,0,18,0,0
db "addr",0
db "10",0
db "0",0
db "18",0
db "0",0
db "0",0
; LN:4928 DATA "lxor",FCN,0,19,0,0
db "lxor",0
db "10",0
db "0",0
db "19",0
db "0",0
db "0",0
; LN:4929 DATA "lnot",FCN,0,20,0,0
db "lnot",0
db "10",0
db "0",0
db "20",0
db "0",0
db "0",0
; LN:4930 DATA "index",FCN,0,21,0,0
db "index",0
db "10",0
db "0",0
db "21",0
db "0",0
db "0",0
; LN:4931 DATA "size",FCN,0,22,0,0
db "size",0
db "10",0
db "0",0
db "22",0
db "0",0
db "0",0
; LN:4932 DATA "ival",FCN,0,23,0,0
db "ival",0
db "10",0
db "0",0
db "23",0
db "0",0
db "0",0
; LN:4933 DATA "fval",FCN,0,24,0,0
db "fval",0
db "10",0
db "0",0
db "24",0
db "0",0
db "0",0
; LN:4934 DATA "trim$",FCN,0,25,0,0
db "trim$",0
db "10",0
db "0",0
db "25",0
db "0",0
db "0",0
; LN:4935 DATA "filsiz",FCN,0,26,0,0
db "filsiz",0
db "10",0
db "0",0
db "26",0
db "0",0
db "0",0
; LN:4936 DATA "filpos",FCN,0,27,0,0
db "filpos",0
db "10",0
db "0",0
db "27",0
db "0",0
db "0",0
; LN:4937 DATA "sqr",FCN,0,28,0,0
db "sqr",0
db "10",0
db "0",0
db "28",0
db "0",0
db "0",0
; LN:4938 DATA "int",FCN,0,29,0,0
db "int",0
db "10",0
db "0",0
db "29",0
db "0",0
db "0",0
; LN:4939 DATA "abs",FCN,0,30,0,0
db "abs",0
db "10",0
db "0",0
db "30",0
db "0",0
db "0",0
; LN:4940 DATA "sin",FCN,0,31,0,0
db "sin",0
db "10",0
db "0",0
db "31",0
db "0",0
db "0",0
; LN:4941 DATA "cos",FCN,0,32,0,0
db "cos",0
db "10",0
db "0",0
db "32",0
db "0",0
db "0",0
; LN:4942 DATA "tan",FCN,0,33,0,0
db "tan",0
db "10",0
db "0",0
db "33",0
db "0",0
db "0",0
; LN:4943 DATA "asn",FCN,0,34,0,0
db "asn",0
db "10",0
db "0",0
db "34",0
db "0",0
db "0",0
; LN:4944 DATA "acs",FCN,0,35,0,0
db "acs",0
db "10",0
db "0",0
db "35",0
db "0",0
db "0",0
; LN:4945 DATA "atn",FCN,0,36,0,0
db "atn",0
db "10",0
db "0",0
db "36",0
db "0",0
db "0",0
; LN:4946 DATA "log",FCN,0,37,0,0
db "log",0
db "10",0
db "0",0
db "37",0
db "0",0
db "0",0
; LN:4947 DATA "log10",FCN,0,38,0,0
db "log10",0
db "10",0
db "0",0
db "38",0
db "0",0
db "0",0
; LN:4948 DATA "Vacant",FCN,0,39,0,0
db "Vacant",0
db "10",0
db "0",0
db "39",0
db "0",0
db "0",0
; LN:4949 DATA "Vacant",FCN,0,40,0,0
db "Vacant",0
db "10",0
db "0",0
db "40",0
db "0",0
db "0",0
; LN:4950 DATA "thour",FCN,0,41,0,0
db "thour",0
db "10",0
db "0",0
db "41",0
db "0",0
db "0",0
; LN:4951 DATA "tmin",FCN,0,42,0,0
db "tmin",0
db "10",0
db "0",0
db "42",0
db "0",0
db "0",0
; LN:4952 DATA "tsec",FCN,0,43,0,0
db "tsec",0
db "10",0
db "0",0
db "43",0
db "0",0
db "0",0
; LN:4953 DATA "tyear",FCN,0,44,0,0
db "tyear",0
db "10",0
db "0",0
db "44",0
db "0",0
db "0",0
; LN:4954 DATA "tmon",FCN,0,45,0,0
db "tmon",0
db "10",0
db "0",0
db "45",0
db "0",0
db "0",0
; LN:4955 DATA "tdat",FCN,0,46,0,0
db "tdat",0
db "10",0
db "0",0
db "46",0
db "0",0
db "0",0
; LN:4956 DATA "tday",FCN,0,47,0,0
db "tday",0
db "10",0
db "0",0
db "47",0
db "0",0
db "0",0
; LN:4957 DATA "chkword",FCN,0,48,0,0
db "chkword",0
db "10",0
db "0",0
db "48",0
db "0",0
db "0",0
; LN:4958 DATA "hex$",FCN,0,49,0,0
db "hex$",0
db "10",0
db "0",0
db "49",0
db "0",0
db "0",0
; LN:4959 DATA "bittst",FCN,0,50,0,0
db "bittst",0
db "10",0
db "0",0
db "50",0
db "0",0
db "0",0
; LN:4960 DATA "shl",FCN,0,51,0,0
db "shl",0
db "10",0
db "0",0
db "51",0
db "0",0
db "0",0
; LN:4961 DATA "shr",FCN,0,52,0,0
db "shr",0
db "10",0
db "0",0
db "52",0
db "0",0
db "0",0
; LN:4962 DATA "rol",FCN,0,53,0,0
db "rol",0
db "10",0
db "0",0
db "53",0
db "0",0
db "0",0
; LN:4963 DATA "ror",FCN,0,54,0,0
db "ror",0
db "10",0
db "0",0
db "54",0
db "0",0
db "0",0
; LN:4964 DATA "bitchg",FCN,0,55,0,0
db "bitchg",0
db "10",0
db "0",0
db "55",0
db "0",0
db "0",0
; LN:4965 DATA "bitclr",FCN,0,56,0,0
db "bitclr",0
db "10",0
db "0",0
db "56",0
db "0",0
db "0",0
; LN:4966 DATA "bitset",FCN,0,57,0,0
db "bitset",0
db "10",0
db "0",0
db "57",0
db "0",0
db "0",0
; LN:4967 DATA "substr",FCN,0,56,0,0
db "substr",0
db "10",0
db "0",0
db "56",0
db "0",0
db "0",0
; LN:4968 DATA "zstr$",FCN,0,59,0,0
db "zstr$",0
db "10",0
db "0",0
db "59",0
db "0",0
db "0",0
; LN:4969 DATA "zhex$",FCN,0,60,0,0
db "zhex$",0
db "10",0
db "0",0
db "60",0
db "0",0
db "0",0
; LN:4970 DATA "using",FCN,0,61,0,0
db "using",0
db "10",0
db "0",0
db "61",0
db "0",0
db "0",0
; LN:4971 DATA "ERR",LONGVAR,0,0,0,4
db "ERR",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4972 DATA "_BufSize",0,0,0,0,0
db "_BufSize",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4973 DATA "POS",LONGVAR,0,0,0,4
db "POS",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4974 DATA "_DummyArg",LONGVAR,0,0,0,4
db "_DummyArg",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4975 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4976 DATA "_IOBuffer",STRINGVAR,VectorBit,_BufSize,_BufSize,_BufSize
db "_IOBuffer",0
db "6",0
db "32",0
db "500",0
db "500",0
db "500",0
; LN:4977 DATA "_PrintBuf",STRINGVAR,VectorBit,_BufSize,_BufSize,_BufSize
db "_PrintBuf",0
db "6",0
db "32",0
db "500",0
db "500",0
db "500",0
; LN:4978 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4979 DATA "_Digits",WORDVAR,0,0,0,2
db "_Digits",0
db "3",0
db "0",0
db "0",0
db "0",0
db "2",0
; LN:4980 DATA "_Decimals",WORDVAR,0,0,0,2
db "_Decimals",0
db "3",0
db "0",0
db "0",0
db "0",0
db "2",0
; LN:4981 DATA "STATUS",LONGVAR,0,0,0,4
db "STATUS",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4982 DATA "_ArgSafe0",LONGVAR,0,0,0,4
db "_ArgSafe0",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4983 DATA "_ArgSafe1",LONGVAR,0,0,0,4
db "_ArgSafe1",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4984 DATA "_IOPthNum",LONGVAR,0,0,0,2
db "_IOPthNum",0
db "4",0
db "0",0
db "0",0
db "0",0
db "2",0
; LN:4985 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4986 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4987 DATA "_IOBufPtr",LONGVAR,0,0,0,4
db "_IOBufPtr",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4988 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4989 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4990 DATA "_DataPtr",LONGVAR,0,0,0,4
db "_DataPtr",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:4991 DATA "ProgramName",STRINGVAR,VectorBit,28,28,28
db "ProgramName",0
db "6",0
db "32",0
db "28",0
db "28",0
db "28",0
; LN:4992 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4993 DATA "_ConvBuf",STRINGVAR,VectorBit,32,32,32
db "_ConvBuf",0
db "6",0
db "32",0
db "32",0
db "32",0
db "32",0
; LN:4994 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4995 DATA "_ConvBuf1",STRINGVAR,VectorBit,32,32,32
db "_ConvBuf1",0
db "6",0
db "32",0
db "32",0
db "32",0
db "32",0
; LN:4996 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:4997 DATA "_Tmp1",LONGVAR,TempBit,0,0,4
db "_Tmp1",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:4998 DATA "_Tmp2",LONGVAR,TempBit,0,0,4
db "_Tmp2",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:4999 DATA "_Tmp3",LONGVAR,TempBit,0,0,4
db "_Tmp3",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5000 DATA "_Tmp4",LONGVAR,TempBit,0,0,4
db "_Tmp4",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5001 DATA "_Tmp5",LONGVAR,TempBit,0,0,4
db "_Tmp5",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5002 DATA "_Tmp6",LONGVAR,TempBit,0,0,4
db "_Tmp6",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5003 DATA "_Tmp7",LONGVAR,TempBit,0,0,4
db "_Tmp7",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5004 DATA "_Tmp8",LONGVAR,TempBit,0,0,4
db "_Tmp8",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5005 DATA "_Tmp9",LONGVAR,TempBit,0,0,4
db "_Tmp9",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5006 DATA "_Tmp10",LONGVAR,TempBit,0,0,4
db "_Tmp10",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5007 DATA "_Tmp11",LONGVAR,TempBit,0,0,4
db "_Tmp11",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5008 DATA "_Tmp12",LONGVAR,TempBit,0,0,4
db "_Tmp12",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5009 DATA "_Tmp13",LONGVAR,TempBit,0,0,4
db "_Tmp13",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5010 DATA "_Tmp14",LONGVAR,TempBit,0,0,4
db "_Tmp14",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5011 DATA "_Tmp15",LONGVAR,TempBit,0,0,4
db "_Tmp15",0
db "4",0
db "64",0
db "0",0
db "0",0
db "4",0
; LN:5012 DATA "_TmpVec1",VOIDX,TmpVec,0,0,12
db "_TmpVec1",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5013 DATA "_TmpVec2",VOIDX,TmpVec,0,0,12
db "_TmpVec2",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5014 DATA "_TmpVec3",VOIDX,TmpVec,0,0,12
db "_TmpVec3",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5015 DATA "_TmpVec4",VOIDX,TmpVec,0,0,12
db "_TmpVec4",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5016 DATA "_TmpVec5",VOIDX,TmpVec,0,0,12
db "_TmpVec5",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5017 DATA "_TmpVec6",VOIDX,TmpVec,0,0,12
db "_TmpVec6",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5018 DATA "_TmpVec7",VOIDX,TmpVec,0,0,12
db "_TmpVec7",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5019 DATA "_TmpVec8",VOIDX,TmpVec,0,0,12
db "_TmpVec8",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5020 DATA "_TmpVec9",VOIDX,TmpVec,0,0,12
db "_TmpVec9",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5021 DATA "_TmpVec10",VOIDX,TmpVec,0,0,12
db "_TmpVec10",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5022 DATA "_TmpVec11",VOIDX,TmpVec,0,0,12
db "_TmpVec11",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5023 DATA "_TmpVec12",VOIDX,TmpVec,0,0,12
db "_TmpVec12",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5024 DATA "_TmpVec13",VOIDX,TmpVec,0,0,12
db "_TmpVec13",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5025 DATA "_TmpVec14",VOIDX,TmpVec,0,0,12
db "_TmpVec14",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5026 DATA "_TmpVec15",VOIDX,TmpVec,0,0,12
db "_TmpVec15",0
db "13",0
db "96",0
db "0",0
db "0",0
db "12",0
; LN:5027 DATA "&",9,0,0,0,0
db "&",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:5028 DATA "|",9,0,0,0,0
db "|",0
db "9",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:5029 DATA "0BUGBUG",FLOATVAR,ConstBit,0,0,8
db "0BUGBUG",0
db "5",0
db "4",0
db "0",0
db "0",0
db "8",0
; LN:5030 DATA "NextArg",6,TmpVec,0,0,0
db "NextArg",0
db "6",0
db "96",0
db "0",0
db "0",0
db "0",0
; LN:5031 DATA "XferCount",4,0,0,0,0
db "XferCount",0
db "4",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:5032 DATA "_FTmp1",FLOATVAR,0,0,0,8
db "_FTmp1",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5033 DATA "_FTmp2",FLOATVAR,0,0,0,8
db "_FTmp2",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5034 DATA "_FTmp3",FLOATVAR,0,0,0,8
db "_FTmp3",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5035 DATA "_FTmp4",FLOATVAR,0,0,0,8
db "_FTmp4",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5036 DATA "_FTmp5",FLOATVAR,0,0,0,8
db "_FTmp5",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5037 DATA "_FTmp6",FLOATVAR,0,0,0,8
db "_FTmp6",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5038 DATA "_FTmp7",FLOATVAR,0,0,0,8
db "_FTmp7",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5039 DATA "_FTmp8",FLOATVAR,0,0,0,8
db "_FTmp8",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5040 DATA "_FTmp9",FLOATVAR,0,0,0,8
db "_FTmp9",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5041 DATA "_FTmp10",FLOATVAR,0,0,0,8
db "_FTmp10",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5042 DATA "_FTmp11",FLOATVAR,0,0,0,8
db "_FTmp11",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5043 DATA "_FTmp12",FLOATVAR,0,0,0,8
db "_FTmp12",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5044 DATA "_FTmp13",FLOATVAR,0,0,0,8
db "_FTmp13",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5045 DATA "_FTmp14",FLOATVAR,0,0,0,8
db "_FTmp14",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5046 DATA "_FTmp15",FLOATVAR,0,0,0,8
db "_FTmp15",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5047 DATA "TRUE",BOOLVAR,4,1,0,0
db "TRUE",0
db "1",0
db "4",0
db "1",0
db "0",0
db "0",0
; LN:5048 DATA "True",BOOLVAR,4,1,0,0
db "True",0
db "1",0
db "4",0
db "1",0
db "0",0
db "0",0
; LN:5049 DATA "FALSE",BOOLVAR,4,0,0,0
db "FALSE",0
db "1",0
db "4",0
db "0",0
db "0",0
db "0",0
; LN:5050 DATA "False",BOOLVAR,4,0,0,0
db "False",0
db "1",0
db "4",0
db "0",0
db "0",0
db "0",0
; LN:5051 DATA "sal",FCN,0,62,0,0
db "sal",0
db "10",0
db "0",0
db "62",0
db "0",0
db "0",0
; LN:5052 DATA "sar",FCN,0,63,0,0
db "sar",0
db "10",0
db "0",0
db "63",0
db "0",0
db "0",0
; LN:5053 DATA "rcl",FCN,0,64,0,0
db "rcl",0
db "10",0
db "0",0
db "64",0
db "0",0
db "0",0
; LN:5054 DATA "rcr",FCN,0,65,0,0
db "rcr",0
db "10",0
db "0",0
db "65",0
db "0",0
db "0",0
; LN:5055 DATA "tablesize",FCN,0,66,0,0
db "tablesize",0
db "10",0
db "0",0
db "66",0
db "0",0
db "0",0
; LN:5056 DATA "filtyp",FCN,0,67,0,0
db "filtyp",0
db "10",0
db "0",0
db "67",0
db "0",0
db "0",0
; LN:5057 DATA "curdir",FCN,0,68,0,0
db "curdir",0
db "10",0
db "0",0
db "68",0
db "0",0
db "0",0
; LN:5058 DATA "bin$",FCN,0,69,0,0
db "bin$",0
db "10",0
db "0",0
db "69",0
db "0",0
db "0",0
; LN:5059 DATA "oct$",FCN,0,70,0,0
db "oct$",0
db "10",0
db "0",0
db "70",0
db "0",0
db "0",0
; LN:5060 DATA "Vacant",FCN,0,71,0,0
db "Vacant",0
db "10",0
db "0",0
db "71",0
db "0",0
db "0",0
; LN:5061 DATA "rnd",FCN,0,72,0,0
db "rnd",0
db "10",0
db "0",0
db "72",0
db "0",0
db "0",0
; LN:5062 DATA "Vacant",FCN,0,73,0,0
db "Vacant",0
db "10",0
db "0",0
db "73",0
db "0",0
db "0",0
; LN:5063 DATA "Vacant",FCN,0,74,0,0
db "Vacant",0
db "10",0
db "0",0
db "74",0
db "0",0
db "0",0
; LN:5064 DATA "Vacant",FCN,0,75,0,0
db "Vacant",0
db "10",0
db "0",0
db "75",0
db "0",0
db "0",0
; LN:5065 DATA "Vacant",FCN,0,76,0,0
db "Vacant",0
db "10",0
db "0",0
db "76",0
db "0",0
db "0",0
; LN:5066 DATA "Vacant",FCN,0,77,0,0
db "Vacant",0
db "10",0
db "0",0
db "77",0
db "0",0
db "0",0
; LN:5067 DATA "lcase$",FCN,0,78,0,0
db "lcase$",0
db "10",0
db "0",0
db "78",0
db "0",0
db "0",0
; LN:5068 DATA "ucase$",FCN,0,79,0,0
db "ucase$",0
db "10",0
db "0",0
db "79",0
db "0",0
db "0",0
; LN:5069 DATA "tail$",FCN,0,80,0,0
db "tail$",0
db "10",0
db "0",0
db "80",0
db "0",0
db "0",0
; LN:5070 DATA "findaddr",FCN,0,81,0,0
db "findaddr",0
db "10",0
db "0",0
db "81",0
db "0",0
db "0",0
; LN:5071 DATA "findoffs",FCN,0,82,0,0
db "findoffs",0
db "10",0
db "0",0
db "82",0
db "0",0
db "0",0
; LN:5072 DATA "Vacant",0,0,0,0,0
db "Vacant",0
db "0",0
db "0",0
db "0",0
db "0",0
db "0",0
; LN:5073 DATA "_BoolRet",BOOLVAR,0,0,0,1
db "_BoolRet",0
db "1",0
db "0",0
db "0",0
db "0",0
db "1",0
; LN:5074 DATA "_LongRet",LONGVAR,0,0,0,4
db "_LongRet",0
db "4",0
db "0",0
db "0",0
db "0",0
db "4",0
; LN:5075 DATA "_StringRet",STRINGVAR,VectorBit,0,0,0
db "_StringRet",0
db "6",0
db "32",0
db "0",0
db "0",0
db "0",0
; LN:5076 DATA "_FloatRet",FLOATVAR,0,0,0,8
db "_FloatRet",0
db "5",0
db "0",0
db "0",0
db "0",0
db "8",0
; LN:5077 DATA "%"
db "%",0
_StrConst723 db "data",0
_StrConst724 db "end",0
_StrConst725 db "; Automatic END statement",0
_StrConst726 db "xor eax,eax",0
_StrConst727 db "invoke ExitProcess, eax",0
_StrConst728 db "_ErrExit:",0
_StrConst729 db "cinvoke puts,_ErrExitMsg",0
_StrConst730 db "mov eax,[ERR]",0
_StrConst731 db "invoke ExitProcess, eax",0
_StrConst732 db "; End of Declaration Section",0
_StrConst733 db "; End of Initialized Data Section",0
_StrConst734 db "; Start of Uninitialized Data Section",0
_StrConst735 db "; End of Uninitialized Data Section",0
_StrConst736 db "; End of PreCode Section",0
_StrConst737 db "; End of Code Section",0
_StrConst738 db "; End of Function Section",0
_StrConst739 db "; End of Export Section",0
_StrConst740 db ".asm",0
_StrConst741 db ".asm",0
_StrConst742 db "_DeclareFile",0
;Memory Buffer
FileBuf dd 0
 dd 0
_StrConst743 db "_DeclareFile",0
_StrConst744 db "_DataFile",0
_StrConst745 db "_DataFile",0
_StrConst746 db "_DimFile",0
_StrConst747 db "_DimFile",0
_StrConst748 db "_ImportFile.asm",0
_StrConst749 db "_PreCodeFile",0
_StrConst750 db "_PreCodeFile",0
_StrConst751 db "_CodeFile",0
_StrConst752 db "_CodeFile",0
_StrConst753 db "_FunctionFile",0
_StrConst754 db "_FunctionFile",0
_StrConst755 db "_ExportFile",0
_StrConst756 db "_ExportFile",0
_StrConst757 db "_ResourceFile",0
_StrConst758 db "_ResourceFile",0
_StrConst759 db "Label unresolved: ",0
_StrConst760 db "Function or procedure unresolved: ",0
_StrConst761 db "Unbalanced control structure in line ",0
_StrConst762 db "Unbalanced conditional stack",0
_StrConst763 db "Procedure or function not complete",0
_StrConst764 db "Assemble:",0
_StrConst765 db "fasm ",0
_StrConst766 db " ",0
_StrConst767 db ".exe",0
_StrConst768 db ".asm",0
_StrConst769 db ">>>> ^^^^^^^^^^^^^^^^^^^^^^^ >> >>>> >>>>>>>> >>>>>>>> >>>>>>>>",0
_StrConst770 db "Symbol Table:",0
_StrConst771 db "Sym#",0
_StrConst772 db "Symbol Name",0
_StrConst773 db "DT",0
_StrConst774 db "DM",0
_StrConst775 db "Detail",0
_StrConst776 db "DataAddr",0
_StrConst777 db "DataSize",0
_StrConst778 db "Link",0
_StrConst779 db ".......................",0
_StrConst780 db "%",0
_StrConst781 db "Symbol Table:",0
_StrConst782 db " ",0
_StrConst783 db "%",0
_StrConst784 db "Cannot open file: ",0
_StrConst785 db "ob file [opts] {CompVar=Const}",0
_StrConst786 db "Options:",0
_StrConst787 db "    -a        Compile to assembler (.asm file)",0
_StrConst788 db "    -d        Compile to DLL",0
_StrConst789 db "    -e        Compile with no output but check for errors",0
_StrConst790 db "    -h        Halt Compile on first error encountered",0
_StrConst791 db "    -g        Compile GUI (Windows) program",0
_StrConst792 db "    -s        Symbol Table Dump to stdout",0
_StrConst793 db "    -u        Unabridged symbol table dump",0
_StrConst794 db "as",0
_StrConst795 db "boolean",0
_StrConst796 db " rb ",0
_StrConst797 db "byte",0
_StrConst798 db " rb ",0
_StrConst799 db "integer",0
_StrConst800 db " rw ",0
_StrConst801 db "long",0
_StrConst802 db " rd ",0
_StrConst803 db "label",0
_StrConst804 db " rd ",0
_StrConst805 db "double",0
_StrConst806 db " rf ",0
_StrConst807 db "string",0
_StrConst808 db " rb ",0
_StrConst809 db "*",0
_StrConst810 db " rb ",0
_StrConst811 db ";",0
_StrConst812 db "pointer",0
_StrConst813 db " rd ",0
_StrConst814 db "vector",0
_StrConst815 db " rd 1",0
_StrConst816 db "align 4",0
_StrConst817 db " dd ",0
_StrConst818 db "+12",0
_StrConst819 db " dd ",0
_StrConst820 db " dd 0",0
_StrConst821 db " rb ",0
_StrConst822 db "align 4",0
_StrConst823 db " rd 3",0
_StrConst824 db " rb ",0
_StrConst825 db "align 4",0
_StrConst826 db "align 2",0
_StrConst827 db "align 4",0
_StrConst828 db "1",0
_StrConst829 db ",",0
_StrConst830 db "#",0
_StrConst831 db ",",0
_StrConst832 db "[",0
_StrConst833 db "]",0
_StrConst834 db ".",0
_StrConst835 db "+",0
_StrConst836 db "-",0
_StrConst837 db "*",0
_StrConst838 db "/",0
_StrConst839 db "&",0
_StrConst840 db "|",0
_StrConst841 db "(",0
_StrConst842 db ")",0
_StrConst843 db ".",0
_StrConst844 db "()",0
_StrConst845 db ".",0
_StrConst846 db ".",0
_StrConst847 db "_StrConst",0
_StrConst848 db "%",0
_StrConst849 db "(",0
_StrConst850 db ")",0
_StrConst851 db "*",0
_StrConst852 db "/",0
_StrConst853 db "&",0
_StrConst854 db "+",0
_StrConst855 db "-",0
_StrConst856 db "*",0
_StrConst857 db "/",0
_StrConst858 db "&",0
_StrConst859 db "|",0
_StrConst860 db "+",0
_StrConst861 db "-",0
_StrConst862 db "|",0
_StrConst863 db "mov esi,[",0
_StrConst864 db "]",0
_StrConst865 db "add esi,",0
_StrConst866 db "mov [",0
_StrConst867 db "],esi",0
_StrConst868 db "mov [",0
_StrConst869 db "+4],",0
_StrConst870 db "mov [",0
_StrConst871 db "+8],0",0
_StrConst872 db "mov [",0
_StrConst873 db "],esi",0
_StrConst874 db "mov [",0
_StrConst875 db "+4],",0
_StrConst876 db "mov [",0
_StrConst877 db "+8],0",0
_StrConst878 db "call ",0
align 4
_Table1:
dd F1
dd F2
dd F3
dd F4
dd F5
dd F6
dd F7
dd F8
dd F9
dd F10
dd F11
dd F12
dd F13
dd F14
dd F15
dd F16
dd F17
dd F18
dd F19
dd F20
dd F21
dd F22
dd F23
dd F24
dd F25
dd F26
dd F27
dd F28
dd F29
dd F30
dd F31
dd F32
dd F33
dd F34
dd F35
dd F36
dd F37
dd F38
dd F39
dd F40
dd F41
dd F42
dd F43
dd F44
dd F45
dd F46
dd F47
dd F48
dd F49
dd F50
align 4
_Table2:
dd F51
dd F52
dd F53
dd F54
dd F55
dd F56
dd F57
dd F58
dd F59
dd F60
dd F61
dd F62
dd F63
dd F64
dd F65
dd F66
dd F67
dd F68
dd F69
dd F70
dd F71
dd F72
dd F73
dd F74
dd F75
dd F76
dd F77
dd F78
dd F79
dd F80
dd F81
dd F82
_StrConst879 db "mov eax,[",0
_StrConst880 db "]",0
_StrConst881 db "add eax,[",0
_StrConst882 db "]",0
_StrConst883 db "mov [",0
_StrConst884 db "],eax",0
_StrConst885 db "mov [",0
_StrConst886 db "+4],",0
_StrConst887 db "mov [",0
_StrConst888 db "+8],0",0
_StrConst889 db "mov esi,",0
_StrConst890 db "mov [",0
_StrConst891 db "+8],esi",0
_StrConst892 db "mov [",0
_StrConst893 db "],",0
_StrConst894 db "mov esi,",0
_StrConst895 db "mov esi,0-(",0
_StrConst896 db "*",0
_StrConst897 db ")",0
_StrConst898 db "mov esi,[",0
_StrConst899 db "]",0
_StrConst900 db "add esi,",0
_StrConst901 db "mov esi,",0
_StrConst902 db "-(",0
_StrConst903 db "*",0
_StrConst904 db ")",0
_StrConst905 db "+",0
_StrConst906 db "mov esi,",0
_StrConst907 db "+",0
_StrConst908 db "mov esi,",0
_StrConst909 db "shl eax,1",0
_StrConst910 db "shl eax,2",0
_StrConst911 db "shl eax,3",0
_StrConst912 db "shl eax,4",0
_StrConst913 db "shl eax,5",0
_StrConst914 db "shl eax,6",0
_StrConst915 db "shl eax,7",0
_StrConst916 db "shl eax,8",0
_StrConst917 db "shl eax,9",0
_StrConst918 db "shl eax,10",0
_StrConst919 db "imul eax,",0
_StrConst920 db "add esi,eax;",0
_StrConst921 db "mov edx,eax",0
_StrConst922 db "eax=eax*",0
_StrConst923 db "*",0
_StrConst924 db "+",0
_StrConst925 db "*edx",0
_StrConst926 db "add esi,eax",0
_StrConst927 db "mov edi,eax",0
_StrConst928 db "eax=edi*",0
_StrConst929 db "*",0
_StrConst930 db "+eax*",0
_StrConst931 db "*",0
_StrConst932 db "*",0
_StrConst933 db ";",0
_StrConst934 db "eax=eax+",0
_StrConst935 db "*edx;",0
_StrConst936 db "add esi,eax",0
_StrConst937 db "mov [",0
_StrConst938 db "],esi",0
_StrConst939 db "mov [",0
_StrConst940 db "+4],",0
_StrConst941 db "mov [",0
_StrConst942 db "+8],0",0
_StrConst943 db "-",0
_StrConst944 db "1",0
_StrConst945 db "a",0
_StrConst946 db "h",0
_StrConst947 db "g",0
_StrConst948 db "d",0
_StrConst949 db "e",0
_StrConst950 db "s",0
_StrConst951 db "u",0
_StrConst952 db "Unknown option ",0
_StrConst953 db "cmp eax,-1",0
_StrConst954 db "jg _OELbl",0
_StrConst955 db "invoke GetLastError",0
_StrConst956 db "mov [ERR],eax",0
_StrConst957 db "jmp [_ErrVec]",0
_StrConst958 db "_OELbl",0
_StrConst959 db ":",0
_StrConst960 db "cmp eax,0",0
_StrConst961 db "jne _OELbl",0
_StrConst962 db "invoke GetLastError",0
_StrConst963 db "mov [ERR],eax",0
_StrConst964 db "jmp [_ErrVec]",0
_StrConst965 db "_OELbl",0
_StrConst966 db ":",0
_StrConst967 db "dir",0
_StrConst968 db "+",0
_StrConst969 db "A_WRITE|A_CREAT|A_EXCL",0
_StrConst970 db "update",0
_StrConst971 db "A_UPDATE",0
_StrConst972 db "read",0
_StrConst973 db "P_READ",0
_StrConst974 db "A_READ",0
_StrConst975 db "write",0
_StrConst976 db "P_WRITE|P_READ",0
_StrConst977 db "A_WRITE",0
_StrConst978 db "+",0
_StrConst979 db "dir",0
_StrConst980 db "binary",0
_StrConst981 db "|A_BINARY",0
_StrConst982 db "text",0
_StrConst983 db "#",0
_StrConst984 db "~",0
_StrConst985 db "mov [_IOPthNum],eax",0
_StrConst986 db ",",0
_StrConst987 db "mov edi,_IOBuffer",0
_StrConst988 db "mov esi,",0
_StrConst989 db "call __MovStr",0
_StrConst990 db "mov [_XferAddr],eax",0
_StrConst991 db "mov [XferCount],eax",0
_StrConst992 db "mov [_XferAddr],esi",0
_StrConst993 db "mov [XferCount],",0
_StrConst994 db "mov [_XferAddr],esi",0
_StrConst995 db "mov [_ByteCounter],",0
_StrConst996 db "eax",0
_StrConst997 db "edx",0
_StrConst998 db "eaxf",0
_StrConst999 db "edxf",0
_StrConst1000 db "al",0
_StrConst1001 db "al",0
_StrConst1002 db "ax",0
_StrConst1003 db "eax",0
_StrConst1004 db "dl",0
_StrConst1005 db "dl",0
_StrConst1006 db "dx",0
_StrConst1007 db "edx",0
_StrConst1008 db "mov ",0
_StrConst1009 db ",",0
_StrConst1010 db "mov ",0
_StrConst1011 db ",",0
_StrConst1012 db "[",0
_StrConst1013 db "]",0
_StrConst1014 db "mov edi,[",0
_StrConst1015 db "]",0
_StrConst1016 db "mov ",0
_StrConst1017 db ",",0
_StrConst1018 db "[edi]",0
_StrConst1019 db "al",0
_StrConst1020 db " byte ",0
_StrConst1021 db "al",0
_StrConst1022 db " byte ",0
_StrConst1023 db "ax",0
_StrConst1024 db " word ",0
_StrConst1025 db "eax",0
_StrConst1026 db " dword ",0
_StrConst1027 db "floatreg",0
_StrConst1028 db " qword ",0
_StrConst1029 db "eax",0
_StrConst1030 db " dword ",0
_StrConst1031 db "mov",0
_StrConst1032 db "[",0
_StrConst1033 db "],",0
_StrConst1034 db "eax",0
_StrConst1035 db "mov esi,",0
_StrConst1036 db "mov esi,[",0
_StrConst1037 db "]",0
_StrConst1038 db "mov",0
_StrConst1039 db "[esi],",0
_StrConst1040 db "Temporary Variable",0
_StrConst1041 db "_Tmp",0
_StrConst1042 db " rd 1",0
_StrConst1043 db "_Tmp",0
_StrConst1044 db "Temporary Floating Point Variable",0
_StrConst1045 db ";static double _FTmp",0
_StrConst1046 db ";",0
_StrConst1047 db "_FTmp",0
_StrConst1048 db "Temporary String Variable",0
_StrConst1049 db "_StrTmp",0
_StrConst1050 db " rb 32",0
_StrConst1051 db "mov esi,_StrTmp",0
_StrConst1052 db "Temporary Character Variable",0
_StrConst1053 db "_ChrTmp",0
_StrConst1054 db " rb 1",0
_StrConst1055 db "mov esi,_ChrTmp",0
_StrConst1056 db "mov [",0
_StrConst1057 db "],esi",0
_StrConst1058 db "mov [",0
_StrConst1059 db "+4],",0
_StrConst1060 db "mov [",0
_StrConst1061 db "+8],0",0
_StrConst1062 db "_TmpVec",0
_StrConst1063 db "Temporary Vector",0
_StrConst1064 db "_TmpVec",0
_StrConst1065 db " rd 3",0
_StrConst1066 db "mov edi,[",0
_StrConst1067 db "]",0
_StrConst1068 db "add edi,",0
_StrConst1069 db "mov [",0
_StrConst1070 db "],edi",0
_StrConst1071 db "mov edi,[",0
_StrConst1072 db "+4]",0
_StrConst1073 db "mov [",0
_StrConst1074 db "+4],edi",0
_StrConst1075 db "mov edi,[",0
_StrConst1076 db "+8]",0
_StrConst1077 db "mov [",0
_StrConst1078 db "+8],edi",0
_StrConst1079 db "mov [",0
_StrConst1080 db "],esi",0
_StrConst1081 db "%",0
_StrConst1082 db "For Loop Vector",0
_StrConst1083 db "_LopVec",0
_StrConst1084 db " rd 2",0
_StrConst1085 db "and eax,edx",0
_StrConst1086 db "or eax,edx",0
_StrConst1087 db "add ",0
_StrConst1088 db ",",0
_StrConst1089 db "sub ",0
_StrConst1090 db ",",0
_StrConst1091 db "imul ",0
_StrConst1092 db "mov ecx,edx",0
_StrConst1093 db "xor edx,edx",0
_StrConst1094 db "idiv ecx",0
_StrConst1095 db "cmp al,dl",0
_StrConst1096 db "cmp ",0
_StrConst1097 db ",",0
_StrConst1098 db "bl",0
_StrConst1099 db "mov edi,",0
_StrConst1100 db "mov esi,",0
_StrConst1101 db "call __CmpStr",0
_StrConst1102 db "bl",0
_StrConst1103 db ".",0
_StrConst1104 db "0",0
_StrConst1105 db "9",0
_StrConst1106 db "'",0
_StrConst1107 db ";",0
_StrConst1108 db "<",0
_StrConst1109 db ">",0
_StrConst1110 db "=",0
_StrConst1111 db "=",0
_StrConst1112 db ">",0
_StrConst1113 db "=",0
_StrConst1114 db " ",0
_StrConst1115 db "(",0
_StrConst1116 db ")",0
_StrConst1117 db ",",0
_StrConst1118 db ",",0
_StrConst1119 db ";",0
_StrConst1120 db ":",0
_StrConst1121 db ".",0
_StrConst1122 db "+",0
_StrConst1123 db "-",0
_StrConst1124 db "*",0
_StrConst1125 db "/",0
_StrConst1126 db "&",0
_StrConst1127 db "|",0
_StrConst1128 db "$",0
_StrConst1129 db "_",0
_StrConst1130 db "@",0
_StrConst1131 db "0",0
_StrConst1132 db "9",0
_StrConst1133 db "A",0
_StrConst1134 db "Z",0
_StrConst1135 db "a",0
_StrConst1136 db "z",0
_StrConst1137 db " ",0
_StrConst1138 db ":",0
_StrConst1139 db ";",0
_StrConst1140 db "<",0
_StrConst1141 db ">",0
_StrConst1142 db "=",0
_StrConst1143 db "'",0
_StrConst1144 db "h",0
_StrConst1145 db "0",0
_StrConst1146 db "$",0
_StrConst1147 db "$",0
_StrConst1148 db "o",0
_StrConst1149 db "0",0
_StrConst1150 db "%",0
_StrConst1151 db "%",0
_StrConst1152 db "b",0
_StrConst1153 db "0",0
_StrConst1154 db "&",0
_StrConst1155 db "&",0
_StrConst1156 db "x",0
_StrConst1157 db "$",0
_StrConst1158 db "A",0
_StrConst1159 db "Z",0
_StrConst1160 db "$",0
_StrConst1161 db "0",0
_StrConst1162 db "9",0
_StrConst1163 db "a",0
_StrConst1164 db "z",0
_StrConst1165 db "_",0
_StrConst1166 db "0",0
_StrConst1167 db "9",0
_StrConst1168 db "_LN",0
_StrConst1169 db "0",0
_StrConst1170 db "9",0
_StrConst1171 db "A",0
_StrConst1172 db "Z",0
_StrConst1173 db "a",0
_StrConst1174 db "z",0
_StrConst1175 db "_",0
_StrConst1176 db "0",0
_StrConst1177 db "9",0
_StrConst1178 db "A",0
_StrConst1179 db "Z",0
_StrConst1180 db "a",0
_StrConst1181 db "z",0
_StrConst1182 db "_",0
_StrConst1183 db "$",0
_StrConst1184 db "0",0
_StrConst1185 db "9",0
_StrConst1186 db "0",0
_StrConst1187 db "9",0
_StrConst1188 db "a",0
_StrConst1189 db "f",0
_StrConst1190 db "0",0
_StrConst1191 db "9",0
_StrConst1192 db ".",0
_StrConst1193 db "=",0
_StrConst1194 db "<",0
_StrConst1195 db "=",0
_StrConst1196 db "sete ",0
_StrConst1197 db "setne ",0
_StrConst1198 db "=",0
_StrConst1199 db "<>",0
_StrConst1200 db "true",0
_StrConst1201 db "sete ",0
_StrConst1202 db "=",0
_StrConst1203 db "sete ",0
_StrConst1204 db "je ",0
_StrConst1205 db "jne ",0
_StrConst1206 db "<",0
_StrConst1207 db "setl ",0
_StrConst1208 db "jnl ",0
_StrConst1209 db "jge ",0
_StrConst1210 db ">",0
_StrConst1211 db "setg ",0
_StrConst1212 db "jg ",0
_StrConst1213 db "jle ",0
_StrConst1214 db "<=",0
_StrConst1215 db "setle ",0
_StrConst1216 db "jle ",0
_StrConst1217 db "jg ",0
_StrConst1218 db ">=",0
_StrConst1219 db "setge ",0
_StrConst1220 db "ge ",0
_StrConst1221 db "jl ",0
_StrConst1222 db "<>",0
_StrConst1223 db "setne ",0
_StrConst1224 db "jne ",0
_StrConst1225 db "je ",0
_StrConst1226 db "or",0
_StrConst1227 db "and",0
_StrConst1228 db "xor bh,bh",0
_StrConst1229 db "and bh,bl",0
_StrConst1230 db "or bh,bl",0
_StrConst1231 db "and",0
_StrConst1232 db "or",0
_StrConst1233 db "(",0
_StrConst1234 db ")",0
_StrConst1235 db ")",0
_StrConst1236 db ",",0
_StrConst1237 db "0",0
_StrConst1238 db "9",0
_StrConst1239 db ",",0
_StrConst1240 db "invoke GetFileSize,[_IOPthNum],0",0
_StrConst1241 db "mov [_ArgSafe0],eax",0
_StrConst1242 db "invoke SetFilePointer,[_IOPthNum],0,0,FILE_CURRENT",0
_StrConst1243 db "cmp eax,[_ArgSafe0]",0
_StrConst1244 db "sete cl; Set result",0
_StrConst1245 db "mov byte [",0
_StrConst1246 db "],cl",0
_StrConst1247 db "mov esi,",0
_StrConst1248 db "call __StrLen",0
_StrConst1249 db ";eax=eaxf;",0
_StrConst1250 db "cinvoke ltoa,eax,[_ConvBuf1],",0
_StrConst1251 db "mov edi,",0
_StrConst1252 db "mov esi,_ConvBuf1",0
_StrConst1253 db "call __MovStr",0
_StrConst1254 db ";eaxf=_AtoD();",0
_StrConst1255 db "mov esi,[",0
_StrConst1256 db "]",0
_StrConst1257 db "call __AtoL",0
_StrConst1258 db ";",0
_StrConst1259 db "=eaxf;",0
_StrConst1260 db "mov [",0
_StrConst1261 db "],eax",0
_StrConst1262 db "~",0
_StrConst1263 db "~",0
_StrConst1264 db "and eax,edx",0
_StrConst1265 db "or eax,edx",0
_StrConst1266 db "mov ecx,edx",0
_StrConst1267 db "xor edx,edx",0
_StrConst1268 db "idiv ecx",0
_StrConst1269 db "mov eax,edx",0
_StrConst1270 db "xor eax,edx",0
_StrConst1271 db "mov esi,",0
_StrConst1272 db "call __MidStr",0
_StrConst1273 db "mov edx,eax",0
_StrConst1274 db "mov eax,1",0
_StrConst1275 db "call __MidStr",0
_StrConst1276 db "call __RightStr",0
_StrConst1277 db "call __TailStr",0
_StrConst1278 db "mov [_ChrTmp",0
_StrConst1279 db "],al",0
_StrConst1280 db "mov esi,[",0
_StrConst1281 db "]",0
_StrConst1282 db "mov al, byte [esi]",0
_StrConst1283 db "~",0
_StrConst1284 db "btc eax,0",0
_StrConst1285 db "mov eax,[",0
_StrConst1286 db "]",0
_StrConst1287 db "mov eax,[",0
_StrConst1288 db "+4]",0
_StrConst1289 db "call __PrintTab",0
_StrConst1290 db ";(long)_Poker=eax;",0
_StrConst1291 db ";",0
_StrConst1292 db "=*_Poker;",0
_StrConst1293 db "mov esi,",0
_StrConst1294 db "add esi,",0
_StrConst1295 db "mov eax,esi",0
_StrConst1296 db "~",0
_StrConst1297 db "not ",0
_StrConst1298 db "._Ptr",0
_StrConst1299 db "mov eax,",0
_StrConst1300 db "imul eax,",0
_StrConst1301 db "add eax,[",0
_StrConst1302 db "]",0
_StrConst1303 db "mov [",0
_StrConst1304 db "],eax",0
_StrConst1305 db "mov [",0
_StrConst1306 db "],",0
_StrConst1307 db "invoke GetFileSize,[_IOPthNum],0",0
_StrConst1308 db "invoke SetFilePointer,[_IOPthNum],0,0,FILE_CURRENT",0
_StrConst1309 db "sqrt",0
_StrConst1310 db "sin",0
_StrConst1311 db "cos",0
_StrConst1312 db "tan",0
_StrConst1313 db "asin",0
_StrConst1314 db "acos",0
_StrConst1315 db "atan",0
_StrConst1316 db "log",0
_StrConst1317 db "log10",0
_StrConst1318 db ";",0
_StrConst1319 db "=",0
_StrConst1320 db "((double)",0
_StrConst1321 db ");",0
_StrConst1322 db ";",0
_StrConst1323 db "=",0
_StrConst1324 db "(*((double*)",0
_StrConst1325 db "._Ptr));",0
_StrConst1326 db ";",0
_StrConst1327 db "=(long)",0
_StrConst1328 db ";",0
_StrConst1329 db ";",0
_StrConst1330 db "=(long)*((double*)",0
_StrConst1331 db "._Ptr);",0
_StrConst1332 db "~",0
_StrConst1333 db "cinvoke abs,eax",0
_StrConst1334 db ";",0
_StrConst1335 db "=fabs(",0
_StrConst1336 db ");",0
_StrConst1337 db ";_t=time(0);",0
_StrConst1338 db ";_systime=localtime(&_t);",0
_StrConst1339 db ";",0
_StrConst1340 db "=_systime->tm_hour;",0
_StrConst1341 db ";",0
_StrConst1342 db "=_systime->tm_min;",0
_StrConst1343 db ";",0
_StrConst1344 db "=_systime->tm_sec;",0
_StrConst1345 db ";",0
_StrConst1346 db "=_systime->tm_year;",0
_StrConst1347 db ";",0
_StrConst1348 db "=_systime->tm_mon+1;",0
_StrConst1349 db ";",0
_StrConst1350 db "=_systime->tm_mday;",0
_StrConst1351 db ";",0
_StrConst1352 db "=_systime->tm_wday;",0
_StrConst1353 db "xor eax,eax",0
_StrConst1354 db "mov esi,[",0
_StrConst1355 db "]",0
_StrConst1356 db "mov edx,[",0
_StrConst1357 db "+4]",0
_StrConst1358 db "xor ecx,ecx",0
_StrConst1359 db "_Lbl",0
_StrConst1360 db ":",0
_StrConst1361 db "mov cl, byte [esi]",0
_StrConst1362 db "or cl,cl",0
_StrConst1363 db "je ",0
_StrConst1364 db "_Lbl",0
_StrConst1365 db "inc esi",0
_StrConst1366 db "add eax,ecx",0
_StrConst1367 db "dec edx",0
_StrConst1368 db "jne ",0
_StrConst1369 db "_Lbl",0
_StrConst1370 db "_Lbl",0
_StrConst1371 db ":",0
_StrConst1372 db "bt eax,edx",0
_StrConst1373 db "setc cl; Set result",0
_StrConst1374 db "mov byte [",0
_StrConst1375 db "],cl",0
_StrConst1376 db "mov ecx,edx",0
_StrConst1377 db "cl",0
_StrConst1378 db "shl ",0
_StrConst1379 db "shr ",0
_StrConst1380 db "rol ",0
_StrConst1381 db "ror ",0
_StrConst1382 db "btc ",0
_StrConst1383 db "ecx",0
_StrConst1384 db "btr ",0
_StrConst1385 db "ecx",0
_StrConst1386 db "bts ",0
_StrConst1387 db "ecx",0
_StrConst1388 db "sal ",0
_StrConst1389 db "sar ",0
_StrConst1390 db "rcl ",0
_StrConst1391 db "rcr ",0
_StrConst1392 db ",",0
_StrConst1393 db "1",0
_StrConst1394 db ";",0
_StrConst1395 db "=_SubStr(&",0
_StrConst1396 db ",&",0
_StrConst1397 db ",",0
_StrConst1398 db ");",0
_StrConst1399 db ";_ZLtoA(eax);",0
_StrConst1400 db ";_ZLtoH(eax);",0
_StrConst1401 db "mov [",0
_StrConst1402 db "],",0
_StrConst1403 db ";",0
_StrConst1404 db "=rand();",0
_StrConst1405 db "mov edi,_IOBuffer",0
_StrConst1406 db "mov esi,",0
_StrConst1407 db "call __MovStr",0
_StrConst1408 db "mov esi,_IOBuffer",0
_StrConst1409 db "call __LCase",0
_StrConst1410 db "call __UCase",0
_StrConst1411 db "mov [_Poker],eax",0
_StrConst1412 db "mov [_ArgSafe0],eax",0
_StrConst1413 db ";",0
_StrConst1414 db "=0;",0
_StrConst1415 db ";while (_ArgSafe0){",0
_StrConst1416 db ";if(*_Poker == eax){",0
_StrConst1417 db ";",0
_StrConst1418 db "=(long)_Poker;",0
_StrConst1419 db ";break;}",0
_StrConst1420 db ";_Poker++;",0
_StrConst1421 db ";_ArgSafe0--;}",0
_StrConst1422 db "mov [_Poker],eax",0
_StrConst1423 db "mov [_ArgSafe1],eax",0
_StrConst1424 db "mov [_ArgSafe0],eax",0
_StrConst1425 db ";",0
_StrConst1426 db "=-1;",0
_StrConst1427 db ";while (_ArgSafe0){",0
_StrConst1428 db ";if(*_Poker == eax){",0
_StrConst1429 db ";",0
_StrConst1430 db "=(long)_Poker-_ArgSafe1;",0
_StrConst1431 db ";break;}",0
_StrConst1432 db ";_Poker++;",0
_StrConst1433 db ";_BlkCnt++;",0
_StrConst1434 db ";_ArgSafe0--;}",0
_StrConst1435 db "mov [",0
_StrConst1436 db "],eax",0
_StrConst1437 db "invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0",0
_StrConst1438 db ";STATUS=write(_PrtPthNum,_XferAddr,XferCount);",0
_StrConst1439 db "invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0",0
_StrConst1440 db "mov [STATUS],eax",0
_StrConst1441 db "mov [_XferAddr],_CRLF",0
_StrConst1442 db "mov [XferCount],2",0
_StrConst1443 db ";STATUS=write(_PrtPthNum,_XferAddr,XferCount);",0
_StrConst1444 db "~",0
_StrConst1445 db "call __BtoA",0
_StrConst1446 db "~",0
_StrConst1447 db "cinvoke ltoa,eax,[_ConvBuf1],10",0
_StrConst1448 db ";_DtoA(eaxf);",0
_StrConst1449 db "0",0
_StrConst1450 db "9",0
_StrConst1451 db "; LN:",0
_StrConst1452 db " ",0
_StrConst1453 db ";",0
_StrConst1454 db " byte ",0
_StrConst1455 db " byte ",0
_StrConst1456 db " word ",0
_StrConst1457 db " dword ",0
_StrConst1458 db " double ",0
_StrConst1459 db " dword ",0
_StrConst1460 db "[",0
_StrConst1461 db "]",0
_StrConst1462 db "~",0
_StrConst1463 db "~",0
_StrConst1464 db "eax",0
_StrConst1465 db "~",0
_StrConst1466 db ";eaxf=",0
_StrConst1467 db ";",0
_StrConst1468 db ",",0
_StrConst1469 db ":",0
_StrConst1470 db "=",0
_StrConst1471 db ";eax=eaxf;",0
_StrConst1472 db "mov edx,[_SwitchInt]",0
_StrConst1473 db "cmp eax,edx",0
_StrConst1474 db "_Lbl",0
_StrConst1475 db "mov edi,_SwitchStr",0
_StrConst1476 db "mov esi,",0
_StrConst1477 db "call __CmpStr",0
_StrConst1478 db "_Lbl",0
_StrConst1479 db "jmp ",0
_StrConst1480 db "_Lbl",0
_StrConst1481 db "_Lbl",0
_StrConst1482 db ":",0
_StrConst1483 db "xor eax,eax",0
_StrConst1484 db "xor edx,edx",0
_StrConst1485 db "_StrConst",0
_StrConst1486 db " db ",0
_StrConst1487 db ",0",0
_StrConst1488 db "Memory Buffer",0
_StrConst1489 db " dd 0",0
_StrConst1490 db " dd 0",0
_StrConst1491 db "cmp [",0
_StrConst1492 db "+4],0",0
_StrConst1493 db "je ",0
_StrConst1494 db "_Lbl",0
_StrConst1495 db "invoke  VirtualFree,[",0
_StrConst1496 db "],0,MEM_RELEASE",0
_StrConst1497 db "mov [",0
_StrConst1498 db "],0",0
_StrConst1499 db "mov [",0
_StrConst1500 db "+4],0",0
_StrConst1501 db "_Lbl",0
_StrConst1502 db ":",0
_StrConst1503 db "push eax",0
_StrConst1504 db "cmp [",0
_StrConst1505 db "+4],0",0
_StrConst1506 db "je ",0
_StrConst1507 db "_Lbl",0
_StrConst1508 db "invoke  VirtualFree,[",0
_StrConst1509 db "],0,MEM_RELEASE",0
_StrConst1510 db "mov [",0
_StrConst1511 db "],0",0
_StrConst1512 db "mov [",0
_StrConst1513 db "+4],0",0
_StrConst1514 db "_Lbl",0
_StrConst1515 db ":",0
_StrConst1516 db "pop eax",0
_StrConst1517 db "mov [",0
_StrConst1518 db "+4],eax",0
_StrConst1519 db "invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE",0
_StrConst1520 db "mov [",0
_StrConst1521 db "],eax",0
_StrConst1522 db "(",0
_StrConst1523 db ")",0
_StrConst1524 db ",",0
_StrConst1525 db ",",0
_StrConst1526 db "(",0
_StrConst1527 db ")",0
_StrConst1528 db ",",0
_StrConst1529 db ",",0
_StrConst1530 db "; Auto diminsion of argument",0
_StrConst1531 db "align 4",0
_StrConst1532 db " rd 1",0
_StrConst1533 db "mov eax,[_FcnArg",0
_StrConst1534 db "]",0
_StrConst1535 db "mov [",0
_StrConst1536 db "],eax",0
_StrConst1537 db " rd 3",0
_StrConst1538 db "mov esi,[_FcnArg",0
_StrConst1539 db "]",0
_StrConst1540 db "mov eax,[esi]",0
_StrConst1541 db "mov [",0
_StrConst1542 db "],eax",0
_StrConst1543 db "add esi,4",0
_StrConst1544 db "mov eax,[esi]",0
_StrConst1545 db "mov [",0
_StrConst1546 db "+4],eax",0
_StrConst1547 db "mov [",0
_StrConst1548 db "+8],0",0
_StrConst1549 db "~",0
_StrConst1550 db "eax",0
_StrConst1551 db "mov [_FcnArg",0
_StrConst1552 db "],eax",0
_StrConst1553 db ":",0
_StrConst1554 db "mov [_FcnArg",0
_StrConst1555 db "],",0
_StrConst1556 db "ENDTEXT",0
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
!CT_SCINTILLA equ 121
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
; LN:191 DIM IgnoreRightParam AS BYTE
IgnoreRightParam rb 1
; LN:192 DIM FcnTypes(8) AS BYTE
align 4
FcnTypes rb 8
; LN:193 DIM ProcFlag AS BYTE
ProcFlag rb 1
; LN:194 DIM FcnFlag AS BYTE
FcnFlag rb 1
; LN:195 DIM ProcFcnFlag AS BYTE
ProcFcnFlag rb 1
; LN:196 DIM ProcFcn AS BYTE
ProcFcn rb 1
; LN:197 DIM InitTrue AS BYTE
InitTrue rb 1
; LN:198 DIM HasFcn AS BYTE
HasFcn rb 1
; LN:199 DIM SimpleCmp AS BYTE
SimpleCmp rb 1
; LN:200 DIM ComplexCmp AS BYTE
ComplexCmp rb 1
; LN:201 DIM PathIsVector AS BYTE
PathIsVector rb 1
; LN:202 DIM RepeatFlag AS BYTE
RepeatFlag rb 1
; LN:203 DIM RepeatCnt AS LONG
align 4
RepeatCnt rd 1
; LN:204 DIM LastFilePos AS LONG
align 4
LastFilePos rd 1
; LN:205 DIM ArrayDetail AS LONG
align 4
ArrayDetail rd 1
; LN:206 DIM ArrayDataType AS INTEGER
align 2
ArrayDataType rw 1
; LN:207 DIM CpxArrayOffset AS LONG
align 4
CpxArrayOffset rd 1
; LN:209 DIM ForDataType AS INTEGER
align 2
ForDataType rw 1
; LN:210 DIM D1Cleared AS BYTE
D1Cleared rb 1
; LN:211 DIM TableNdx AS LONG
align 4
TableNdx rd 1
; LN:212 DIM TableTypeNdx AS LONG
align 4
TableTypeNdx rd 1
; LN:214 DIM TableElements AS LONG
align 4
TableElements rd 1
; LN:215 DIM TableCounter AS LONG
align 4
TableCounter rd 1
; LN:216 DIM CommaCounter AS LONG
align 4
CommaCounter rd 1
; LN:217 DIM I AS LONG
align 4
I rd 1
; LN:218 DIM J AS LONG
align 4
J rd 1
; LN:219 DIM FirstValidChar AS BOOLEAN
FirstValidChar rb 1
; LN:220 DIM FilBufSiz AS LONG
align 4
FilBufSiz rd 1
; LN:221 DIM FilBufAdr AS LONG
align 4
FilBufAdr rd 1
; LN:222 DIM ANSIArgCtr AS LONG
align 4
ANSIArgCtr rd 1
; LN:223 DIM ObjType AS BYTE
ObjType rb 1
; LN:224 DIM ObjClass AS LONG
align 4
ObjClass rd 1
; LN:225 DIM TempObjClass AS LONG
align 4
TempObjClass rd 1
; LN:226 DIM ObjSubClass AS LONG
align 4
ObjSubClass rd 1
; LN:227 DIM GUIFlag AS BYTE
GUIFlag rb 1
; LN:228 DIM Place AS BYTE
Place rb 1
; LN:229 DIM HaltFlag AS BYTE
HaltFlag rb 1
; LN:230 DIM AsmOutFlag AS BYTE
AsmOutFlag rb 1
; LN:231 DIM DLLFlag AS BYTE
DLLFlag rb 1
; LN:232 DIM FloatFlag AS BYTE
FloatFlag rb 1
; LN:233 DIM ExpFlag AS BYTE
ExpFlag rb 1
; LN:234 DIM SubCtr AS BYTE
SubCtr rb 1
; LN:235 DIM SubCtrSaf AS BYTE
SubCtrSaf rb 1
; LN:236 DIM MultiFlag AS BYTE
MultiFlag rb 1
; LN:237 DIM SubValue(3) AS LONG
align 4
SubValue rd 3
; LN:238 DIM SubValSaf(3) AS LONG
align 4
SubValSaf rd 3
; LN:239 DIM PrtPthFlg AS BYTE
PrtPthFlg rb 1
; LN:241 DIM DirFlag AS BYTE
DirFlag rb 1
; LN:242 DIM CrOpFlag AS BYTE
CrOpFlag rb 1
; LN:243 DIM StatFlag AS BYTE
StatFlag rb 1
; LN:244 DIM LopCtrNum AS LONG
align 4
LopCtrNum rd 1
; LN:245 DIM LastSym AS LONG
align 4
LastSym rd 1
; LN:246 DIM LastSymSaf AS LONG
align 4
LastSymSaf rd 1
; LN:247 DIM LastKey AS LONG
align 4
LastKey rd 1
; LN:248 DIM LetFlag AS BYTE
LetFlag rb 1
; LN:249 DIM StartFlag AS BYTE
StartFlag rb 1
; LN:250 DIM DataFlag AS BYTE
DataFlag rb 1
; LN:251 DIM SelectFlag AS BYTE
SelectFlag rb 1
; LN:252 DIM CaseFlag AS BYTE
CaseFlag rb 1
; LN:253 DIM CaseElseFlag AS BYTE
CaseElseFlag rb 1
; LN:254 DIM CaseToFlag AS BYTE
CaseToFlag rb 1
; LN:255 DIM XBufSize AS LONG
align 4
XBufSize rd 1
; LN:257 DIM BufRWFlg AS BYTE
BufRWFlg rb 1
; LN:258 DIM NewLine AS BYTE
NewLine rb 1
; LN:260 DIM UDump AS BYTE
UDump rb 1
; LN:261 DIM StringNum AS LONG
align 4
StringNum rd 1
; LN:262 DIM VectorFlg AS BYTE
VectorFlg rb 1
; LN:264 DIM DtaRegNum AS BYTE
DtaRegNum rb 1
; LN:265 DIM LoopVars(40) AS STRING*28
LoopVars rb 1120
; LN:266 DIM LopVarNdx AS LONG
align 4
LopVarNdx rd 1
; LN:268 DIM FcnDataMod AS INTEGER
align 2
FcnDataMod rw 1
; LN:269 DIM FcnSymNdx AS LONG
align 4
FcnSymNdx rd 1
; LN:270 DIM NumArgs AS BYTE
NumArgs rb 1
; LN:271 DIM TFcnArgs AS LONG
align 4
TFcnArgs rd 1
; LN:272 DIM AsmOut AS BYTE
AsmOut rb 1
; LN:273 DIM DumpSyms AS BYTE
DumpSyms rb 1
; LN:274 DIM FloatOK AS BYTE
FloatOK rb 1
; LN:275 DIM OneDot AS BYTE
OneDot rb 1
; LN:276 DIM LstExp AS LONG
align 4
LstExp rd 1
; LN:277 DIM NoGen AS BYTE
NoGen rb 1
; LN:278 DIM OptNdx AS LONG
align 4
OptNdx rd 1
; LN:280 DIM CondValid AS BYTE
CondValid rb 1
; LN:281 DIM CondOp1 AS LONG
align 4
CondOp1 rd 1
; LN:282 DIM CondOp2 AS LONG
align 4
CondOp2 rd 1
; LN:283 DIM GenFlag(20) AS BYTE
align 4
GenFlag rb 20
; LN:284 DIM AsmFlag AS BYTE
AsmFlag rb 1
; LN:285 DIM GFNdx AS LONG
align 4
GFNdx rd 1
; LN:288 DIM VarSize AS LONG
align 4
VarSize rd 1
; LN:289 DIM SetMask AS BYTE
SetMask rb 1
; LN:290 DIM ArrayBase AS BYTE
ArrayBase rb 1
; LN:291 DIM TmpMax AS BYTE
TmpMax rb 1
; LN:292 DIM TmpVecMax AS BYTE
TmpVecMax rb 1
; LN:293 DIM FTmpMax AS BYTE
FTmpMax rb 1
; LN:294 DIM ChrTmpMax AS BYTE
ChrTmpMax rb 1
; LN:295 DIM StrTmpMax AS BYTE
StrTmpMax rb 1
; LN:296 DIM PrintFlag AS BYTE
PrintFlag rb 1
; LN:297 DIM TabFlag AS BYTE
TabFlag rb 1
; LN:298 DIM DevFlag AS BYTE
DevFlag rb 1
; LN:300 DIM FcnCode AS BYTE
FcnCode rb 1
; LN:301 DIM FileStat AS BYTE
FileStat rb 1
; LN:302 DIM DiskIO AS BYTE
DiskIO rb 1
; LN:303 DIM FileIO AS BYTE
FileIO rb 1
; LN:304 DIM ReadFlag AS BYTE
ReadFlag rb 1
; LN:305 DIM AndOrFlag AS BYTE
AndOrFlag rb 1
; LN:306 DIM CompFlag AS BYTE
CompFlag rb 1
; LN:307 DIM Promote AS BYTE
Promote rb 1
; LN:308 DIM Demote AS BYTE
Demote rb 1
; LN:309 DIM DataOp AS BYTE
DataOp rb 1
; LN:310 DIM MathOp AS BYTE
MathOp rb 1
; LN:316 DIM D0Loaded AS BYTE
D0Loaded rb 1
; LN:317 DIM Target AS BYTE
Target rb 1
; LN:318 DIM TmpUse AS LONG
align 4
TmpUse rd 1
; LN:319 DIM TmpVecUse AS LONG
align 4
TmpVecUse rd 1
; LN:320 DIM FTmpUse AS LONG
align 4
FTmpUse rd 1
; LN:321 DIM ChrTmpUse AS LONG
align 4
ChrTmpUse rd 1
; LN:322 DIM StrTmpUse AS LONG
align 4
StrTmpUse rd 1
; LN:323 DIM Op1Class AS BYTE
Op1Class rb 1
; LN:324 DIM Operator AS BYTE
Operator rb 1
; LN:325 DIM Op2Class AS BYTE
Op2Class rb 1
; LN:326 DIM OpClass AS BYTE
OpClass rb 1
; LN:327 DIM Op1Type AS BYTE
Op1Type rb 1
; LN:328 DIM Op1Mod AS INTEGER
align 2
Op1Mod rw 1
; LN:329 DIM Op1Detail AS LONG
align 4
Op1Detail rd 1
; LN:330 DIM Op2Type AS BYTE
Op2Type rb 1
; LN:331 DIM Op2Mod AS INTEGER
align 2
Op2Mod rw 1
; LN:332 DIM Op2Detail AS LONG
align 4
Op2Detail rd 1
; LN:335 DIM SwitchClass AS BYTE
SwitchClass rb 1
; LN:336 DIM Op1DataSize AS LONG
align 4
Op1DataSize rd 1
; LN:337 DIM Op2DataSize AS LONG
align 4
Op2DataSize rd 1
; LN:338 DIM LNFlag AS BYTE
LNFlag rb 1
; LN:341 DIM BufDataSize AS LONG
align 4
BufDataSize rd 1
; LN:346 DIM ToSubFlag AS BYTE
ToSubFlag rb 1
; LN:348 DIM DigDec AS BYTE
DigDec rb 1
; LN:349 DIM BitType AS BYTE
BitType rb 1
; LN:350 DIM TFcnDataType AS BYTE
TFcnDataType rb 1
; LN:351 DIM FcnSpec AS BYTE
FcnSpec rb 1
; LN:352 DIM JmpArgs AS LONG
align 4
JmpArgs rd 1
; LN:353 DIM LabelNum AS LONG
align 4
LabelNum rd 1
; LN:354 DIM OELabelNum AS LONG
align 4
OELabelNum rd 1
; LN:355 DIM TableNum AS LONG
align 4
TableNum rd 1
; LN:356 TYPE ConStruct
; LN:371 DIM ConStk(40) AS ConStruct
align 4
ConStk rb 2920
; LN:372 DIM ConStkPtr AS LONG
align 4
ConStkPtr rd 1
; LN:373 DIM InpFile(20) AS LONG
align 4
InpFile rd 20
; LN:374 DIM InpFilPtr AS LONG
align 4
InpFilPtr rd 1
; LN:375 DIM DeclareFile AS LONG
align 4
DeclareFile rd 1
; LN:376 DIM CodeFile AS LONG
align 4
CodeFile rd 1
; LN:377 DIM PreCodeFile AS LONG
align 4
PreCodeFile rd 1
; LN:378 DIM DataFile AS LONG
align 4
DataFile rd 1
; LN:379 DIM DimFile AS LONG
align 4
DimFile rd 1
; LN:380 DIM FunctionFile AS LONG
align 4
FunctionFile rd 1
; LN:381 DIM ImportFile AS LONG
align 4
ImportFile rd 1
; LN:382 DIM ExportFile AS LONG
align 4
ExportFile rd 1
; LN:383 DIM ResourceFile AS LONG
align 4
ResourceFile rd 1
; LN:384 DIM OutFile AS LONG
align 4
OutFile rd 1
; LN:390 DIM TempInt AS LONG
align 4
TempInt rd 1
; LN:391 DIM StringLength AS LONG
align 4
StringLength rd 1
; LN:393 DIM ErrNo AS LONG
align 4
ErrNo rd 1
; LN:395 DIM AsciiByte AS BYTE
AsciiByte rb 1
; LN:396 DIM Konstant AS LONG
align 4
Konstant rd 1
; LN:397 DIM StringCnt AS LONG
align 4
StringCnt rd 1
; LN:398 DIM StringLen AS LONG
align 4
StringLen rd 1
; LN:399 DIM LoopNum AS LONG
align 4
LoopNum rd 1
; LN:400 TYPE Symbol
; LN:415 DIM SymTable(SymTabSiz) AS Symbol
align 4
SymTable rb 180000
; LN:416 DIM SymTableKey(SymTabSiz) AS LONG
align 4
SymTableKey rd 3000
; LN:417 TYPE KeyData
; LN:424 DIM UseSetStrConst AS BOOLEAN
UseSetStrConst rb 1
; LN:425 DIM UseTrmStr AS BOOLEAN
UseTrmStr rb 1
; LN:426 DIM UsePrtUsing AS BOOLEAN
UsePrtUsing rb 1
; LN:427 DIM UseData AS BOOLEAN
UseData rb 1
; LN:428 DIM UseMovStr AS BOOLEAN
UseMovStr rb 1
; LN:429 DIM UseCmpStr AS BOOLEAN
UseCmpStr rb 1
; LN:430 DIM UseStrLen AS BOOLEAN
UseStrLen rb 1
; LN:431 DIM UseSubStr AS BOOLEAN
UseSubStr rb 1
; LN:432 DIM UseMidStr AS BOOLEAN
UseMidStr rb 1
; LN:433 DIM UseRightStr AS BOOLEAN
UseRightStr rb 1
; LN:434 DIM UseClrConv AS BOOLEAN
UseClrConv rb 1
; LN:435 DIM UseAtoD AS BOOLEAN
UseAtoD rb 1
; LN:436 DIM UseAtoL AS BOOLEAN
UseAtoL rb 1
; LN:437 DIM UseNumScan AS BOOLEAN
UseNumScan rb 1
; LN:438 DIM UseZLtoH AS BOOLEAN
UseZLtoH rb 1
; LN:439 DIM UseZLtoA AS BOOLEAN
UseZLtoA rb 1
; LN:440 DIM UseLtoA AS BOOLEAN
UseLtoA rb 1
; LN:441 DIM UseDtoA AS BOOLEAN
UseDtoA rb 1
; LN:442 DIM UseLtoH AS BOOLEAN
UseLtoH rb 1
; LN:443 DIM UsePrintStr AS BOOLEAN
UsePrintStr rb 1
; LN:444 DIM UsePrintTab AS BOOLEAN
UsePrintTab rb 1
; LN:445 DIM UseInpData AS BOOLEAN
UseInpData rb 1
; LN:446 DIM UseBtoA AS BOOLEAN
UseBtoA rb 1
; LN:447 DIM UseLCase AS BOOLEAN
UseLCase rb 1
; LN:448 DIM UseUCase AS BOOLEAN
UseUCase rb 1
; LN:449 DIM UseTailStr AS BOOLEAN
UseTailStr rb 1
; LN:451 DIM UMFlag AS BYTE
UMFlag rb 1
; LN:452 DIM GblVarFlg AS BYTE
GblVarFlg rb 1
; LN:453 DIM CVTemp AS LONG
align 4
CVTemp rd 1
; LN:455 DIM NeedComma AS BYTE
NeedComma rb 1
; LN:456 DIM MacExFlag AS BYTE
MacExFlag rb 1
; LN:457 DIM MacBuf(MacBufSiz) AS BYTE
align 4
MacBuf rb 50000
; LN:458 DIM MacDefNdx AS LONG
align 4
MacDefNdx rd 1
; LN:459 DIM MacExNdx AS LONG
align 4
MacExNdx rd 1
; LN:460 DIM MacTblPtr AS LONG
align 4
MacTblPtr rd 1
; LN:461 DIM MacArgBuf(16) AS STRING*100
MacArgBuf rb 1600
; LN:462 DIM MacArgPtr AS LONG
align 4
MacArgPtr rd 1
; LN:463 DIM MaxArgNum AS BYTE
MaxArgNum rb 1
; LN:464 DIM PoolCtr AS LONG
align 4
PoolCtr rd 1
; LN:465 DIM SymNdx AS LONG
align 4
SymNdx rd 1
; LN:466 DIM SymNdxSaf AS LONG
align 4
SymNdxSaf rd 1
; LN:470 DIM ArraySize AS LONG
align 4
ArraySize rd 1
; LN:471 DIM ForNdx AS LONG
align 4
ForNdx rd 1
; LN:472 DIM DataTemp AS BYTE
DataTemp rb 1
; LN:475 DIM TDataType AS INTEGER
align 2
TDataType rw 1
; LN:476 DIM TblDataType AS INTEGER
align 2
TblDataType rw 1
; LN:477 DIM TDataMod AS INTEGER
align 2
TDataMod rw 1
; LN:478 DIM VDataMod AS INTEGER
align 2
VDataMod rw 1
; LN:479 DIM TDetail AS LONG
align 4
TDetail rd 1
; LN:480 DIM VDetail AS LONG
align 4
VDetail rd 1
; LN:481 DIM TDataAddr AS LONG
align 4
TDataAddr rd 1
; LN:482 DIM VDataAddr AS LONG
align 4
VDataAddr rd 1
; LN:483 DIM TDataSize AS LONG
align 4
TDataSize rd 1
; LN:484 DIM ExpTable(ExpTabSiz) AS LONG
align 4
ExpTable rd 300
; LN:485 DIM TypePtr AS LONG
align 4
TypePtr rd 1
; LN:486 DIM TypeFlag AS BYTE
TypeFlag rb 1
; LN:487 DIM LastEntry AS Symbol
align 4
LastEntry rb 60
; LN:488 DIM SymTemp AS Symbol
align 4
SymTemp rb 60
; LN:493 DIM ExpEnd AS BYTE
ExpEnd rb 1
; LN:494 DIM TokenLen AS BYTE
TokenLen rb 1
; LN:495 DIM ExpLen AS LONG
align 4
ExpLen rd 1
; LN:496 DIM LastGroup AS BYTE
LastGroup rb 1
; LN:497 DIM TokenType AS BYTE
TokenType rb 1
; LN:498 DIM LastByte AS BYTE
LastByte rb 1
; LN:499 DIM IsOperator AS BYTE
IsOperator rb 1
; LN:500 DIM WasOperator AS BYTE
WasOperator rb 1
; LN:503 DIM Subscript(3) AS STRING*28
Subscript rb 84
; LN:504 DIM SubscrErr AS BYTE
SubscrErr rb 1
; LN:506 DIM KeyNdx AS LONG
align 4
KeyNdx rd 1
; LN:508 DIM NumberOK AS BYTE
NumberOK rb 1
; LN:509 DIM HexOK AS BYTE
HexOK rb 1
; LN:510 DIM SymbolOK AS BYTE
SymbolOK rb 1
; LN:511 DIM IntOK AS BYTE
IntOK rb 1
; LN:512 DIM DimFlag AS BYTE
DimFlag rb 1
; LN:513 DIM DimOK AS BYTE
DimOK rb 1
; LN:514 DIM BasicLineCtr AS LONG
align 4
BasicLineCtr rd 1
; LN:515 DIM AsmLineCtr AS LONG
align 4
AsmLineCtr rd 1
; LN:516 DIM QuoteFlg AS BYTE
QuoteFlg rb 1
; LN:517 DIM EscSeq AS BYTE
EscSeq rb 1
; LN:518 DIM ParenStk(100) AS BYTE
align 4
ParenStk rb 100
; LN:519 DIM ParenCnt AS BYTE
ParenCnt rb 1
; LN:520 DIM FcnCtr AS BYTE
FcnCtr rb 1
; LN:521 DIM AECtr AS BYTE
AECtr rb 1
; LN:522 DIM LevelCnt AS BYTE
LevelCnt rb 1
; LN:523 DIM SymFull AS BYTE
SymFull rb 1
; LN:524 DIM SymFound AS BYTE
SymFound rb 1
; LN:525 DIM ErrCnt AS BYTE
ErrCnt rb 1
; LN:526 DIM VarBytRem AS LONG
align 4
VarBytRem rd 1
; LN:527 DIM TypeBytes AS LONG
align 4
TypeBytes rd 1
; LN:528 DIM TypeVars AS LONG
align 4
TypeVars rd 1
; LN:529 DIM TypeNdx AS LONG
align 4
TypeNdx rd 1
; LN:530 DIM LabelFlag AS BYTE
LabelFlag rb 1
; LN:531 DIM DTCompVar AS BYTE
DTCompVar rb 1
; LN:532 DIM DTBoolean AS BYTE
DTBoolean rb 1
; LN:533 DIM DTByte AS BYTE
DTByte rb 1
; LN:534 DIM DTShort AS BYTE
DTShort rb 1
; LN:535 DIM DTLong AS BYTE
DTLong rb 1
; LN:536 DIM DTFloat AS BYTE
DTFloat rb 1
; LN:537 DIM DTString AS BYTE
DTString rb 1
; LN:538 DIM DTLabel AS BYTE
DTLabel rb 1
; LN:539 DIM DTMacro AS BYTE
DTMacro rb 1
; LN:540 DIM DTOper AS BYTE
DTOper rb 1
; LN:541 DIM DTFcn AS BYTE
DTFcn rb 1
; LN:542 DIM DTProc AS BYTE
DTProc rb 1
; LN:543 DIM DTStruct AS BYTE
DTStruct rb 1
; LN:544 DIM DTVoid AS BYTE
DTVoid rb 1
; LN:545 DIM DTComplex AS BYTE
DTComplex rb 1
; LN:546 DIM DTBuffer AS BYTE
DTBuffer rb 1
; LN:547 DIM DMData AS BYTE
DMData rb 1
; LN:548 DIM DMTemp AS BYTE
DMTemp rb 1
; LN:549 DIM DMVector AS BYTE
DMVector rb 1
; LN:550 DIM DMMember AS BYTE
DMMember rb 1
; LN:551 DIM DMMulti AS BYTE
DMMulti rb 1
; LN:552 DIM DMConst AS BYTE
DMConst rb 1
; LN:553 DIM DMAddr AS BYTE
DMAddr rb 1
; LN:554 DIM DMArray AS BYTE
DMArray rb 1
; LN:555 DIM DMReDim AS BYTE
DMReDim rb 1
; LN:556 DIM EndFound AS BYTE
EndFound rb 1
; LN:560 DIM Ctr1 AS LONG
align 4
Ctr1 rd 1
; LN:561 DIM Ctr2 AS LONG
align 4
Ctr2 rd 1
; LN:562 DIM Ctr3 AS LONG
align 4
Ctr3 rd 1
; LN:563 DIM WhiteSpaceCtr AS LONG
align 4
WhiteSpaceCtr rd 1
; LN:564 DIM SrcNdx AS LONG
align 4
SrcNdx rd 1
; LN:565 DIM EndNdx AS LONG
align 4
EndNdx rd 1
; LN:566 DIM SrcNdxCpy AS LONG
align 4
SrcNdxCpy rd 1
; LN:567 DIM SrcNdxSaf AS LONG
align 4
SrcNdxSaf rd 1
; LN:568 DIM ExpEndSaf AS BYTE
ExpEndSaf rb 1
; LN:569 DIM NumberNdx AS LONG
align 4
NumberNdx rd 1
; LN:570 DIM ValidNdx AS LONG
align 4
ValidNdx rd 1
; LN:571 DIM LabNdx AS LONG
align 4
LabNdx rd 1
; LN:572 DIM ExpNdx AS LONG
align 4
ExpNdx rd 1
; LN:573 DIM ExpLeft AS LONG
align 4
ExpLeft rd 1
; LN:574 DIM ExpRight AS LONG
align 4
ExpRight rd 1
; LN:575 DIM PType AS LONG
align 4
PType rd 1

;Temporary Vector
_TmpVec1 rd 3

;Temporary Variable
_Tmp1 rd 1


;Temporary Vector
_TmpVec2 rd 3

;Temporary Variable
_Tmp2 rd 1


;For Loop Vector
_LopVec1 rd 2


;For Loop Vector
_LopVec2 rd 2


;Temporary Character Variable
_ChrTmp1 rb 1


;Temporary Character Variable
_ChrTmp2 rb 1


;Temporary Vector
_TmpVec3 rd 3

;Temporary Vector
_TmpVec4 rd 3

;Temporary Vector
_TmpVec5 rd 3

;Temporary String Variable
_StrTmp1 rb 32


;For Loop Vector
_LopVec3 rd 2


;Temporary Vector
_TmpVec6 rd 3

;Temporary Vector
_TmpVec7 rd 3

;Temporary Vector
_TmpVec8 rd 3

;Temporary String Variable
_StrTmp2 rb 32


;Temporary Vector
_TmpVec9 rd 3

;Temporary String Variable
_StrTmp3 rb 32


;Temporary Vector
_TmpVec10 rd 3

;Temporary Vector
_TmpVec11 rd 3

;For Loop Vector
_LopVec4 rd 2


;For Loop Vector
_LopVec5 rd 2


;Temporary String Variable
_StrTmp4 rb 32


;Temporary String Variable
_StrTmp5 rb 32


;Temporary String Variable
_StrTmp6 rb 32


;Temporary Vector
_TmpVec12 rd 3

;Temporary Vector
_TmpVec13 rd 3

;Temporary Vector
_TmpVec14 rd 3
; End of Uninitialized Data Section
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
; LN:17 MACRO GenExport
; LN:22 MACRO GenResource
; LN:27 MACRO IncExpNdx
; LN:32 MACRO CommaRet
; LN:37 MACRO CommaMain
; LN:42 MACRO ColonRet
; LN:47 MACRO ColonMain
; LN:52 MACRO EqualRet
; LN:57 MACRO EqualMain
; LN:62 MACRO MakeLong
; LN:68 MACRO ErrRet
; LN:74 MACRO ErrMain
; LN:78 CONST ErrUDSym=1
ErrUDSym equ 1
; LN:79 CONST ErrIVSNam=2
ErrIVSNam equ 2
; LN:80 CONST ErrTypMis=3
ErrTypMis equ 3
; LN:81 CONST ErrIVExp=4
ErrIVExp equ 4
; LN:82 CONST ErrSyntax=5
ErrSyntax equ 5
; LN:83 CONST ErrDupSym=6
ErrDupSym equ 6
; LN:84 CONST ErrSymFul=7
ErrSymFul equ 7
; LN:85 CONST ErrUDFcn=8
ErrUDFcn equ 8
; LN:86 CONST ErrIVType=9
ErrIVType equ 9
; LN:87 CONST ErrIVMod=10
ErrIVMod equ 10
; LN:88 CONST ErrMacArg=11
ErrMacArg equ 11
; LN:89 CONST ErrIVDir=12
ErrIVDir equ 12
; LN:90 CONST ErrDupMac=13
ErrDupMac equ 13
; LN:91 CONST ErrEndStr=14
ErrEndStr equ 14
; LN:92 CONST ErrMacNst=15
ErrMacNst equ 15
; LN:93 CONST ErrMacBuf=16
ErrMacBuf equ 16
; LN:94 CONST ErrIVMac=17
ErrIVMac equ 17
; LN:95 CONST ErrEndm=18
ErrEndm equ 18
; LN:96 CONST ErrUBCon=19
ErrUBCon equ 19
; LN:97 CONST ErrNDeep=20
ErrNDeep equ 20
; LN:98 CONST ErrDecFcn=21
ErrDecFcn equ 21
; LN:99 CONST ErrIVParm=22
ErrIVParm equ 22
; LN:100 CONST ErrParam=23
ErrParam equ 23
; LN:101 CONST ErrCpxExp=24
ErrCpxExp equ 24
; LN:102 CONST ErrIVFunc=25
ErrIVFunc equ 25
; LN:103 CONST ErrTmpUse=26
ErrTmpUse equ 26
; LN:104 CONST ErrParen=27
ErrParen equ 27
; LN:105 CONST ErrFcn=28
ErrFcn equ 28
; LN:106 CONST ErrIVTarg=29
ErrIVTarg equ 29
; LN:107 CONST ErrFSNest=30
ErrFSNest equ 30
; LN:108 CONST ErrTblArr=31
ErrTblArr equ 31
; LN:109 CONST ErrEndFcn=32
ErrEndFcn equ 32
; LN:110 CONST ErrArrSub=33
ErrArrSub equ 33
; LN:111 CONST ErrEndProc=34
ErrEndProc equ 34
; LN:112 CONST ErrEndTbl=35
ErrEndTbl equ 35
; LN:113 CONST ErrTblArgs=36
ErrTblArgs equ 36
; LN:114 CONST ErrFcnArgs=37
ErrFcnArgs equ 37
; LN:115 CONST ErrTypeFcn=38
ErrTypeFcn equ 38
; LN:117 CONST COMPVAR=0
COMPVAR equ 0
; LN:118 CONST BOOLVAR=1
BOOLVAR equ 1
; LN:119 CONST BYTEVAR=2
BYTEVAR equ 2
; LN:120 CONST WORDVAR=3
WORDVAR equ 3
; LN:121 CONST LONGVAR=4
LONGVAR equ 4
; LN:122 CONST FLOATVAR=5
FLOATVAR equ 5
; LN:123 CONST STRINGVAR=6
STRINGVAR equ 6
; LN:124 CONST LABELVAR=7
LABELVAR equ 7
; LN:125 CONST MACROVAR=8
MACROVAR equ 8
; LN:126 CONST OPER=9
OPER equ 9
; LN:127 CONST FCN=10
FCN equ 10
; LN:128 CONST PROC=11
PROC equ 11
; LN:129 CONST TYPE=12
TYPE equ 12
; LN:130 CONST VOIDX=13
VOIDX equ 13
; LN:131 CONST COMPLEX=14
COMPLEX equ 14
; LN:132 CONST BUFFER=15
BUFFER equ 15
; LN:133 CONST LABELPTR=16
LABELPTR equ 16
; LN:135 CONST ArrayBit=$0001
ArrayBit equ 1
; LN:136 CONST PointerBit=$0002
PointerBit equ 2
; LN:137 CONST ConstBit=$0004
ConstBit equ 4
; LN:138 CONST MultiBit=$0008
MultiBit equ 8
; LN:139 CONST MemberBit=$0010
MemberBit equ 16
; LN:140 CONST VectorBit=$0020
VectorBit equ 32
; LN:141 CONST TempBit=$0040
TempBit equ 64
; LN:142 CONST DataBit=$0080
DataBit equ 128
; LN:143 CONST ReDimBit=$0100
ReDimBit equ 256
; LN:144 CONST UsrFcnBit=$0200
UsrFcnBit equ 512
; LN:145 CONST CalledBit=$0400
CalledBit equ 1024
; LN:146 CONST TmpVec=$60
TmpVec equ 96
; LN:147 CONST ArrayMsk=$fffe
ArrayMsk equ 65534
; LN:149 CONST NULLClass=0
NULLClass equ 0
; LN:150 CONST INTClass=1
INTClass equ 1
; LN:151 CONST STRClass=2
STRClass equ 2
; LN:152 CONST ARRClass=3
ARRClass equ 3
; LN:153 CONST CPXClass=4
CPXClass equ 4
; LN:154 CONST FLTClass=5
FLTClass equ 5
; LN:155 CONST BOOLClass=6
BOOLClass equ 6
; LN:156 CONST OBJClass=7
OBJClass equ 7
; LN:157 CONST FRMClass=8
FRMClass equ 8
; LN:158 CONST LBLClass=9
LBLClass equ 9
; LN:160 CONST TTypRelOp=1
TTypRelOp equ 1
; LN:161 CONST TTypPunct=2
TTypPunct equ 2
; LN:162 CONST TTypMath=3
TTypMath equ 3
; LN:163 CONST TTypQuote=4
TTypQuote equ 4
; LN:164 CONST TTypSym=5
TTypSym equ 5
; LN:165 CONST TTypInt=6
TTypInt equ 6
; LN:166 CONST TTypHex=7
TTypHex equ 7
; LN:167 CONST TTypParen=8
TTypParen equ 8
; LN:168 CONST TTypMisc=9
TTypMisc equ 9
; LN:169 CONST TTypFloat=10
TTypFloat equ 10
; LN:170 CONST TTypOct=11
TTypOct equ 11
; LN:171 CONST TTypBin=12
TTypBin equ 12
; LN:173 CONST PTArrOpn=3
PTArrOpn equ 3
; LN:174 CONST PTArrCls=4
PTArrCls equ 4
; LN:175 CONST PTFcnOpn=5
PTFcnOpn equ 5
; LN:176 CONST PTFcnCls=6
PTFcnCls equ 6
; LN:177 CONST PTCpxOpn=24
PTCpxOpn equ 24
; LN:178 CONST PTFCpxCls=25
PTFCpxCls equ 25
; LN:180 CONST NumTemps=15
NumTemps equ 15
; LN:181 CONST OBQUOTE=$22
OBQUOTE equ 34
; LN:182 CONST LabelResolved=$ff
LabelResolved equ 255
; LN:183 CONST LabelUnresolved=0
LabelUnresolved equ 0
; LN:185 CONST _BufSize=500
_BufSize equ 500
; LN:186 CONST MacBufSiz=50000
MacBufSiz equ 50000
; LN:187 CONST ExpTabSiz=300
ExpTabSiz equ 300
; LN:188 CONST UserSym=197'  set to first user symbol in PreDefined
UserSym equ 197
; LN:189 CONST SymTabSiz=3000
SymTabSiz equ 3000
; LN:423 ' Use Flags
; LN:577 ' Start
; LN:578 PRINT 
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:579 PRINT "OmniBasic Version 0.2"
mov esi,_StrConst1
mov [_TmpVec1],esi
mov [_TmpVec1+4],22
mov [_TmpVec1+8],0
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
jne _OELbl1
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl1:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:580 PRINT 
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:582 PRINT  "Copyright  1995-2003 Innomation Systems, Inc."
mov esi,_StrConst2
mov [_TmpVec1],esi
mov [_TmpVec1+4],46
mov [_TmpVec1+8],0
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
jne _OELbl2
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl2:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:583 PRINT  "All Rights Reserved"
mov esi,_StrConst3
mov [_TmpVec1],esi
mov [_TmpVec1+4],20
mov [_TmpVec1+8],0
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
jne _OELbl3
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl3:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:584 PRINT 
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:585 FileName=""
mov [FileName+12],0
; LN:586 FileName=NextArg
mov dword edi,FileName
call __MovArg
; LN:587 IF LEN(FileName)=0 THEN
mov esi,FileName
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl1
; LN:588 PRINT "No input file"
mov esi,_StrConst4
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
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
jne _OELbl4
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl4:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:589 END
xor eax,eax
invoke ExitProcess, eax
; LN:590 ENDIF
_Lbl1:
; LN:591 IF FileName="-?" THEN Help
mov esi,_StrConst5
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,FileName
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl2
jmp Help
_Lbl2:
; LN:592 IF RIGHT$(FileName,2)<>".b" AND RIGHT$(FileName,2)<>".B" THEN
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
call __RightStr
mov esi,_StrConst6
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
call __RightStr
mov esi,_StrConst7
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
and bh,bl
je _Lbl3
; LN:593 PRINT "No Recognized Extension"
mov esi,_StrConst8
mov [_TmpVec1],esi
mov [_TmpVec1+4],24
mov [_TmpVec1+8],0
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
; LN:594 END
xor eax,eax
invoke ExitProcess, eax
; LN:595 ENDIF
_Lbl3:
; LN:596 ON ERROR GOTO NoInpFile
mov [_ErrVec],NoInpFile
; LN:597 InpFilPtr=1
mov dword [InpFilPtr],1
; LN:598 OPEN #InpFile(InpFilPtr),FileName:READ
mov esi,InpFile-(1*4)
mov eax, dword [InpFilPtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,_IOBuffer
mov esi,FileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov edi,[_TmpVec1]
mov [edi],eax
cmp eax,-1
jg _OELbl6
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl6:
; LN:600 FileName=LEFT$(FileName,LEN(FileName)-2)
mov esi,FileName
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp2]
mov edx,eax
mov eax,1
call __MidStr
mov edi,FileName
mov esi,_TmpVec1
call __MovStr
; LN:602 ON ERROR GOTO NoDeclareFile
mov [_ErrVec],NoDeclareFile
; LN:603 DELETE "_DeclareFile"
mov esi,_StrConst9
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl7
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl7:
NoDeclareFile:
; LN:605 CREATE #DeclareFile,"_DeclareFile":WRITE+TEXT
mov esi,_StrConst10
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [DeclareFile],eax
cmp eax,-1
jg _OELbl8
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl8:
; LN:607 ON ERROR GOTO NoPreCodeFile
mov [_ErrVec],NoPreCodeFile
; LN:608 DELETE "_PreCodeFile"
mov esi,_StrConst11
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl9
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl9:
NoPreCodeFile:
; LN:610 CREATE #PreCodeFile,"_PreCodeFile":WRITE+TEXT
mov esi,_StrConst12
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [PreCodeFile],eax
cmp eax,-1
jg _OELbl10
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl10:
; LN:612 ON ERROR GOTO NoCodeFile
mov [_ErrVec],NoCodeFile
; LN:613 DELETE "_CodeFile"
mov esi,_StrConst13
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl11
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl11:
NoCodeFile:
; LN:615 CREATE #CodeFile,"_CodeFile":WRITE+TEXT
mov esi,_StrConst14
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CodeFile],eax
cmp eax,-1
jg _OELbl12
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl12:
; LN:617 ON ERROR GOTO NoDataFile
mov [_ErrVec],NoDataFile
; LN:618 DELETE "_DataFile"
mov esi,_StrConst15
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl13
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl13:
NoDataFile:
; LN:620 CREATE #DataFile,"_DataFile":WRITE+TEXT
mov esi,_StrConst16
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [DataFile],eax
cmp eax,-1
jg _OELbl14
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl14:
; LN:622 ON ERROR GOTO NoDimFile
mov [_ErrVec],NoDimFile
; LN:623 DELETE "_DimFile"
mov esi,_StrConst17
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl15
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl15:
NoDimFile:
; LN:625 CREATE #DimFile,"_DimFile":WRITE+TEXT
mov esi,_StrConst18
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [DimFile],eax
cmp eax,-1
jg _OELbl16
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl16:
; LN:627 ON ERROR GOTO NoFunctionFile
mov [_ErrVec],NoFunctionFile
; LN:628 DELETE "_FunctionFile"
mov esi,_StrConst19
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl17
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl17:
NoFunctionFile:
; LN:630 CREATE #FunctionFile,"_FunctionFile":WRITE+TEXT
mov esi,_StrConst20
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [FunctionFile],eax
cmp eax,-1
jg _OELbl18
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl18:
; LN:632 ON ERROR GOTO NoExportFile
mov [_ErrVec],NoExportFile
; LN:633 DELETE "_ExportFile"
mov esi,_StrConst21
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl19
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl19:
NoExportFile:
; LN:635 CREATE #ExportFile,"_ExportFile":WRITE+TEXT
mov esi,_StrConst22
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ExportFile],eax
cmp eax,-1
jg _OELbl20
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl20:
; LN:637 ON ERROR GOTO NoResourceFile
mov [_ErrVec],NoResourceFile
; LN:638 DELETE "_ResourceFile"
mov esi,_StrConst23
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl21
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl21:
NoResourceFile:
; LN:640 CREATE #ResourceFile,"_ResourceFile":WRITE+TEXT
mov esi,_StrConst24
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ResourceFile],eax
cmp eax,-1
jg _OELbl22
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl22:
; LN:642 ON ERROR
mov [_ErrVec],_ErrExit
; LN:643 UseSetStrConst=FALSE
mov byte [UseSetStrConst],0
; LN:644 UseTrmStr=FALSE
mov byte [UseTrmStr],0
; LN:645 UsePrtUsing=FALSE
mov byte [UsePrtUsing],0
; LN:646 UseData=FALSE
mov byte [UseData],0
; LN:647 UseMovStr=FALSE
mov byte [UseMovStr],0
; LN:648 UseCmpStr=FALSE
mov byte [UseCmpStr],0
; LN:649 UseStrLen=FALSE
mov byte [UseStrLen],0
; LN:650 UseSubStr=FALSE
mov byte [UseSubStr],0
; LN:651 UseMidStr=FALSE
mov byte [UseMidStr],0
; LN:652 UseRightStr=FALSE
mov byte [UseRightStr],0
; LN:653 UseClrConv=FALSE
mov byte [UseClrConv],0
; LN:654 UseAtoD=FALSE
mov byte [UseAtoD],0
; LN:655 UseAtoL=FALSE
mov byte [UseAtoL],0
; LN:656 UseNumScan=FALSE
mov byte [UseNumScan],0
; LN:657 UseZLtoH=FALSE
mov byte [UseZLtoH],0
; LN:658 UseZLtoA=FALSE
mov byte [UseZLtoA],0
; LN:659 UseLtoA=FALSE
mov byte [UseLtoA],0
; LN:660 UseDtoA=FALSE
mov byte [UseDtoA],0
; LN:661 UseLtoH=FALSE
mov byte [UseLtoH],0
; LN:662 UsePrintStr=FALSE
mov byte [UsePrintStr],0
; LN:663 UsePrintTab=FALSE
mov byte [UsePrintTab],0
; LN:664 UseInpData=FALSE
mov byte [UseInpData],0
; LN:665 UseBtoA=FALSE
mov byte [UseBtoA],0
; LN:666 UseLCase=FALSE
mov byte [UseLCase],0
; LN:667 UseUCase=FALSE
mov byte [UseUCase],0
; LN:668 UseTailStr=FALSE
mov byte [UseTailStr],0
; LN:669 GFNdx=1
mov dword [GFNdx],1
; LN:670 GenFlag(GFNdx)=$ff
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:671 AsmFlag=0
mov byte [AsmFlag],0
; LN:672 XBufSize=_BufSize
mov dword [XBufSize],500
; LN:673 SelectFlag=0
mov byte [SelectFlag],0
; LN:674 CaseFlag=0
mov byte [CaseFlag],0
; LN:675 CaseElseFlag=0
mov byte [CaseElseFlag],0
; LN:676 ProcFlag=0
mov byte [ProcFlag],0
; LN:677 FcnFlag=0
mov byte [FcnFlag],0
; LN:678 ProcFcnFlag=0
mov byte [ProcFcnFlag],0
; LN:679 DataFlag=0
mov byte [DataFlag],0
; LN:680 NoGen=0'  default OFF
mov byte [NoGen],0
; LN:681 ExpFlag=0
mov byte [ExpFlag],0
; LN:682 LastSym=UserSym
mov dword [LastSym],197
; LN:683 AsmOutFlag=0
mov byte [AsmOutFlag],0
; LN:684 HaltFlag=0
mov byte [HaltFlag],0
; LN:685 GUIFlag=0
mov byte [GUIFlag],0
; LN:686 DLLFlag=0
mov byte [DLLFlag],0
; LN:687 UDump=0'  default OFF
mov byte [UDump],0
; LN:688 StartFlag=0
mov byte [StartFlag],0
; LN:689 DumpSyms=0'  default OFF
mov byte [DumpSyms],0
; LN:690 LopCtrNum=-1
mov eax,0
mov edx,1
sub eax,edx
mov dword [LopCtrNum],eax
; LN:691 ArrayBase=1'  default to base 1
mov byte [ArrayBase],1
; LN:692 PrtPthFlg=0
mov byte [PrtPthFlg],0
; LN:693 DtaRegNum=0
mov byte [DtaRegNum],0
; LN:694 TmpMax=0
mov byte [TmpMax],0
; LN:695 TmpVecMax=0
mov byte [TmpVecMax],0
; LN:696 FTmpMax=0
mov byte [FTmpMax],0
; LN:697 ChrTmpMax=0
mov byte [ChrTmpMax],0
; LN:698 StrTmpMax=0
mov byte [StrTmpMax],0
; LN:699 ErrCnt=0
mov byte [ErrCnt],0
; LN:700 LastStmt=""
mov [LastStmt+12],0
; LN:701 ConStkPtr=0
mov dword [ConStkPtr],0
; LN:702 LopVarNdx=0
mov dword [LopVarNdx],0
; LN:703 StringNum=0
mov dword [StringNum],0
; LN:704 LabelNum=0
mov dword [LabelNum],0
; LN:705 TableNum=0
mov dword [TableNum],0
; LN:706 LoopNum=0
mov dword [LoopNum],0
; LN:707 MacExFlag=0
mov byte [MacExFlag],0
; LN:708 BasicLineCtr=0
mov dword [BasicLineCtr],0
; LN:709 AsmLineCtr=0
mov dword [AsmLineCtr],0
; LN:710 ErrNo=0
mov dword [ErrNo],0
; LN:711 PoolCtr=0
mov dword [PoolCtr],0
; LN:712 VarBytRem=0
mov dword [VarBytRem],0
; LN:714 FOR LopVarNdx=1 to 40
mov [LopVarNdx],1
_Lbl4:
cmp [LopVarNdx],40
jg _Lbl6
; LN:715 LoopVars(LopVarNdx)="%"
mov esi,LoopVars-(1*28)
mov eax, dword [LopVarNdx]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst25
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:716 NEXT LopVarNdx
_Lbl5:
inc [LopVarNdx]
jmp _Lbl4
_Lbl6:
; LN:718 FOR MacDefNdx=1 TO MacBufSiz
mov [MacDefNdx],1
_Lbl7:
cmp [MacDefNdx],50000
jg _Lbl9
; LN:719 MacBuf(MacDefNdx)=0
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:720 NEXT MacDefNdx
_Lbl8:
inc [MacDefNdx]
jmp _Lbl7
_Lbl9:
; LN:721 MacDefNdx=1
mov dword [MacDefNdx],1
; LN:723 RESTORE PreDefTbl
mov dword [_DataPtr],PreDefTbl
; LN:724 SymNdx=0
mov dword [SymNdx],0
InitSym:
; LN:726 INC SymNdx
inc [SymNdx]
; LN:727 READ TempStr
mov esi,[TempStr]
mov eax,500
call __ReadStr
; LN:728 IF TempStr="%" THEN LoadKeyWords
mov esi,_StrConst26
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempStr
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl10
jmp LoadKeyWords
_Lbl10:
; LN:729 SymTemp.SymName=TempStr
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:730 READ SymTemp.DataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
call __ReadShort
; LN:731 READ SymTemp.DataMod
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
call __ReadShort
; LN:732 READ SymTemp.Detail
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
call __ReadLong
; LN:733 READ SymTemp.DataAddr
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
call __ReadLong
; LN:734 READ SymTemp.DataSize
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
call __ReadLong
; LN:735 SymTable(SymNdx)=SymTemp
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl11:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl11
; LN:736 SymTableKey(SymNdx)=CHKWORD(TempStr)
mov esi,SymTableKey-(1*4)
mov eax, dword [SymNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov esi,[TempStr]
mov edx,[TempStr+4]
xor ecx,ecx
_Lbl12:
mov cl, byte [esi]
or cl,cl
je _Lbl13
inc esi
add eax,ecx
dec edx
jne _Lbl12
_Lbl13:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:737 GOTO InitSym
jmp InitSym
LoadKeyWords:
; LN:741 TEXT TailStrLib
; LN:767 TEXT LCaseLib
; LN:789 TEXT UCaseLib
; LN:811 TEXT SetStrConstLib
; LN:824 TEXT DataLib
; LN:887 TEXT InpDataLib
; LN:948 TEXT BtoALib
; LN:970 TEXT MidStrLib
; LN:980 TEXT MovArgLib
; LN:1006 TEXT CmpStrLib
; LN:1033 TEXT MovStrLib
; LN:1070 TEXT AtoLLib
; LN:1138 TEXT StrLenLib
; LN:1160 TEXT RightStrLib
; LN:1181 TABLE KeyTable AS KeyData
; LN:1269 KeyNdx=0
mov dword [KeyNdx],0
InitKeyWords:
; LN:1271 INC KeyNdx
inc [KeyNdx]
; LN:1272 TempStr=KeyTable(KeyNdx).KeyName
mov esi,KeyTable-(1*24)+4
mov eax, dword [KeyNdx]
imul eax,24
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1273 IF TempStr="%" THEN Preamble
mov esi,_StrConst27
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempStr
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl14
jmp Preamble
_Lbl14:
; LN:1274 LastKey=KeyNdx
mov eax, dword [KeyNdx]
mov [LastKey],eax
; LN:1275 KeyTable(KeyNdx).KeyCheckWord=CHKWORD(TempStr)
mov esi,KeyTable-(1*24)+0
mov eax, dword [KeyNdx]
imul eax,24
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov esi,[TempStr]
mov edx,[TempStr+4]
xor ecx,ecx
_Lbl15:
mov cl, byte [esi]
or cl,cl
je _Lbl16
inc esi
add eax,ecx
dec edx
jne _Lbl15
_Lbl16:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1276 GOTO InitKeyWords
jmp InitKeyWords
Preamble:
; LN:1279 GOSUB CmdLine
call CmdLine
; LN:1281 '*** Win95/NT ****
; LN:1282 NewLine=$0a
mov byte [NewLine],10
; LN:1284 OutBuf=";Compiler Delaration Section"
mov edi,[OutBuf]
mov esi,_StrConst28
call __SetStrConst
; LN:1285 GOSUB OutDeclare
call OutDeclare
; LN:1286 OutBuf=""
mov [OutBuf+12],0
; LN:1287 GOSUB OutDeclare
call OutDeclare
; LN:1288 OutBuf="format PE "
mov edi,[OutBuf]
mov esi,_StrConst29
call __SetStrConst
; LN:1289 IF GUIFlag=0 THEN
cmp [GUIFlag],0
jne _Lbl17
; LN:1290 OutBuf=OutBuf+"console"
mov edi,[OutBuf]
mov [_TmpVec1],edi
mov edi,[OutBuf+4]
mov [_TmpVec1+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst30
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1291 ELSE
jmp _Lbl18
_Lbl17:
; LN:1292 OutBuf=OutBuf+"GUI"
mov edi,[OutBuf]
mov [_TmpVec1],edi
mov edi,[OutBuf+4]
mov [_TmpVec1+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst31
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1293 ENDIF
_Lbl18:
; LN:1294 IF DLLFlag<>0 THEN
cmp [DLLFlag],0
je _Lbl19
; LN:1295 OutBuf=OutBuf+" DLL"
mov edi,[OutBuf]
mov [_TmpVec1],edi
mov edi,[OutBuf+4]
mov [_TmpVec1+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst32
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1296 ENDIF
_Lbl19:
; LN:1297 GOSUB OutDeclare
call OutDeclare
; LN:1298 OutBuf=""
mov [OutBuf+12],0
; LN:1299 GOSUB OutDeclare
call OutDeclare
; LN:1300 OutBuf="entry _Start"
mov edi,[OutBuf]
mov esi,_StrConst33
call __SetStrConst
; LN:1301 GOSUB OutDeclare
call OutDeclare
; LN:1302 OutBuf=""
mov [OutBuf+12],0
; LN:1303 GOSUB OutDeclare
call OutDeclare
; LN:1304 OutBuf="macro align value { rb (value-1) - (rva $ + value-1) mod value }"
mov edi,[OutBuf]
mov esi,_StrConst34
call __SetStrConst
; LN:1305 GOSUB OutDeclare
call OutDeclare
; LN:1306 OutBuf=""
mov [OutBuf+12],0
; LN:1307 GOSUB OutDeclare
call OutDeclare
; LN:1308 OutBuf="_BufSize=300"
mov edi,[OutBuf]
mov esi,_StrConst35
call __SetStrConst
; LN:1309 GOSUB OutDeclare
call OutDeclare
; LN:1311 OutBuf="section '.data' data readable writeable"
mov edi,[OutBuf]
mov esi,_StrConst36
call __SetStrConst
; LN:1312 GOSUB OutInitData
call OutInitData
; LN:1313 OutBuf=""
mov [OutBuf+12],0
; LN:1314 GOSUB OutInitData
call OutInitData
; LN:1315 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst37
call __SetStrConst
; LN:1316 GOSUB OutInitData
call OutInitData
; LN:1317 OutBuf=""
mov [OutBuf+12],0
; LN:1318 GOSUB OutInitData
call OutInitData
; LN:1319 OutBuf="ERR dd 0"
mov edi,[OutBuf]
mov esi,_StrConst38
call __SetStrConst
; LN:1320 GOSUB OutInitData
call OutInitData
; LN:1321 OutBuf="_ErrVec dd 0"
mov edi,[OutBuf]
mov esi,_StrConst39
call __SetStrConst
; LN:1322 GOSUB OutInitData
call OutInitData
; LN:1323 OutBuf="STATUS dd 0"
mov edi,[OutBuf]
mov esi,_StrConst40
call __SetStrConst
; LN:1324 GOSUB OutInitData
call OutInitData
; LN:1325 OutBuf="POS dd 0"
mov edi,[OutBuf]
mov esi,_StrConst41
call __SetStrConst
; LN:1326 GOSUB OutInitData
call OutInitData
; LN:1327 OutBuf="XferCount dd 0"
mov edi,[OutBuf]
mov esi,_StrConst42
call __SetStrConst
; LN:1328 GOSUB OutInitData
call OutInitData
; LN:1329 OutBuf="_TrueStr db "+CHR$(OBQUOTE)+"TRUE"+CHR$(OBQUOTE)+",0"
mov eax,34
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov eax,34
mov esi,_ChrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],1
mov [_TmpVec2+8],0
mov [_ChrTmp2],al
mov esi,_StrConst43
mov [_TmpVec3],esi
mov [_TmpVec3+4],13
mov [_TmpVec3+8],0
mov esi,_StrConst44
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_StrConst45
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:1330 GOSUB OutInitData
call OutInitData
; LN:1331 OutBuf="_FalseStr db "+CHR$(OBQUOTE)+"FALSE"+CHR$(OBQUOTE)+",0"
mov eax,34
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov eax,34
mov esi,_ChrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],1
mov [_TmpVec2+8],0
mov [_ChrTmp2],al
mov esi,_StrConst46
mov [_TmpVec3],esi
mov [_TmpVec3+4],14
mov [_TmpVec3+8],0
mov esi,_StrConst47
mov [_TmpVec4],esi
mov [_TmpVec4+4],6
mov [_TmpVec4+8],0
mov esi,_StrConst48
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:1332 GOSUB OutInitData
call OutInitData
; LN:1334 RESTORE RunVarTbl
mov dword [_DataPtr],RunVarTbl
; LN:1335 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst49
call __SetStrConst
; LN:1336 GOSUB OutDim
call OutDim
RunVarLoop:
; LN:1338 READ OutBuf
mov esi,[OutBuf]
mov eax,500
call __ReadStr
; LN:1339 IF OutBuf="%" THEN RunVarDone
mov esi,_StrConst50
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,OutBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl20
jmp RunVarDone
_Lbl20:
; LN:1340 GOSUB OutDim
call OutDim
; LN:1341 GOTO RunVarLoop
jmp RunVarLoop
RunVarDone:
; LN:1344 OutBuf=""
mov [OutBuf+12],0
; LN:1345 GOSUB OutDim
call OutDim
; LN:1346 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst51
call __SetStrConst
; LN:1347 GOSUB OutDim
call OutDim
; LN:1348 OutBuf=""
mov [OutBuf+12],0
; LN:1349 GOSUB OutDim
call OutDim
; LN:1351 OutBuf=""
mov [OutBuf+12],0
; LN:1352 GOSUB OutPreCode
call OutPreCode
; LN:1353 OutBuf="section '.code' code readable executable"
mov edi,[OutBuf]
mov esi,_StrConst52
call __SetStrConst
; LN:1354 GOSUB OutPreCode
call OutPreCode
; LN:1355 OutBuf="; Main Code Section"
mov edi,[OutBuf]
mov esi,_StrConst53
call __SetStrConst
; LN:1356 GOSUB OutPreCode
call OutPreCode
; LN:1357 OutBuf=""
mov [OutBuf+12],0
; LN:1358 GOSUB OutPreCode
call OutPreCode
; LN:1359 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst54
call __SetStrConst
; LN:1360 GOSUB OutPreCode
call OutPreCode
; LN:1361 OutBuf="_Start:"
mov edi,[OutBuf]
mov esi,_StrConst55
call __SetStrConst
; LN:1362 GOSUB OutPreCode
call OutPreCode
; LN:1363 OutBuf=""
mov [OutBuf+12],0
; LN:1364 GOSUB OutPreCode
call OutPreCode
; LN:1365 OutBuf="invoke GetModuleHandle, NULL"
mov edi,[OutBuf]
mov esi,_StrConst56
call __SetStrConst
; LN:1366 GOSUB OutPreCode
call OutPreCode
; LN:1367 OutBuf="mov dword [_hInstance], eax"
mov edi,[OutBuf]
mov esi,_StrConst57
call __SetStrConst
; LN:1368 GOSUB OutPreCode
call OutPreCode
; LN:1369 OutBuf="invoke GetCommandLine"
mov edi,[OutBuf]
mov esi,_StrConst58
call __SetStrConst
; LN:1370 GOSUB OutPreCode
call OutPreCode
; LN:1371 OutBuf="mov dword [_ArgList],eax"
mov edi,[OutBuf]
mov esi,_StrConst59
call __SetStrConst
; LN:1372 GOSUB OutPreCode
call OutPreCode
; LN:1373 OutBuf="mov dword edi,ProgramName"
mov edi,[OutBuf]
mov esi,_StrConst60
call __SetStrConst
; LN:1374 GOSUB OutPreCode
call OutPreCode
; LN:1375 OutBuf="call __MovArg"
mov edi,[OutBuf]
mov esi,_StrConst61
call __SetStrConst
; LN:1376 GOSUB OutPreCode
call OutPreCode
; LN:1377 OutBuf="invoke GetStdHandle, STD_INPUT_HANDLE"
mov edi,[OutBuf]
mov esi,_StrConst62
call __SetStrConst
; LN:1378 GOSUB OutPreCode
call OutPreCode
; LN:1379 OutBuf="mov dword [_InHandle], eax"
mov edi,[OutBuf]
mov esi,_StrConst63
call __SetStrConst
; LN:1380 GOSUB OutPreCode
call OutPreCode
; LN:1381 OutBuf="invoke GetStdHandle, STD_OUTPUT_HANDLE"
mov edi,[OutBuf]
mov esi,_StrConst64
call __SetStrConst
; LN:1382 GOSUB OutPreCode
call OutPreCode
; LN:1383 OutBuf="mov dword [_OutHandle], eax"
mov edi,[OutBuf]
mov esi,_StrConst65
call __SetStrConst
; LN:1384 GOSUB OutPreCode
call OutPreCode
; LN:1385 OutBuf="mov byte [_CRLF+12],13"
mov edi,[OutBuf]
mov esi,_StrConst66
call __SetStrConst
; LN:1386 GOSUB OutPreCode
call OutPreCode
; LN:1387 OutBuf="mov byte [_CRLF+13],10"
mov edi,[OutBuf]
mov esi,_StrConst67
call __SetStrConst
; LN:1388 GOSUB OutPreCode
call OutPreCode
; LN:1389 OutBuf="mov byte [_CRLF+14],0"
mov edi,[OutBuf]
mov esi,_StrConst68
call __SetStrConst
; LN:1390 GOSUB OutPreCode
call OutPreCode
; LN:1391 OutBuf="mov byte [_Prompt+12],63"
mov edi,[OutBuf]
mov esi,_StrConst69
call __SetStrConst
; LN:1392 GOSUB OutPreCode
call OutPreCode
; LN:1393 OutBuf="mov byte [_Prompt+13],0"
mov edi,[OutBuf]
mov esi,_StrConst70
call __SetStrConst
; LN:1394 GOSUB OutPreCode
call OutPreCode
; LN:1395 OutBuf="mov byte [_NullStr+12],0"
mov edi,[OutBuf]
mov esi,_StrConst71
call __SetStrConst
; LN:1396 GOSUB OutPreCode
call OutPreCode
; LN:1397 OutBuf="mov dword [_ErrVec],_ErrExit"
mov edi,[OutBuf]
mov esi,_StrConst72
call __SetStrConst
; LN:1398 GOSUB OutPreCode
call OutPreCode
; LN:1400 IF GUIFlag<>0 THEN
cmp [GUIFlag],0
je _Lbl21
; LN:1401 ' Build wc
; LN:1402 ' Register class
; LN:1403 ' LoadMenu
; LN:1404 ' CreateWindowEx
; LN:1405 ' msg_loop:
; LN:1406 ' proc WindowProc
; LN:1407 ENDIF
_Lbl21:
; LN:1409 RESTORE RunStringTbl
mov dword [_DataPtr],RunStringTbl
; LN:1410 OutBuf="_ErrExitMsg db 'Error exit',0"
mov edi,[OutBuf]
mov esi,_StrConst73
call __SetStrConst
; LN:1411 GOSUB OutInitData
call OutInitData
RunStringLoop:
; LN:1413 READ VarName
mov esi,[VarName]
mov eax,28
call __ReadStr
; LN:1414 IF VarName="%" THEN RunStringDone
mov esi,_StrConst74
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,VarName
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl22
jmp RunStringDone
_Lbl22:
; LN:1415 READ ArraySize
mov esi,ArraySize
call __ReadLong
; LN:1416 TempInt=ArraySize/4
mov eax, dword [ArraySize]
mov edx,4
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:1417 IF Mod(ArraySize,4)<>0 THEN
mov eax, dword [ArraySize]
mov edx,4
mov ecx,edx
xor edx,edx
idiv ecx
mov eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl23
; LN:1418 TempInt=TempInt+1
mov eax, dword [TempInt]
mov edx,1
add eax,edx
mov dword [TempInt],eax
; LN:1419 ENDIF
_Lbl23:
; LN:1420 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst75
call __SetStrConst
; LN:1421 GOSUB OutInitData
call OutInitData
; LN:1422 OutBuf=VarName+" dd "+VarName+"+12"
mov edi,[VarName]
mov [_TmpVec1],edi
mov edi,[VarName+4]
mov [_TmpVec1+4],edi
mov edi,[VarName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst76
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov edi,[VarName]
mov [_TmpVec3],edi
mov edi,[VarName+4]
mov [_TmpVec3+4],edi
mov edi,[VarName+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst77
mov [_TmpVec4],esi
mov [_TmpVec4+4],4
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1423 GOSUB OutInitData
call OutInitData
; LN:1424 OutBuf=" dd "+STR$(ArraySize)
mov eax, dword [ArraySize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst78
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:1425 GOSUB OutInitData
call OutInitData
; LN:1426 OutBuf=" dd 0"
mov edi,[OutBuf]
mov esi,_StrConst79
call __SetStrConst
; LN:1427 GOSUB OutInitData
call OutInitData
; LN:1428 OutBuf=" rb "+STR$(ArraySize)
mov eax, dword [ArraySize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst80
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:1429 GOSUB OutInitData
call OutInitData
; LN:1430 GOTO RunStringLoop
jmp RunStringLoop
RunStringDone:
; LN:1433 OutBuf=""
mov [OutBuf+12],0
; LN:1434 GOSUB OutFunction
call OutFunction
; LN:1435 OutBuf="; Function Code Section"
mov edi,[OutBuf]
mov esi,_StrConst81
call __SetStrConst
; LN:1436 GOSUB OutFunction
call OutFunction
; LN:1437 OutBuf=""
mov [OutBuf+12],0
; LN:1438 GOSUB OutFunction
call OutFunction
; LN:1440 OutBuf=""
mov [OutBuf+12],0
; LN:1441 GenExport
; LN:1441 WRITE #ExportFile,OutBuf
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1441 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1442 OutBuf="section '.edata' export data readable"
mov edi,[OutBuf]
mov esi,_StrConst82
call __SetStrConst
; LN:1443 GenExport
; LN:1443 WRITE #ExportFile,OutBuf
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1443 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1444 OutBuf=""
mov [OutBuf+12],0
; LN:1445 GenExport
; LN:1445 WRITE #ExportFile,OutBuf
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1445 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1447 OutBuf=""
mov [OutBuf+12],0
; LN:1448 GenResource
; LN:1448 WRITE #ResourceFile,OutBuf
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1448 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1449 OutBuf="section '.rsrc' resource data readable"
mov edi,[OutBuf]
mov esi,_StrConst83
call __SetStrConst
; LN:1450 GenResource
; LN:1450 WRITE #ResourceFile,OutBuf
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1450 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1451 OutBuf=""
mov [OutBuf+12],0
; LN:1452 GenResource
; LN:1452 WRITE #ResourceFile,OutBuf
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1452 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1453 OutBuf="; End of Resource Section"
mov edi,[OutBuf]
mov esi,_StrConst84
call __SetStrConst
; LN:1454 GenResource
; LN:1454 WRITE #ResourceFile,OutBuf
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1454 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1455 OutBuf=""
mov [OutBuf+12],0
; LN:1456 GenResource
; LN:1456 WRITE #ResourceFile,OutBuf
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1456 INC AsmLineCtr
inc [AsmLineCtr]
; LN:1457 OutBuf="section '.reloc' fixups data readable discardable"
mov edi,[OutBuf]
mov esi,_StrConst85
call __SetStrConst
; LN:1458 GenResource
; LN:1458 WRITE #ResourceFile,OutBuf
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:1458 INC AsmLineCtr
inc [AsmLineCtr]
MainLoop:
; LN:1461 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl24
; LN:1462 IF ErrNo=ErrMacArg THEN
cmp [ErrNo],11
jne _Lbl25
; LN:1463 PRINT "Fatal Error... MACRO argument error in line ";BasicLineCtr
mov esi,_StrConst86
mov [_TmpVec1],esi
mov [_TmpVec1+4],45
mov [_TmpVec1+8],0
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
jne _OELbl23
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl23:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1464 END
xor eax,eax
invoke ExitProcess, eax
; LN:1465 ENDIF
_Lbl25:
; LN:1466 PRINT SrcLine
mov esi,SrcLine
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl24
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl24:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1467 OutBuf=""
mov [OutBuf+12],0
; LN:1468 IF SrcNdx<2 THEN
cmp [SrcNdx],2
jge _Lbl26
; LN:1469 SrcNdx=2
mov dword [SrcNdx],2
; LN:1470 ENDIF
_Lbl26:
; LN:1471 For Ctr1=1 TO SrcNdx-1
mov [Ctr1],1
mov eax, dword [SrcNdx]
mov edx,1
sub eax,edx
mov [_LopVec3],eax
_Lbl27:
mov eax,[Ctr1]
cmp eax,[_LopVec3]
jg _Lbl29
; LN:1472 OutBuf=OutBuf+" "
mov edi,[OutBuf]
mov [_TmpVec1],edi
mov edi,[OutBuf+4]
mov [_TmpVec1+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst87
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1473 NEXT Ctr1
_Lbl28:
inc [Ctr1]
jmp _Lbl27
_Lbl29:
; LN:1474 OutBuf=OutBuf+"^"
mov edi,[OutBuf]
mov [_TmpVec1],edi
mov edi,[OutBuf+4]
mov [_TmpVec1+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst88
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1475 PRINT OutBuf
mov esi,OutBuf
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl25
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl25:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1476 RESTORE ErrorTbl
mov dword [_DataPtr],ErrorTbl
; LN:1477 FOR Ctr1=1 to ErrNo
mov [Ctr1],1
mov eax,[ErrNo]
mov [_LopVec3],eax
_Lbl30:
mov eax,[Ctr1]
cmp eax,[_LopVec3]
jg _Lbl32
; LN:1478 READ TempStr
mov esi,[TempStr]
mov eax,500
call __ReadStr
; LN:1479 NEXT Ctr1
_Lbl31:
inc [Ctr1]
jmp _Lbl30
_Lbl32:
; LN:1480 PRINT TempStr';" in line ";BasicLineCtr
mov esi,TempStr
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl26
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl26:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1481 IF ErrNo=ErrSymFul THEN
cmp [ErrNo],7
jne _Lbl33
; LN:1482 PRINT "Fatal Error... Symbol Table Full"
mov esi,_StrConst89
mov [_TmpVec1],esi
mov [_TmpVec1+4],33
mov [_TmpVec1+8],0
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
jne _OELbl27
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl27:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1483 'PRINT "Total symbols=";SymNdx
; LN:1484 END
xor eax,eax
invoke ExitProcess, eax
; LN:1485 ENDIF
_Lbl33:
; LN:1486 INC ErrCnt
inc [ErrCnt]
; LN:1487 IF HaltFlag<>0 THEN
cmp [HaltFlag],0
je _Lbl34
; LN:1488 END
xor eax,eax
invoke ExitProcess, eax
; LN:1489 END IF
_Lbl34:
; LN:1490 ErrNo=0
mov dword [ErrNo],0
; LN:1491 ENDIF
_Lbl24:
; LN:1492 IF DimFlag=0 THEN
cmp [DimFlag],0
jne _Lbl35
; LN:1493 LOOP
_Lbl36:
; LN:1494 IF SymTable(LastSym).DataType<>STRINGVAR OR LAND(SymTable(LastSym).DataMod,ConstBit)<>ConstBit THEN NotString
mov esi,SymTable-(1*60)+28
mov eax, dword [LastSym]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
mov esi,SymTable-(1*60)+30
mov eax, dword [LastSym]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,4
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,4
cmp eax,edx
setne bl
or bh,bl
je _Lbl38
jmp NotString
_Lbl38:
; LN:1495 DEC LastSym
dec [LastSym]
; LN:1496 ENDLOOP
jmp _Lbl36
_Lbl37:
; LN:1497 ENDIF
_Lbl35:
NotString:
; LN:1499 GOSUB MainLoopInit
call MainLoopInit
; LN:1500 IF MacExFlag=0 THEN
cmp [MacExFlag],0
jne _Lbl39
; LN:1501 IF InpFilPtr=1 THEN
cmp [InpFilPtr],1
jne _Lbl40
; LN:1502 INC BasicLineCtr
inc [BasicLineCtr]
; LN:1503 ENDIF
_Lbl40:
; LN:1504 GOSUB ReadSource
call ReadSource
; LN:1505 IF TempInt=0 THEN Finish
cmp [TempInt],0
je Finish
; LN:1506 ELSE
jmp _Lbl42
_Lbl39:
; LN:1507 SrcLine=""
mov [SrcLine+12],0
; LN:1508 SrcNdx=0
mov dword [SrcNdx],0
; LN:1509 MacExLp: AsciiByte=MacBuf(MacExNdx)
MacExLp:
mov esi,MacBuf-(1*1)
mov eax, dword [MacExNdx]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [AsciiByte],al
; LN:1510 INC MacExNdx
inc [MacExNdx]
; LN:1511 IF AsciiByte=0 THEN'  end of MACRO
cmp [AsciiByte],0
jne _Lbl43
; LN:1512 MacExFlag=0
mov byte [MacExFlag],0
; LN:1513 GOTO MainLoop
jmp MainLoop
; LN:1514 ENDIF
_Lbl43:
; LN:1515 IF AsciiByte=NewLine THEN ProcLine
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
xor edx,edx
mov dl, byte [NewLine]
cmp eax,edx
sete bl
or bh,bl
je _Lbl44
jmp ProcLine
_Lbl44:
; LN:1516 IF LAND($80,AsciiByte)=$80 THEN
mov eax,128
xor edx,edx
mov dl, byte [AsciiByte]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,128
cmp eax,edx
sete bl
or bh,bl
je _Lbl45
; LN:1517 AsciiByte=LAND($7f,AsciiByte)
mov eax,127
xor edx,edx
mov dl, byte [AsciiByte]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1518 IF AsciiByte=0 THEN
cmp [AsciiByte],0
jne _Lbl46
; LN:1519 SrcLine=SrcLine+STR$(SymTable(MacTblPtr).Detail)
mov esi,SymTable-(1*60)+32
mov eax, dword [MacTblPtr]
imul eax,60
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
mov edi,[SrcLine]
mov [_TmpVec3],edi
mov edi,[SrcLine+4]
mov [_TmpVec3+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,SrcLine
mov esi,_TmpVec3
call __MovStr
; LN:1520 GOTO MacExLp
jmp MacExLp
; LN:1521 ENDIF
_Lbl46:
; LN:1522 IF AsciiByte>MaxArgNum THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
xor edx,edx
mov dl, byte [MaxArgNum]
cmp eax,edx
setg bl
or bh,bl
je _Lbl47
; LN:1523 ErrNo=ErrMacArg
mov dword [ErrNo],11
; LN:1524 GOTO MainLoop
jmp MainLoop
; LN:1525 ENDIF
_Lbl47:
; LN:1526 MacArgPtr=AsciiByte
xor eax,eax
mov al, byte [AsciiByte]
mov [MacArgPtr],eax
; LN:1527 SrcLine=SrcLine+MacArgBuf(MacArgPtr)
mov esi,MacArgBuf-(1*100)
mov eax, dword [MacArgPtr]
imul eax,100
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,[SrcLine]
mov [_TmpVec2],edi
mov edi,[SrcLine+4]
mov [_TmpVec2+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,SrcLine
mov esi,_TmpVec2
call __MovStr
; LN:1528 GOTO MacExLp
jmp MacExLp
; LN:1529 ENDIF
_Lbl45:
; LN:1530 SrcLine=SrcLine+CHR$(AsciiByte)
xor eax,eax
mov al, byte [AsciiByte]
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov edi,[SrcLine]
mov [_TmpVec2],edi
mov edi,[SrcLine+4]
mov [_TmpVec2+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,SrcLine
mov esi,_TmpVec2
call __MovStr
; LN:1531 GOTO MacExLp
jmp MacExLp
; LN:1532 ENDIF
_Lbl42:
ProcLine:
; LN:1534 SrcNdx=0
mov dword [SrcNdx],0
; LN:1535 IF GenFlag(GFNdx)=0 THEN
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl48
; LN:1536 IF LEFT$(SrcLine,1)<>"$" THEN MainLoop
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst90
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl49
jmp MainLoop
_Lbl49:
; LN:1537 INC SrcNdx
inc [SrcNdx]
; LN:1538 GOSUB NexToken
call NexToken
; LN:1539 IF TokenBuf<>"if" AND TokenBuf<>"else" AND TokenBuf<>"endif" THEN MainLoop
mov esi,_StrConst91
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
mov esi,_StrConst92
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
mov esi,_StrConst93
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl50
jmp MainLoop
_Lbl50:
; LN:1540 IF TokenBuf="if" THEN IFDx
mov esi,_StrConst94
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl51
jmp IFDx
_Lbl51:
; LN:1541 IF TokenBuf="else" THEN ELSEDx
mov esi,_StrConst95
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl52
jmp ELSEDx
_Lbl52:
; LN:1542 GOTO ENDIFDx
jmp ENDIFDx
; LN:1543 ENDIF
_Lbl48:
; LN:1544 IF AsmFlag<>0 THEN
cmp [AsmFlag],0
je _Lbl53
; LN:1545 IF LEFT$(SrcLine,1)<>"$" THEN
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst96
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl54
; LN:1546 OutBuf=SrcLine
mov edi,OutBuf
mov esi,SrcLine
call __MovStr
; LN:1547 GOSUB OutCodeData
call OutCodeData
; LN:1548 GOTO MainLoop
jmp MainLoop
; LN:1549 ELSE
jmp _Lbl55
_Lbl54:
; LN:1550 INC SrcNdx
inc [SrcNdx]
; LN:1551 GOSUB NexToken
call NexToken
; LN:1552 IF TokenBuf="endasm" THEN
mov esi,_StrConst97
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl56
; LN:1553 AsmFlag=0
mov byte [AsmFlag],0
; LN:1554 ELSE
jmp _Lbl57
_Lbl56:
; LN:1555 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:1556 ENDIF
_Lbl57:
; LN:1557 GOTO MainLoop
jmp MainLoop
; LN:1558 ENDIF		
_Lbl55:
; LN:1559 ENDIF	
_Lbl53:
; LN:1560 IF LEN(SrcLine)=0 THEN MainLoop
mov esi,SrcLine
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl58
jmp MainLoop
_Lbl58:
; LN:1561 TempByte=LEFT$(SrcLine,1)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:1562 IF TempByte="'" THEN
mov esi,_StrConst98
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl59
; LN:1563 GOSUB Remark
call Remark
; LN:1564 GOSUB OutCodeData
call OutCodeData
; LN:1565 GOTO MainLoop
jmp MainLoop
; LN:1566 ENDIF
_Lbl59:
; LN:1567 IF TempByte="+" OR TempByte="." THEN
mov esi,_StrConst99
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst100
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl60
; LN:1568 OutBuf=MID$(SrcLine,2,LEN(SrcLine)-1)
mov esi,SrcLine
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
sub eax,edx
mov [_Tmp2],eax
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1569 GOSUB OutCodeData
call OutCodeData
; LN:1570 GOTO MainLoop
jmp MainLoop
; LN:1571 ENDIF
_Lbl60:
; LN:1572 IF TempByte="$" THEN
mov esi,_StrConst101
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl61
; LN:1573 ' Process Directive
; LN:1574 GOSUB Remark
call Remark
; LN:1575 GOSUB OutCodeData
call OutCodeData
; LN:1576 INC SrcNdx
inc [SrcNdx]
; LN:1577 GOSUB NexToken
call NexToken
; LN:1578 IF TokenBuf="if" THEN IFDx
mov esi,_StrConst102
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl62
jmp IFDx
_Lbl62:
; LN:1579 IF TokenBuf="else" THEN ELSEDx
mov esi,_StrConst103
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl63
jmp ELSEDx
_Lbl63:
; LN:1580 IF TokenBuf="endif" THEN ENDIFDx
mov esi,_StrConst104
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl64
jmp ENDIFDx
_Lbl64:
; LN:1581 IF TokenBuf="asm" THEN
mov esi,_StrConst105
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl65
; LN:1582 IF AsmFlag=0 THEN
cmp [AsmFlag],0
jne _Lbl66
; LN:1583 AsmFlag=$ff
mov byte [AsmFlag],255
; LN:1584 GOTO MainLoop
jmp MainLoop
; LN:1585 ENDIF
_Lbl66:
; LN:1586 ENDIF
_Lbl65:
; LN:1587 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:1588 GOTO MainLoop
jmp MainLoop
; LN:1589 ENDIF 
_Lbl61:
; LN:1590 GOSUB NexToken
call NexToken
; LN:1591 SrcNdx=0
mov dword [SrcNdx],0
; LN:1592 IF NextByte<>":" THEN ProcStmt 
mov esi,_StrConst106
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl67
jmp ProcStmt
_Lbl67:
; LN:1594 'ProcLabel
; LN:1595 StartFlag=$ff
mov byte [StartFlag],255
; LN:1596 IF DataFlag=$ff THEN
cmp [DataFlag],255
jne _Lbl68
; LN:1597 DataFlag=0
mov byte [DataFlag],0
; LN:1598 ENDIF
_Lbl68:
; LN:1599 LNFlag=$ff
mov byte [LNFlag],255
; LN:1600 GOSUB TokenSym
call TokenSym
; LN:1601 ErrMain
; LN:1601 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1602 LabelFlag=$ff
mov byte [LabelFlag],255
; LN:1603 TDataType=SymTable(SymNdx).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:1604 TDetail=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDetail],eax
; LN:1605 TDataSize=SymTable(SymNdx).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataSize],eax
; LN:1606 TempStr=SymbolSaf
mov edi,TempStr
mov esi,SymbolSaf
call __MovStr
; LN:1607 SymbolSaf=TempStr
mov edi,SymbolSaf
mov esi,TempStr
call __MovStr
; LN:1608 IF SymFound<>0 THEN' Label Found
cmp [SymFound],0
je _Lbl70
; LN:1609 IF TDataType<>LABELVAR THEN
cmp [TDataType],7
je _Lbl71
; LN:1610 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:1611 GOTO MainLoop
jmp MainLoop
; LN:1612 ENDIF
_Lbl71:
; LN:1613 IF TDetail=LabelUnresolved THEN
cmp [TDetail],0
jne _Lbl72
; LN:1614 SymTable(SymNdx).Detail=LabelResolved
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1615 ELSE
jmp _Lbl73
_Lbl72:
; LN:1616 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:1617 GOTO MainLoop
jmp MainLoop
; LN:1618 ENDIF
_Lbl73:
; LN:1619 ELSE
jmp _Lbl74
_Lbl70:
; LN:1620 GOSUB ClrDatTyp
call ClrDatTyp
; LN:1621 TDataType=LABELVAR
mov word [TDataType],7
; LN:1622 SymTemp.DataType=LABELVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,7
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1623 GOSUB ClrSym
call ClrSym
; LN:1624 SymTemp.DataMod=0
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1625 SymTemp.Detail=LabelResolved
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1626 GOSUB SymInsert
call SymInsert
; LN:1627 ErrMain
; LN:1627 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1628 ENDIF
_Lbl74:
; LN:1629 GOSUB NexToken' Eat the ':'
call NexToken
; LN:1630 GOSUB NexToken
call NexToken
; LN:1631 IF TokenBuf="data" THEN
mov esi,_StrConst107
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl76
; LN:1632 SymTable(SymNdx).DataMod=DataBit
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,128
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1633 GOTO DataX'  DATA statement processing
jmp DataX
; LN:1634 ENDIF
_Lbl76:
; LN:1635 GOSUB UnDoToken
call UnDoToken
; LN:1636 SymbolSaf=SymbolSaf+":"
mov edi,[SymbolSaf]
mov [_TmpVec1],edi
mov edi,[SymbolSaf+4]
mov [_TmpVec1+4],edi
mov edi,[SymbolSaf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst108
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,SymbolSaf
mov esi,_TmpVec1
call __MovStr
ProcStmt:
; LN:1639 GOSUB NexToken
call NexToken
; LN:1640 IF TokenSaf="STATUS" THEN
mov esi,_StrConst109
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl77
; LN:1641 EqualMain
; LN:1641 GOSUB GetEqual
call GetEqual
; LN:1641 ErrMain
; LN:1641 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1642 GOSUB NexToken
call NexToken
; LN:1643 StatFlag=$ff
mov byte [StatFlag],255
; LN:1644 ENDIF
_Lbl77:
; LN:1645 IF LEN(TokenBuf)>0 THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setg bl
or bh,bl
je _Lbl79
; LN:1646 LastStmt=TokenBuf
mov edi,LastStmt
mov esi,TokenBuf
call __MovStr
; LN:1647 ENDIF
_Lbl79:
; LN:1648 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl80
; LN:1649 GOSUB OutLabel
call OutLabel
; LN:1650 GOTO MainLoop
jmp MainLoop
; LN:1651 ENDIF
_Lbl80:
; LN:1652 GOSUB KeyLook
call KeyLook
; LN:1653 IF KeyNdx=0 THEN
cmp [KeyNdx],0
jne _Lbl81
; LN:1654 REM maybe a macro
; LN:1655 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:1656 GOSUB SymSrch
call SymSrch
; LN:1657 IF SymFound=$ff AND SymTable(SymNdx).DataType=MACROVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [SymFound]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,8
cmp eax,edx
sete bl
and bh,bl
je _Lbl82
; LN:1658 GOSUB Remark
call Remark
; LN:1659 GOSUB OutCodeData
call OutCodeData
; LN:1660 MacTblPtr=SymNdx
mov eax, dword [SymNdx]
mov [MacTblPtr],eax
; LN:1661 MacExNdx=SymTable(SymNdx).DataAddr
mov esi,SymTable-(1*60)+36
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [MacExNdx],eax
; LN:1662 SymTable(SymNdx).Detail=SymTable(SymNdx).Detail+1' inc macro occurrance
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov edx,1
add eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1663 NeedComma=0
mov byte [NeedComma],0
; LN:1664 MaxArgNum=0
mov byte [MaxArgNum],0
; LN:1665 MacExFlag=$ff
mov byte [MacExFlag],255
; LN:1666 GOSUB OutLabel
call OutLabel
; LN:1667 IF MID$(SrcLine,SrcNdx+1,1)=" " THEN
mov eax, dword [SrcNdx]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp1]
mov edx,1
call __MidStr
mov esi,_StrConst110
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl83
; LN:1668 INC SrcNdx
inc [SrcNdx]
; LN:1669 ENDIF
_Lbl83:
MacExLoop:
; LN:1671 GOSUB MacToken
call MacToken
; LN:1672 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl84
; LN:1673 GOTO MainLoop
jmp MainLoop
; LN:1674 ENDIF
_Lbl84:
; LN:1675 IF NeedComma=0 AND TokenSaf="," THEN
xor bh,bh
xor eax,eax
mov al, byte [NeedComma]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst111
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl85
; LN:1676 INC MaxArgNum
inc [MaxArgNum]
; LN:1677 MacArgBuf(MaxArgNum)=""
mov esi,MacArgBuf-(1*100)
xor eax,eax
mov al, byte [MaxArgNum]
imul eax,100
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:1678 GOTO MacExLoop
jmp MacExLoop
; LN:1679 ENDIF
_Lbl85:
; LN:1680 IF NeedComma=$ff AND TokenSaf<>"," THEN
xor bh,bh
xor eax,eax
mov al, byte [NeedComma]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst112
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl86
; LN:1681 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:1682 GOTO MainLoop
jmp MainLoop
; LN:1683 ENDIF
_Lbl86:
; LN:1684 IF NeedComma=$ff AND TokenSaf="," THEN
xor bh,bh
xor eax,eax
mov al, byte [NeedComma]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst113
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl87
; LN:1685 NeedComma=0
mov byte [NeedComma],0
; LN:1686 GOTO MacExLoop
jmp MacExLoop
; LN:1687 ENDIF
_Lbl87:
; LN:1688 INC MaxArgNum
inc [MaxArgNum]
; LN:1689 MacArgBuf(MaxArgNum)=TokenSaf
mov esi,MacArgBuf-(1*100)
xor eax,eax
mov al, byte [MaxArgNum]
imul eax,100
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],100
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:1690 NeedComma=$ff
mov byte [NeedComma],255
; LN:1691 GOTO MacExLoop
jmp MacExLoop
; LN:1692 ENDIF
_Lbl82:
; LN:1693 KeyNdx=8' Assume LET
mov dword [KeyNdx],8
; LN:1694 GOSUB UnDoToken
call UnDoToken
; LN:1695 ENDIF
_Lbl81:
; LN:1696 IF KeyNdx<>1 THEN
cmp [KeyNdx],1
je _Lbl88
; LN:1697 DataFlag=0
mov byte [DataFlag],0
; LN:1698 ENDIF
_Lbl88:
; LN:1699 GOSUB Remark
call Remark
; LN:1700 SELECT CASE KeyNdx
mov eax, dword [KeyNdx]
mov [_SwitchInt],eax
; LN:1701 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl90
; LN:1702 GOSUB OutInitData
call OutInitData
; LN:1703 GOTO DataX
jmp DataX
; LN:1704 CASE 6
jmp _Lbl89
_Lbl90:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl91
; LN:1705 GOSUB OutDim
call OutDim
; LN:1706 GOTO TypeX
jmp TypeX
; LN:1707 CASE 7
jmp _Lbl89
_Lbl91:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl92
; LN:1708 GOTO DimX
jmp DimX
; LN:1709 CASE 68
jmp _Lbl89
_Lbl92:
mov eax,68
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl93
; LN:1710 GOSUB OutFunction
call OutFunction
; LN:1711 GOTO FunctionX
jmp FunctionX
; LN:1712 CASE 69
jmp _Lbl89
_Lbl93:
mov eax,69
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl94
; LN:1713 GOSUB OutFunction
call OutFunction
; LN:1714 GOTO ProcedureX
jmp ProcedureX
; LN:1715 CASE ELSE
jmp _Lbl89
_Lbl94:
; LN:1716 StartFlag=$ff
mov byte [StartFlag],255
; LN:1717 GOSUB OutCodeData' put out OmniBasic source as comment
call OutCodeData
; LN:1718 OutBuf=""
mov [OutBuf+12],0
; LN:1719 GOSUB OutLabel
call OutLabel
; LN:1720 GOTO [KeyTable(KeyNdx).KeyLabel]
mov esi,KeyTable-(1*24)+20
mov eax, dword [KeyNdx]
imul eax,24
add esi,eax;
mov [_TmpVec1],esi
mov esi,[_TmpVec1]
jmp dword [esi]
; LN:1721 END SELECT
jmp _Lbl89
_Lbl95:
_Lbl89:
ProcCmd:
; LN:1724 IF Op1Class<>STRClass THEN
cmp [Op1Class],2
je _Lbl96
; LN:1725 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:1726 GOTO MainLoop
jmp MainLoop
; LN:1727 ENDIF
_Lbl96:
; LN:1728 OutBuf="mov dword edi,"+Op1Name
mov esi,_StrConst114
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1729 GOSUB OutCodeData
call OutCodeData
; LN:1730 OutBuf="call __MovArg"
mov edi,[OutBuf]
mov esi,_StrConst115
call __SetStrConst
; LN:1731 GOSUB OutCodeData
call OutCodeData
; LN:1732 RETURN
ret
SETDx:
; LN:1735 SetMask=0
mov byte [SetMask],0
; LN:1736 GOSUB SETDx1
call SETDx1
; LN:1737 GOTO MainLoop
jmp MainLoop
SETDx1:
; LN:1740 ' Changed into a subroutine because is called by
; LN:1741 ' inline code OR CmdLine, so cannot "jump" to MainLoop as before.
; LN:1742 UMFlag=0
mov byte [UMFlag],0
; LN:1743 GOSUB TokenSym
call TokenSym
; LN:1744 ErrRet
; LN:1744 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl97
; LN:1744 RETURN
ret
; LN:1744 ENDIF
_Lbl97:
; LN:1745 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl98
; LN:1746 SymTemp.DataType=COMPVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1747 GOSUB ClrSym
call ClrSym
; LN:1748 GOSUB SymInsert
call SymInsert
; LN:1749 ErrRet
; LN:1749 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl99
; LN:1749 RETURN
ret
; LN:1749 ENDIF
_Lbl99:
; LN:1750 ELSE
jmp _Lbl100
_Lbl98:
; LN:1751 IF SymTable(SymNdx).DataType<>COMPVAR AND SymTable(SymNdx).DataType<> MACROVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,8
cmp eax,edx
setne bl
and bh,bl
je _Lbl101
; LN:1752 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:1753 RETURN
ret
; LN:1754 ENDIF
_Lbl101:
; LN:1755 IF LAND(SymTable(SymNdx).DataMod,SetMask)<>0 THEN
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
xor edx,edx
mov dl, byte [SetMask]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl102
; LN:1756 RETURN
ret
; LN:1757 ENDIF
_Lbl102:
; LN:1758 ENDIF
_Lbl100:
; LN:1759 SymNdxSaf=SymNdx
mov eax, dword [SymNdx]
mov [SymNdxSaf],eax
; LN:1760 EqualRet
; LN:1760 GOSUB GetEqual
call GetEqual
; LN:1760 ErrRet
; LN:1760 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl103
; LN:1760 RETURN
ret
; LN:1760 ENDIF
_Lbl103:
; LN:1761 GOSUB NexToken
call NexToken
; LN:1762 IF TokenBuf="-" THEN
mov esi,_StrConst116
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl104
; LN:1763 UMFlag=$ff
mov byte [UMFlag],255
; LN:1764 GOSUB NexToken
call NexToken
; LN:1765 ENDIF
_Lbl104:
; LN:1766 SELECT CASE TokenType
xor eax,eax
mov al, byte [TokenType]
mov [_SwitchInt],eax
; LN:1767 CASE TTypInt
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl106
; LN:1768 GOSUB ChkInt
call ChkInt
; LN:1769 ErrRet
; LN:1769 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl107
; LN:1769 RETURN
ret
; LN:1769 ENDIF
_Lbl107:
; LN:1770 GOTO SetOp1
jmp SetOp1
; LN:1771 CASE TTypHex
jmp _Lbl105
_Lbl106:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl108
; LN:1772 GOSUB ChkHex
call ChkHex
; LN:1773 ErrRet
; LN:1773 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl109
; LN:1773 RETURN
ret
; LN:1773 ENDIF
_Lbl109:
; LN:1774 GOTO SetOp1
jmp SetOp1
; LN:1775 CASE TTypSym
jmp _Lbl105
_Lbl108:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl110
; LN:1776 GOSUB ChkSym
call ChkSym
; LN:1777 ErrRet
; LN:1777 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl111
; LN:1777 RETURN
ret
; LN:1777 ENDIF
_Lbl111:
; LN:1778 TokenSaf=STR$(SymTable(SymNdx).Detail)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
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
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:1779 GOTO SetOp1
jmp SetOp1
; LN:1780 CASE ELSE
jmp _Lbl105
_Lbl110:
; LN:1781 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:1782 RETURN
ret
; LN:1783 END SELECT
jmp _Lbl105
_Lbl112:
_Lbl105:
SetOp1:
; LN:1785 IF UMFlag=$ff THEN
cmp [UMFlag],255
jne _Lbl113
; LN:1786 TempStr="-"
mov edi,[TempStr]
mov esi,_StrConst117
call __SetStrConst
; LN:1787 ELSE
jmp _Lbl114
_Lbl113:
; LN:1788 TempStr=""
mov [TempStr+12],0
; LN:1789 ENDIF
_Lbl114:
; LN:1790 TempStr=TempStr+TokenSaf
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1791 IF MID$(TempStr,1,2)="--" THEN
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,2
call __MidStr
mov esi,_StrConst118
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl115
; LN:1792 TempStr=MID$(TempStr,2,LEN(TempStr)-2)
mov esi,TempStr
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:1793 ENDIF
_Lbl115:
; LN:1794 CVTemp=VAL(TempStr)
mov esi,[TempStr]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [CVTemp],eax
; LN:1795 GOSUB NexToken
call NexToken
; LN:1796 IF TokenLen=0 THEN SetFinish
cmp [TokenLen],0
je SetFinish
; LN:1797 IF TokenBuf="<" THEN
mov esi,_StrConst119
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl117
; LN:1798 GOSUB NexToken
call NexToken
; LN:1799 IF TokenBuf<>"<" THEN
mov esi,_StrConst120
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl118
; LN:1800 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:1801 RETURN
ret
; LN:1802 ENDIF
_Lbl118:
; LN:1803 TokenType=TTypMath
mov byte [TokenType],3
; LN:1804 ENDIF
_Lbl117:
; LN:1805 IF TokenBuf=">>" THEN
mov esi,_StrConst121
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl119
; LN:1806 TokenType=TTypMath
mov byte [TokenType],3
; LN:1807 ENDIF
_Lbl119:
; LN:1808 IF TokenType<>TTypMath THEN
cmp [TokenType],3
je _Lbl120
; LN:1809 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:1810 RETURN
ret
; LN:1811 ENDIF
_Lbl120:
; LN:1812 CVOp=TokenBuf
mov edi,CVOp
mov esi,TokenBuf
call __MovStr
; LN:1813 GOSUB NexToken
call NexToken
; LN:1814 SELECT CASE TokenType
xor eax,eax
mov al, byte [TokenType]
mov [_SwitchInt],eax
; LN:1815 CASE TTypInt
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl122
; LN:1816 GOSUB ChkInt
call ChkInt
; LN:1817 ErrRet
; LN:1817 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl123
; LN:1817 RETURN
ret
; LN:1817 ENDIF
_Lbl123:
; LN:1818 GOTO SetOperator
jmp SetOperator
; LN:1819 CASE TTypHex
jmp _Lbl121
_Lbl122:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl124
; LN:1820 GOSUB ChkHex
call ChkHex
; LN:1821 ErrRet
; LN:1821 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl125
; LN:1821 RETURN
ret
; LN:1821 ENDIF
_Lbl125:
; LN:1822 GOTO SetOperator
jmp SetOperator
; LN:1823 CASE TTypSym
jmp _Lbl121
_Lbl124:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl126
; LN:1824 GOSUB ChkSym
call ChkSym
; LN:1825 ErrRet
; LN:1825 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl127
; LN:1825 RETURN
ret
; LN:1825 ENDIF
_Lbl127:
; LN:1826 TokenSaf=STR$(SymTable(SymNdx).Detail)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
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
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:1827 GOTO SetOperator
jmp SetOperator
; LN:1828 CASE ELSE
jmp _Lbl121
_Lbl126:
; LN:1829 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:1830 RETURN
ret
; LN:1831 END SELECT
jmp _Lbl121
_Lbl128:
_Lbl121:
SetOperator:
; LN:1833 SymNdx=SymNdxSaf
mov eax, dword [SymNdxSaf]
mov [SymNdx],eax
; LN:1834 SymTable(SymNdx).Detail=CVTemp
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [CVTemp]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1835 IF CVOp="+" THEN
mov esi,_StrConst122
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,CVOp
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl129
; LN:1836 CVTemp=SymTable(SymNdx).Detail+VAL(TokenSaf)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [_Tmp1]
add eax,edx
mov dword [CVTemp],eax
; LN:1837 ENDIF
_Lbl129:
; LN:1838 SELECT CASE CVOp
mov edi,[CVOp]
mov [_SwitchStr],edi
mov edi,[CVOp+4]
mov [_SwitchStr+4],edi
mov edi,[CVOp+8]
mov [_SwitchStr+8],edi
; LN:1839 CASE "-"
mov esi,_StrConst123
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl131
; LN:1840 CVTemp=SymTable(SymNdx).Detail-VAL(TokenSaf)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [_Tmp1]
sub eax,edx
mov dword [CVTemp],eax
; LN:1841 CASE "*"
jmp _Lbl130
_Lbl131:
mov esi,_StrConst124
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl132
; LN:1842 CVTemp=SymTable(SymNdx).Detail*VAL(TokenSaf)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [_Tmp1]
imul edx
mov dword [CVTemp],eax
; LN:1843 CASE "/"
jmp _Lbl130
_Lbl132:
mov esi,_StrConst125
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl133
; LN:1844 CVTemp=SymTable(SymNdx).Detail/VAL(TokenSaf)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [_Tmp1]
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [CVTemp],eax
; LN:1845 CASE "&"
jmp _Lbl130
_Lbl133:
mov esi,_StrConst126
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl134
; LN:1846 CVTemp=LAND(SymTable(SymNdx).Detail,VAL(TokenSaf))
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [_Tmp1]
and eax,edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov dword [CVTemp],eax
; LN:1847 CASE "|"
jmp _Lbl130
_Lbl134:
mov esi,_StrConst127
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl135
; LN:1848 CVTemp=LOR(SymTable(SymNdx).Detail,VAL(TokenSaf))
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [_Tmp1]
or eax,edx
mov [_Tmp2],eax
mov eax, dword [_Tmp2]
mov dword [CVTemp],eax
; LN:1849 END SELECT
jmp _Lbl130
_Lbl135:
_Lbl130:
; LN:1850 IF CVOp="<" OR CVOp=">>" THEN
mov esi,_StrConst128
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,CVOp
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst129
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,CVOp
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl136
; LN:1851 CVTemp=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [CVTemp],eax
; LN:1852 TempInt=VAL(TokenSaf)
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [TempInt],eax
; LN:1853 ';if (CVOp[0] == '>') CVTemp=CVTemp>>TempInt;
; LN:1854 ';else CVTemp=CVTemp<<TempInt;
; LN:1855 ENDIF
_Lbl136:
SetFinish:
; LN:1857 SymNdx=SymNdxSaf
mov eax, dword [SymNdxSaf]
mov [SymNdx],eax
; LN:1858 SymTable(SymNdx).Detail=CVTemp
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [CVTemp]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1859 SymTable(SymNdx).DataMod=SetMask
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [SetMask]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1860 OutBuf=SymTable(SymNdx).SymName+" equ "+STR$(CVTemp)
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [CVTemp]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst130
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:1861 GOSUB OutCodeData
call OutCodeData
; LN:1862 RETURN
ret
MACRODx:
; LN:1865 GOSUB NexToken
call NexToken
; LN:1866 IF TokenType<>TTypSym THEN
cmp [TokenType],5
je _Lbl137
; LN:1867 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:1868 GOTO MainLoop
jmp MainLoop
; LN:1869 ENDIF
_Lbl137:
; LN:1870 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:1871 GOSUB SymSrch
call SymSrch
; LN:1872 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl138
; LN:1873 ErrNo=ErrDupSym'  symbol already defined
mov dword [ErrNo],6
; LN:1874 GOTO MainLoop
jmp MainLoop
; LN:1875 ENDIF
_Lbl138:
; LN:1876 SymTemp.DataType=MACROVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,8
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:1877 GOSUB ClrSym
call ClrSym
; LN:1878 SymTemp.DataAddr=MacDefNdx'  address of macro in macro buffer
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax, dword [MacDefNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:1879 GOSUB SymInsert
call SymInsert
; LN:1880 ErrMain
; LN:1880 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
MacLp:
; LN:1882 IF InpFilPtr=1 THEN
cmp [InpFilPtr],1
jne _Lbl140
; LN:1883 INC BasicLineCtr
inc [BasicLineCtr]
; LN:1884 ENDIF
_Lbl140:
; LN:1885 GOSUB ReadSource
call ReadSource
; LN:1886 IF TempInt=0 THEN
cmp [TempInt],0
jne _Lbl141
; LN:1887 PRINT "FATAL ERROR.. EOF in MACRO"
mov esi,_StrConst131
mov [_TmpVec1],esi
mov [_TmpVec1+4],27
mov [_TmpVec1+8],0
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
jne _OELbl28
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl28:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1888 END
xor eax,eax
invoke ExitProcess, eax
; LN:1889 ENDIF
_Lbl141:
MacLpExit:
; LN:1891 GOSUB NexToken
call NexToken
; LN:1892 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:1893 CASE "macro"
mov esi,_StrConst132
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl143
; LN:1894 ErrNo=ErrMacNst'  nested macro
mov dword [ErrNo],15
; LN:1895 GOTO MainLoop
jmp MainLoop
; LN:1896 CASE "endmacro"
jmp _Lbl142
_Lbl143:
mov esi,_StrConst133
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl144
; LN:1897 MacBuf(MacDefNdx)=0
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1898 GOSUB MacDefInc
call MacDefInc
; LN:1899 GOTO MainLoop
jmp MainLoop
; LN:1900 CASE "end"
jmp _Lbl142
_Lbl144:
mov esi,_StrConst134
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl145
; LN:1901 GOSUB NexToken
call NexToken
; LN:1902 IF TokenBuf="macro" THEN
mov esi,_StrConst135
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl146
; LN:1903 MacBuf(MacDefNdx)=0
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1904 GOSUB MacDefInc
call MacDefInc
; LN:1905 GOTO MainLoop
jmp MainLoop
; LN:1906 ENDIF
_Lbl146:
; LN:1907 END SELECT	
jmp _Lbl142
_Lbl145:
_Lbl142:
; LN:1908 SrcNdx=0
mov dword [SrcNdx],0
lbl7027:
; LN:1910 INC SrcNdx
inc [SrcNdx]
; LN:1911 IF SrcNdx>LEN(SrcLine) THEN
mov esi,SrcLine
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [SrcNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl147
; LN:1912 MacBuf(MacDefNdx)=NewLine
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [NewLine]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1913 GOSUB MacDefInc
call MacDefInc
; LN:1914 ErrMain
; LN:1914 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1915 GOTO MacLp
jmp MacLp
; LN:1916 ENDIF
_Lbl147:
; LN:1917 IF MID$(SrcLine,SrcNdx,1)="~" THEN
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [SrcNdx]
mov edx,1
call __MidStr
mov esi,_StrConst136
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl149
; LN:1918 INC SrcNdx
inc [SrcNdx]
; LN:1919 TempByte=MID$(SrcLine,SrcNdx,1)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [SrcNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:1920 AsciiByte=ASC(TempByte)
mov esi,[TempByte]
mov al, byte [esi]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1921 IF TempByte>="0" AND TempByte<="9" THEN
mov esi,_StrConst137
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst138
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl150
; LN:1922 AsciiByte=LAND($0f,AsciiByte)
mov eax,15
xor edx,edx
mov dl, byte [AsciiByte]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1923 AsciiByte=LOR($80,AsciiByte)
mov eax,128
xor edx,edx
mov dl, byte [AsciiByte]
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1924 MacBuf(MacDefNdx)=AsciiByte
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [AsciiByte]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1925 GOSUB MacDefInc
call MacDefInc
; LN:1926 ErrMain
; LN:1926 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1927 GOTO lbl7027
jmp lbl7027
; LN:1928 ENDIF
_Lbl150:
; LN:1929 AsciiByte=LAND(AsciiByte,$4f)' make upper case
xor eax,eax
mov al, byte [AsciiByte]
mov edx,79
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1930 TempByte=CHR$(AsciiByte)
xor eax,eax
mov al, byte [AsciiByte]
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:1931 IF TempByte>="A" AND TempByte<="F" THEN
mov esi,_StrConst139
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst140
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl152
; LN:1932 AsciiByte=LAND($0f,AsciiByte)
mov eax,15
xor edx,edx
mov dl, byte [AsciiByte]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1933 AsciiByte=LOR($80,AsciiByte)
mov eax,128
xor edx,edx
mov dl, byte [AsciiByte]
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1934 AsciiByte=AsciiByte+9
xor eax,eax
mov al, byte [AsciiByte]
mov edx,9
add eax,edx
mov byte [AsciiByte],al
; LN:1935 MacBuf(MacDefNdx)=AsciiByte
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [AsciiByte]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1936 GOSUB MacDefInc
call MacDefInc
; LN:1937 ErrMain
; LN:1937 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1938 GOTO lbl7027
jmp lbl7027
; LN:1939 ENDIF
_Lbl152:
; LN:1940 ErrNo=ErrIVMac
mov dword [ErrNo],17
; LN:1941 GOTO MainLoop
jmp MainLoop
; LN:1942 ENDIF
_Lbl149:
; LN:1943 TempByte=MID$(SrcLine,SrcNdx,1)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [SrcNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:1944 AsciiByte=ASC(TempByte)
mov esi,[TempByte]
mov al, byte [esi]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:1945 MacBuf(MacDefNdx)=AsciiByte
mov esi,MacBuf-(1*1)
mov eax, dword [MacDefNdx]
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov al, byte [AsciiByte]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:1946 GOSUB MacDefInc
call MacDefInc
; LN:1947 ErrMain
; LN:1947 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1948 GOTO lbl7027
jmp lbl7027
ENDMDx:
; LN:1951 ErrNo=ErrEndm
mov dword [ErrNo],18
; LN:1952 GOTO MainLoop
jmp MainLoop
IFDx:
; LN:1955 CondValid=GenFlag(GFNdx)
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [CondValid],al
; LN:1956 INC GFNdx
inc [GFNdx]
; LN:1957 IF GFNdx>20 THEN
cmp [GFNdx],20
jle _Lbl155
; LN:1958 PRINT "FATAL Error Conditional stack overflow"
mov esi,_StrConst141
mov [_TmpVec1],esi
mov [_TmpVec1+4],39
mov [_TmpVec1+8],0
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
jne _OELbl29
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl29:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:1959 END
xor eax,eax
invoke ExitProcess, eax
; LN:1960 ENDIF
_Lbl155:
; LN:1961 UMFlag=0
mov byte [UMFlag],0
; LN:1962 GOSUB TokenSym
call TokenSym
; LN:1963 ErrMain
; LN:1963 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1964 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl157
; LN:1965 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:1966 GOTO MainLoop
jmp MainLoop
; LN:1967 ENDIF
_Lbl157:
; LN:1968 IF SymTable(SymNdx).DataType<>COMPVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl158
; LN:1969 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:1970 GOTO MainLoop
jmp MainLoop
; LN:1971 ENDIF
_Lbl158:
; LN:1972 CondOp1=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [CondOp1],eax
; LN:1973 EqualMain
; LN:1973 GOSUB GetEqual
call GetEqual
; LN:1973 ErrMain
; LN:1973 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1974 GOSUB NexToken
call NexToken
; LN:1975 IF TokenBuf="-" THEN
mov esi,_StrConst142
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl160
; LN:1976 UMFlag=$ff
mov byte [UMFlag],255
; LN:1977 GOSUB NexToken
call NexToken
; LN:1978 ENDIF
_Lbl160:
; LN:1979 SELECT CASE TokenType
xor eax,eax
mov al, byte [TokenType]
mov [_SwitchInt],eax
; LN:1980 CASE TTypInt
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl162
; LN:1981 GOSUB ChkInt
call ChkInt
; LN:1982 ErrMain
; LN:1982 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1983 GOTO IFDx1
jmp IFDx1
; LN:1984 CASE TTypHex
jmp _Lbl161
_Lbl162:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl164
; LN:1985 GOSUB ChkHex
call ChkHex
; LN:1986 ErrMain
; LN:1986 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:1987 GOTO IFDx1
jmp IFDx1
; LN:1988 CASE TTypSym
jmp _Lbl161
_Lbl164:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl166
; LN:1989 GOSUB TokenSym1
call TokenSym1
; LN:1990 ErrRet
; LN:1990 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl167
; LN:1990 RETURN
ret
; LN:1990 ENDIF
_Lbl167:
; LN:1991 TokenSaf=STR$(SymTable(SymNdx).Detail)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
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
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:1992 GOTO IFDx1
jmp IFDx1
; LN:1993 CASE ELSE
jmp _Lbl161
_Lbl166:
; LN:1994 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:1995 GOTO MainLoop
jmp MainLoop
; LN:1996 END SELECT
jmp _Lbl161
_Lbl168:
_Lbl161:
IFDx1:
; LN:1998 IF UMFlag=$ff THEN
cmp [UMFlag],255
jne _Lbl169
; LN:1999 TempStr="-"
mov edi,[TempStr]
mov esi,_StrConst143
call __SetStrConst
; LN:2000 ELSE
jmp _Lbl170
_Lbl169:
; LN:2001 TempStr=""
mov [TempStr+12],0
; LN:2002 ENDIF
_Lbl170:
; LN:2003 TempStr=TempStr+TokenSaf
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:2004 IF MID$(TempStr,1,2)="--" THEN
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,2
call __MidStr
mov esi,_StrConst144
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl171
; LN:2005 TempStr=MID$(TempStr,2,LEN(TempStr)-2)
mov esi,TempStr
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:2006 ENDIF
_Lbl171:
; LN:2007 CondOp2=VAL(TempStr)
mov esi,[TempStr]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [CondOp2],eax
; LN:2008 IF CondOp1=CondOp2 AND CondValid=$ff THEN
xor bh,bh
mov eax, dword [CondOp1]
mov edx, dword [CondOp2]
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [CondValid]
mov edx,255
cmp eax,edx
sete bl
and bh,bl
je _Lbl172
; LN:2009 GenFlag(GFNdx)=$ff
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2010 ELSE
jmp _Lbl173
_Lbl172:
; LN:2011 GenFlag(GFNdx)=0
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2012 ENDIF
_Lbl173:
; LN:2013 GOTO MainLoop
jmp MainLoop
ELSEDx:
; LN:2016 IF GFNdx<2 THEN
cmp [GFNdx],2
jge _Lbl174
; LN:2017 PRINT "FATAL ERROR Conditional stack error (#ELSE)"
mov esi,_StrConst145
mov [_TmpVec1],esi
mov [_TmpVec1+4],44
mov [_TmpVec1+8],0
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
jne _OELbl30
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl30:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:2018 END
xor eax,eax
invoke ExitProcess, eax
; LN:2019 ENDIF
_Lbl174:
; LN:2020 IF GenFlag(GFNdx-1)=$ff THEN
mov eax, dword [GFNdx]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,GenFlag-(1*1)
mov eax, dword [_Tmp1]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
je _Lbl175
; LN:2021 GenFlag(GFNdx)=LNOT(GenFlag(GFNdx))
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
not eax
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2022 ENDIF
_Lbl175:
; LN:2023 GOTO MainLoop
jmp MainLoop
ENDIFDx:
; LN:2026 DEC GFNdx
dec [GFNdx]
; LN:2027 IF GFNdx=0 THEN
cmp [GFNdx],0
jne _Lbl176
; LN:2028 PRINT "FATAL ERROR Conditional stack error (#ENDIF)"
mov esi,_StrConst146
mov [_TmpVec1],esi
mov [_TmpVec1+4],45
mov [_TmpVec1+8],0
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
jne _OELbl31
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl31:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:2029 END
xor eax,eax
invoke ExitProcess, eax
; LN:2030 ENDIF
_Lbl176:
; LN:2031 CondValid=GenFlag(GFNdx)
mov esi,GenFlag-(1*1)
mov eax, dword [GFNdx]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [CondValid],al
; LN:2032 GOTO MainLoop
jmp MainLoop
FIXDx:
; LN:2035 SetMask=$80
mov byte [SetMask],128
; LN:2036 GOSUB SETDx1
call SETDx1
; LN:2037 GOTO MainLoop
jmp MainLoop
DataX:
; LN:2040 UseData=TRUE
mov byte [UseData],1
; LN:2041 IF DataFlag=0 THEN
cmp [DataFlag],0
jne _Lbl177
; LN:2042 DataFlag=$ff
mov byte [DataFlag],255
; LN:2043 IF LabelFlag=0 OR SymTable(SymNdx).DataMod<>DataBit THEN
xor bh,bh
xor eax,eax
mov al, byte [LabelFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,128
cmp eax,edx
setne bl
or bh,bl
je _Lbl178
; LN:2044 PRINT "FATAL ERROR... DATA block with no label in line "';BasicLineCtr
mov esi,_StrConst147
mov [_TmpVec1],esi
mov [_TmpVec1+4],49
mov [_TmpVec1+8],0
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
jne _OELbl32
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl32:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:2045 END
xor eax,eax
invoke ExitProcess, eax
; LN:2046 ENDIF
_Lbl178:
; LN:2047 LastStmt="data"' needed for first 'DATA' in block
mov edi,[LastStmt]
mov esi,_StrConst148
call __SetStrConst
; LN:2048 GOSUB Remark
call Remark
; LN:2049 GOSUB OutInitData
call OutInitData
; LN:2050 OutBuf=SymbolSaf+":"
mov edi,[SymbolSaf]
mov [_TmpVec1],edi
mov edi,[SymbolSaf+4]
mov [_TmpVec1+4],edi
mov edi,[SymbolSaf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst149
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2051 GOSUB OutInitData
call OutInitData
; LN:2052 ENDIF
_Lbl177:
; LN:2053 NeedComma=0
mov byte [NeedComma],0
DATALoop:
; LN:2055 GOSUB NexToken
call NexToken
; LN:2056 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl179
; LN:2057 GOTO MainLoop
jmp MainLoop
; LN:2058 ENDIF
_Lbl179:
; LN:2059 IF NeedComma=0 AND TokenBuf="," THEN
xor bh,bh
xor eax,eax
mov al, byte [NeedComma]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst150
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl180
; LN:2060 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2061 GOTO MainLoop
jmp MainLoop
; LN:2062 ENDIF
_Lbl180:
; LN:2063 IF NeedComma=$ff AND TokenBuf="," THEN
xor bh,bh
xor eax,eax
mov al, byte [NeedComma]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst151
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl181
; LN:2064 NeedComma=0
mov byte [NeedComma],0
; LN:2065 GOTO DATALoop
jmp DATALoop
; LN:2066 ENDIF
_Lbl181:
; LN:2067 IF TokenType=TTypQuote THEN
cmp [TokenType],4
jne _Lbl182
; LN:2068 TempStr=MID$(TokenSaf,2,LEN(TokenSaf)-2)
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:2069 GOTO NextData
jmp NextData
; LN:2070 ENDIF
_Lbl182:
; LN:2071 SELECT CASE TokenType
xor eax,eax
mov al, byte [TokenType]
mov [_SwitchInt],eax
; LN:2072 CASE TTypHex
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl184
; LN:2073 GOSUB ChkHex
call ChkHex
; LN:2074 ErrMain
; LN:2074 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2075 TempStr=TokenSaf
mov edi,TempStr
mov esi,TokenSaf
call __MovStr
; LN:2076 GOTO NextData
jmp NextData
; LN:2077 CASE TTypInt
jmp _Lbl183
_Lbl184:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl186
; LN:2078 GOSUB ChkInt
call ChkInt
; LN:2079 ErrMain
; LN:2079 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2080 TempStr=TokenSaf
mov edi,TempStr
mov esi,TokenSaf
call __MovStr
; LN:2081 GOTO NextData
jmp NextData
; LN:2082 CASE TTypFloat
jmp _Lbl183
_Lbl186:
mov eax,10
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl188
; LN:2083 GOSUB ChkFlt
call ChkFlt
; LN:2084 ErrMain
; LN:2084 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2085 TempStr=TokenSaf
mov edi,TempStr
mov esi,TokenSaf
call __MovStr
; LN:2086 GOTO NextData
jmp NextData
; LN:2087 CASE TTypSym
jmp _Lbl183
_Lbl188:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl190
; LN:2088 IF TokenBuf="true" OR TokenBuf="false" THEN
mov esi,_StrConst152
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst153
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl191
; LN:2089 IF TokenBuf="true" THEN
mov esi,_StrConst154
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl192
; LN:2090 TempStr="1"
mov edi,[TempStr]
mov esi,_StrConst155
call __SetStrConst
; LN:2091 ELSE
jmp _Lbl193
_Lbl192:
; LN:2092 TempStr="0"
mov edi,[TempStr]
mov esi,_StrConst156
call __SetStrConst
; LN:2093 ENDIF
_Lbl193:
; LN:2094 GOTO NextData
jmp NextData
; LN:2095 ENDIF
_Lbl191:
; LN:2096 GOSUB TokenSym1
call TokenSym1
; LN:2097 ErrMain
; LN:2097 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2098 TDataType=SymTable(SymNdx).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:2099 IF TDataType<>COMPVAR THEN
cmp [TDataType],0
je _Lbl195
; LN:2100 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2101 GOTO MainLoop
jmp MainLoop
; LN:2102 ENDIF
_Lbl195:
; LN:2103 Konstant=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [Konstant],eax
; LN:2104 TempStr=STR$(Konstant)
mov eax, dword [Konstant]
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
; LN:2105 GOTO NextData
jmp NextData
; LN:2106 CASE ELSE
jmp _Lbl183
_Lbl190:
; LN:2107 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2108 GOTO MainLoop
jmp MainLoop
; LN:2109 END SELECT
jmp _Lbl183
_Lbl196:
_Lbl183:
NextData:
; LN:2111 IF TempStr="" THEN
xor bh,bh
mov edi,TempStr
mov esi,_NullStr
call __CmpStr
sete bl
or bh,bl
je _Lbl197
; LN:2112 TempStr=CHR$($80)
mov eax,128
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:2113 ENDIF
_Lbl197:
; LN:2114 OutBuf="db "+CHR$(OBQUOTE)+TempStr+CHR$(OBQUOTE)+",0"
mov eax,34
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov eax,34
mov esi,_ChrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],1
mov [_TmpVec2+8],0
mov [_ChrTmp2],al
mov esi,_StrConst157
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov edi,[TempStr]
mov [_TmpVec4],edi
mov edi,[TempStr+4]
mov [_TmpVec4+4],edi
mov edi,[TempStr+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst158
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:2115 GOSUB OutInitData
call OutInitData
; LN:2116 NeedComma=$ff
mov byte [NeedComma],255
; LN:2117 GOTO DATALoop
jmp DATALoop
RestoreX:
; LN:2120 GOSUB ChkLabel
call ChkLabel
; LN:2121 ErrMain
; LN:2121 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2122 IF SymTable(SymNdx).DataType<>LABELVAR OR SymTable(SymNdx).DataMod<>DataBit THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,7
cmp eax,edx
setne bl
or bh,bl
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,128
cmp eax,edx
setne bl
or bh,bl
je _Lbl199
; LN:2123 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2124 GOTO MainLoop
jmp MainLoop
; LN:2125 ENDIF
_Lbl199:
; LN:2126 OutBuf="mov dword [_DataPtr],"+SymbolSaf
mov esi,_StrConst159
mov [_TmpVec1],esi
mov [_TmpVec1+4],22
mov [_TmpVec1+8],0
mov edi,[SymbolSaf]
mov [_TmpVec2],edi
mov edi,[SymbolSaf+4]
mov [_TmpVec2+4],edi
mov edi,[SymbolSaf+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2127 GOSUB OutCodeData
call OutCodeData
; LN:2128 GOTO MainLoop
jmp MainLoop
PokeX:
; LN:2131 GOSUB GetIntOp' get addr
call GetIntOp
; LN:2132 ErrMain
; LN:2132 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2133 OutBuf="mov dword _Poker=eax"
mov edi,[OutBuf]
mov esi,_StrConst160
call __SetStrConst
; LN:2134 GOSUB OutCodeData
call OutCodeData
; LN:2135 CommaMain
; LN:2135 GOSUB GetComma
call GetComma
; LN:2135 ErrMain
; LN:2135 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2136 GOSUB GetIntOp' get data
call GetIntOp
; LN:2137 ErrMain
; LN:2137 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2138 OutBuf="mov dword [_Poker],eax"
mov edi,[OutBuf]
mov esi,_StrConst161
call __SetStrConst
; LN:2139 GOSUB OutCodeData
call OutCodeData
; LN:2140 GOTO MainLoop
jmp MainLoop
ReturnX:
; LN:2143 IF FcnFlag<>0 THEN
cmp [FcnFlag],0
je _Lbl203
; LN:2144 GOSUB NexToken
call NexToken
; LN:2145 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl204
; LN:2146 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2147 GOTO MainLoop
jmp MainLoop
; LN:2148 ENDIF
_Lbl204:
; LN:2149 GOSUB UnDoToken
call UnDoToken
; LN:2150 GOSUB Expr
call Expr
; LN:2151 ErrMain
; LN:2151 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2152 SELECT CASE TFcnDataType
xor eax,eax
mov al, byte [TFcnDataType]
mov [_SwitchInt],eax
; LN:2153 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl207
; LN:2154 IF TDataType<>BOOLVAR THEN
cmp [TDataType],1
je _Lbl208
; LN:2155 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2156 GOTO MainLoop
jmp MainLoop
; LN:2157 ENDIF
_Lbl208:
; LN:2158 OutBuf="mov byte al,["+TSymName+"]"
mov esi,_StrConst162
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst163
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2159 CASE LONGVAR
jmp _Lbl206
_Lbl207:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl209
; LN:2160 IF TDataType<>LONGVAR THEN
cmp [TDataType],4
je _Lbl210
; LN:2161 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2162 GOTO MainLoop
jmp MainLoop
; LN:2163 ENDIF
_Lbl210:
; LN:2164 IF TSymName<>"~" THEN
mov esi,_StrConst164
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl211
; LN:2165 OutBuf="mov eax,["+TSymName+"]"
mov esi,_StrConst165
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst166
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2166 GOSUB OutFunction
call OutFunction
; LN:2167 ENDIF
_Lbl211:
; LN:2168 OutBuf="mov [_LongRet],eax"			
mov edi,[OutBuf]
mov esi,_StrConst167
call __SetStrConst
; LN:2169 CASE STRINGVAR
jmp _Lbl206
_Lbl209:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl212
; LN:2170 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl213
; LN:2171 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2172 GOTO MainLoop
jmp MainLoop
; LN:2173 ENDIF
_Lbl213:
; LN:2174 OutBuf="mov edi,["+TSymName+"]"
mov esi,_StrConst168
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst169
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2175 GOSUB OutFunction
call OutFunction
; LN:2176 OutBuf="mov [_StringRet],edi"
mov edi,[OutBuf]
mov esi,_StrConst170
call __SetStrConst
; LN:2177 GOSUB OutFunction
call OutFunction
; LN:2178 OutBuf="mov edi,["+TSymName+"+4]"
mov esi,_StrConst171
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst172
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2179 GOSUB OutFunction
call OutFunction
; LN:2180 OutBuf="mov [_StringRet+4],edi"
mov edi,[OutBuf]
mov esi,_StrConst173
call __SetStrConst
; LN:2181 GOSUB OutFunction
call OutFunction
; LN:2182 OutBuf="mov edi,["+TSymName+"+8]"
mov esi,_StrConst174
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst175
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2183 GOSUB OutFunction
call OutFunction
; LN:2184 OutBuf="mov [_StringRet+8],edi"
mov edi,[OutBuf]
mov esi,_StrConst176
call __SetStrConst
; LN:2185 CASE FLOATVAR
jmp _Lbl206
_Lbl212:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl214
; LN:2186 IF TDataType<>FLOATVAR THEN
cmp [TDataType],5
je _Lbl215
; LN:2187 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2188 GOTO MainLoop
jmp MainLoop
; LN:2189 ENDIF
_Lbl215:
; LN:2190 END SELECT
jmp _Lbl206
_Lbl214:
_Lbl206:
; LN:2191 GOSUB OutFunction
call OutFunction
; LN:2192 ENDIF
_Lbl203:
; LN:2193 OutBuf="ret"
mov edi,[OutBuf]
mov esi,_StrConst177
call __SetStrConst
; LN:2194 GOSUB OutCodeData
call OutCodeData
; LN:2195 GOTO MainLoop
jmp MainLoop
SeekX:
; LN:2198 DiskIO=$ff
mov byte [DiskIO],255
; LN:2199 GOSUB GetPthNum
call GetPthNum
; LN:2200 ErrMain
; LN:2200 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2201 GOSUB Expr
call Expr
; LN:2202 ErrMain
; LN:2202 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2203 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,5
cmp eax,edx
setne bl
and bh,bl
je _Lbl218
; LN:2204 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2205 ErrMain
; LN:2205 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2206 ENDIF
_Lbl218:
; LN:2207 GOSUB LoadNumericValue
call LoadNumericValue
; LN:2208 OutBuf="invoke SetFilePointer,[_IOPthNum],eax,0,FILE_BEGIN"
mov edi,[OutBuf]
mov esi,_StrConst178
call __SetStrConst
; LN:2209 GOSUB OutCodeData
call OutCodeData
; LN:2210 GOSUB SetStatus
call SetStatus
; LN:2211 GOSUB CallErr
call CallErr
; LN:2212 GOTO MainLoop
jmp MainLoop
TypeX:
; LN:2215 IF ProcFcnFlag<>0 THEN
cmp [ProcFcnFlag],0
je _Lbl220
; LN:2216 ErrNo=ErrTypeFcn
mov dword [ErrNo],38
; LN:2217 GOTO MainLoop
jmp MainLoop
; LN:2218 ENDIF
_Lbl220:
; LN:2219 GOSUB ClrDatTyp
call ClrDatTyp
; LN:2220 GOSUB TokenSym
call TokenSym
; LN:2221 ErrMain
; LN:2221 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2222 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl222
; LN:2223 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:2224 GOTO MainLoop
jmp MainLoop
; LN:2225 ENDIF
_Lbl222:
; LN:2226 TypeFlag=$ff
mov byte [TypeFlag],255
; LN:2227 TypePtr=SymNdx
mov eax, dword [SymNdx]
mov [TypePtr],eax
; LN:2228 TypeVars=0
mov dword [TypeVars],0
; LN:2229 TypeBytes=0
mov dword [TypeBytes],0
; LN:2230 SymTemp.DataType=TYPE
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,12
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:2231 GOSUB ClrSym
call ClrSym
; LN:2232 GOSUB SymInsert
call SymInsert
; LN:2233 ErrMain
; LN:2233 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
TypeLp:
; LN:2235 TDataMod=0
mov word [TDataMod],0
; LN:2236 IF InpFilPtr=1 THEN
cmp [InpFilPtr],1
jne _Lbl224
; LN:2237 INC BasicLineCtr
inc [BasicLineCtr]
; LN:2238 ENDIF
_Lbl224:
; LN:2239 GOSUB ReadSource
call ReadSource
; LN:2240 IF TempInt=0 THEN
cmp [TempInt],0
jne _Lbl225
; LN:2241 PRINT "Fatal Error: EOF in TYPE"
mov esi,_StrConst179
mov [_TmpVec1],esi
mov [_TmpVec1+4],25
mov [_TmpVec1+8],0
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
jne _OELbl33
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl33:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:2242 END
xor eax,eax
invoke ExitProcess, eax
; LN:2243 ENDIF
_Lbl225:
TypeLp2:
; LN:2245 GOSUB NexToken
call NexToken
; LN:2246 IF TokenBuf="end" THEN
mov esi,_StrConst180
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl226
; LN:2247 GOSUB NexToken
call NexToken
; LN:2248 IF TokenBuf="type" THEN TypeEnd
mov esi,_StrConst181
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl227
jmp TypeEnd
_Lbl227:
; LN:2249 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2250 ENDIF
_Lbl226:
; LN:2251 IF TokenBuf="endtype" THEN TypeEnd
mov esi,_StrConst182
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl228
jmp TypeEnd
_Lbl228:
; LN:2252 GOSUB UnDoToken		
call UnDoToken
; LN:2253 IF LEFT$(SrcLine,1)="*" THEN TypeLp
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst183
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl229
jmp TypeLp
_Lbl229:
; LN:2254 GOSUB DimVar
call DimVar
; LN:2255 IF DimOK=0 THEN MainLoop
cmp [DimOK],0
je MainLoop
; LN:2256 INC TypeVars
inc [TypeVars]
; LN:2257 SymTemp.DataAddr=TypeBytes
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax, dword [TypeBytes]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2258 GOSUB SymInsert
call SymInsert
; LN:2259 ErrMain 
; LN:2259 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2260 TypeBytes=TypeBytes+SymTemp.DataSize
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax, dword [TypeBytes]
mov edi,[_TmpVec1]
mov edx, dword [edi]
add eax,edx
mov dword [TypeBytes],eax
; LN:2261 IF MultiFlag=$ff THEN
cmp [MultiFlag],255
jne _Lbl232
; LN:2262 'GOSUB AddMulti
; LN:2263 ErrMain
; LN:2263 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2264 ENDIF
_Lbl232:
; LN:2265 GOTO TypeLp
jmp TypeLp
TypeEnd:
; LN:2267 SymTable(TypePtr).DataSize=TypeBytes
mov esi,SymTable-(1*60)+40
mov eax, dword [TypePtr]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TypeBytes]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2268 SymTable(TypePtr).Detail=TypeVars
mov esi,SymTable-(1*60)+32
mov eax, dword [TypePtr]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TypeVars]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2269 GOTO MainLoop
jmp MainLoop
DimX:
; LN:2272 GblVarFlg=0
mov byte [GblVarFlg],0
; LN:2273 GOSUB DimVar
call DimVar
; LN:2274 IF DimOK=0 THEN MainLoop
cmp [DimOK],0
je MainLoop
; LN:2275 GOSUB SymInsert
call SymInsert
; LN:2276 ErrMain
; LN:2276 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2277 GOSUB DecVar
call DecVar
; LN:2278 IF MultiFlag=$ff THEN
cmp [MultiFlag],255
jne _Lbl236
; LN:2279 'GOSUB AddMulti
; LN:2280 ENDIF
_Lbl236:
; LN:2281 GOTO MainLoop
jmp MainLoop
LetX:
; LN:2284 GOSUB Let
call Let
; LN:2285 GOTO MainLoop
jmp MainLoop
Let:
; LN:2288 Target=$ff
mov byte [Target],255
; LN:2289 LetFlag=$ff
mov byte [LetFlag],255
; LN:2290 GOSUB Expr
call Expr
; LN:2291 ErrRet
; LN:2291 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl237
; LN:2291 RETURN
ret
; LN:2291 ENDIF
_Lbl237:
; LN:2292 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl238
; LN:2293 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:2294 RETURN
ret
; LN:2295 ENDIF
_Lbl238:
; LN:2296 Op1Name=TSymName
mov edi,Op1Name
mov esi,TSymName
call __MovStr
; LN:2297 Op1Type=TDataType
mov ax, word [TDataType]
mov [Op1Type],al
; LN:2298 Op1Class=OpClass
mov al, byte [OpClass]
mov [Op1Class],al
; LN:2299 SELECT CASE Op1Type
xor eax,eax
mov al, byte [Op1Type]
mov [_SwitchInt],eax
; LN:2300 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl240
; LN:2301 OpSizeStr=" byte "
mov edi,[OpSizeStr]
mov esi,_StrConst184
call __SetStrConst
; LN:2302 CASE 2
jmp _Lbl239
_Lbl240:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl241
; LN:2303 OpSizeStr=" byte "
mov edi,[OpSizeStr]
mov esi,_StrConst185
call __SetStrConst
; LN:2304 CASE 3
jmp _Lbl239
_Lbl241:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl242
; LN:2305 OpSizeStr=" word "
mov edi,[OpSizeStr]
mov esi,_StrConst186
call __SetStrConst
; LN:2306 CASE 4
jmp _Lbl239
_Lbl242:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl243
; LN:2307 OpSizeStr=" dword "
mov edi,[OpSizeStr]
mov esi,_StrConst187
call __SetStrConst
; LN:2308 CASE ELSE
jmp _Lbl239
_Lbl243:
; LN:2309 OpSizeStr=" "
mov edi,[OpSizeStr]
mov esi,_StrConst188
call __SetStrConst
; LN:2310 END SELECT
jmp _Lbl239
_Lbl244:
_Lbl239:
; LN:2311 Op1Mod=TDataMod
mov ax, word [TDataMod]
mov [Op1Mod],ax
; LN:2312 Op1Detail=TDetail
mov eax, dword [TDetail]
mov [Op1Detail],eax
; LN:2313 Op1DataSize=TDataSize
mov eax, dword [TDataSize]
mov [Op1DataSize],eax
; LN:2314 IF Op1Name="NextArg" THEN
mov esi,_StrConst189
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,Op1Name
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl245
; LN:2315 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:2316 RETURN
ret
; LN:2317 ENDIF
_Lbl245:
; LN:2318 IF LAND(TempBit,Op1Mod)<>0 AND LAND(VectorBit,Op1Mod)=0 THEN
mov eax,64
xor edx,edx
mov dx, word [Op1Mod]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov eax,32
xor edx,edx
mov dx, word [Op1Mod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl246
; LN:2319 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:2320 RETURN
ret
; LN:2321 ENDIF 
_Lbl246:
; LN:2322 GOSUB NexToken
call NexToken
; LN:2323 IF TokenBuf<>"=" THEN
mov esi,_StrConst190
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl247
; LN:2324 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2325 RETURN
ret
; LN:2326 ENDIF
_Lbl247:
; LN:2327 IF Op1Mod=VectorBit AND Op1Type=STRINGVAR AND NextByte=CHR$($22) THEN
xor bh,bh
xor eax,eax
mov ax, word [Op1Mod]
mov edx,32
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Type]
mov edx,6
cmp eax,edx
sete bl
and bh,bl
mov eax,34
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl248
; LN:2328 GOSUB NexToken
call NexToken
; LN:2329 IF RIGHT$(TokenSaf,1)<>CHR$(OBQUOTE) THEN
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
call __RightStr
mov eax,34
mov esi,_ChrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],1
mov [_TmpVec2+8],0
mov [_ChrTmp1],al
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl249
; LN:2330 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2331 RETURN
ret
; LN:2332 ENDIF
_Lbl249:
; LN:2333 IF LEN(TokenBuf)=2 THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl250
; LN:2334 OutBuf="mov ["+Op1Name+"+12],0"
mov esi,_StrConst191
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst192
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2335 GOSUB OutCode
call OutCode
; LN:2336 GOTO MainLoop
jmp MainLoop
; LN:2337 ELSE
jmp _Lbl251
_Lbl250:
; LN:2338 IF NextByte<>"+" AND Op1Detail>LEN(TokenSaf) THEN
mov esi,_StrConst193
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [Op1Detail]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
and bh,bl
je _Lbl252
; LN:2339 OutBuf="mov edi,["+Op1Name+"]"
mov esi,_StrConst194
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst195
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2340 GOSUB OutCode
call OutCode
; LN:2341 GOSUB MakeStrConst
call MakeStrConst
; LN:2342 OutBuf="mov esi,_StrConst"+STR$(PoolCtr)
mov eax, dword [PoolCtr]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst196
mov [_TmpVec2],esi
mov [_TmpVec2+4],18
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2343 GOSUB OutCode
call OutCode
; LN:2344 UseSetStrConst=TRUE
mov byte [UseSetStrConst],1
; LN:2345 OutBuf="call __SetStrConst"
mov edi,[OutBuf]
mov esi,_StrConst197
call __SetStrConst
; LN:2346 GOSUB OutCode
call OutCode
; LN:2347 GOTO MainLoop
jmp MainLoop
; LN:2348 ENDIF
_Lbl252:
; LN:2349 ENDIF
_Lbl251:
; LN:2350 GOSUB UnDoToken
call UnDoToken
; LN:2351 ENDIF
_Lbl248:
; LN:2352 IF Op1Type=LABELPTR THEN
cmp [Op1Type],16
jne _Lbl253
; LN:2353 GOSUB NexToken
call NexToken
; LN:2354 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:2355 GOSUB SymSrch
call SymSrch
; LN:2356 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl254
; LN:2357 'print "make label here",SrcLine
; LN:2358 ELSE 
jmp _Lbl255
_Lbl254:
; LN:2359 IF  SymTable(SymNdx).DataType<>LABELVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,7
cmp eax,edx
setne bl
or bh,bl
je _Lbl256
; LN:2360 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2361 RETURN
ret
; LN:2362 ENDIF	
_Lbl256:
; LN:2363 ENDIF
_Lbl255:
; LN:2364 IF LAND(VectorBit,Op1Mod)=0 THEN
mov eax,32
xor edx,edx
mov dx, word [Op1Mod]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl257
; LN:2365 OutBuf="mov dword ["+Op1Name+"],"+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst198
mov [_TmpVec2],esi
mov [_TmpVec2+4],12
mov [_TmpVec2+8],0
mov edi,[Op1Name]
mov [_TmpVec3],edi
mov edi,[Op1Name+4]
mov [_TmpVec3+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst199
mov [_TmpVec4],esi
mov [_TmpVec4+4],3
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2366 ELSE
jmp _Lbl258
_Lbl257:
; LN:2367 OutBuf="mov dword esi,["+Op1Name+"]"
mov esi,_StrConst200
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst201
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2368 GOSUB OutCode
call OutCode
; LN:2369 OutBuf="mov dword [esi], dword "+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst202
mov [_TmpVec2],esi
mov [_TmpVec2+4],24
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2370 ENDIF
_Lbl258:
; LN:2371 GOSUB OutCode
call OutCode
; LN:2372 RETURN
ret
; LN:2373 ENDIF
_Lbl253:
; LN:2374 LetFlag=0
mov byte [LetFlag],0
; LN:2375 GOSUB GetExp
call GetExp
; LN:2376 ErrRet
; LN:2376 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl259
; LN:2376 RETURN
ret
; LN:2376 ENDIF
_Lbl259:
; LN:2377 Target=0
mov byte [Target],0
; LN:2378 GOSUB ProcExp
call ProcExp
; LN:2379 ErrRet
; LN:2379 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl260
; LN:2379 RETURN
ret
; LN:2379 ENDIF
_Lbl260:
; LN:2380 GOSUB ClassOp
call ClassOp
; LN:2381 Op2Name=TSymName
mov edi,Op2Name
mov esi,TSymName
call __MovStr
; LN:2382 Op2Class=OpClass
mov al, byte [OpClass]
mov [Op2Class],al
; LN:2383 Op2Type=TDataType
mov ax, word [TDataType]
mov [Op2Type],al
; LN:2384 Op2Mod=TDataMod
mov ax, word [TDataMod]
mov [Op2Mod],ax
; LN:2385 Op2Detail=TDetail
mov eax, dword [TDetail]
mov [Op2Detail],eax
; LN:2386 GOSUB NexToken
call NexToken
; LN:2387 IF TokenLen<>0 THEN' check for junk on end
cmp [TokenLen],0
je _Lbl261
; LN:2388 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2389 RETURN
ret
; LN:2390 ENDIF
_Lbl261:
; LN:2391 IF Op2Name="NextArg" THEN
mov esi,_StrConst203
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,Op2Name
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl262
; LN:2392 GOSUB ProcCmd
call ProcCmd
; LN:2393 RETURN
ret
; LN:2394 ENDIF
_Lbl262:
; LN:2395 IF Op1Class<>Op2Class THEN'  int=float for example
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
xor edx,edx
mov dl, byte [Op2Class]
cmp eax,edx
setne bl
or bh,bl
je _Lbl263
; LN:2396 EXITIF Op1Class=INTClass AND Op2Class=FLTClass
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op2Class]
mov edx,5
cmp eax,edx
sete bl
and bh,bl
jne _Lbl263
; LN:2397 EXITIF Op1Class=FLTClass AND Op2Class=INTClass
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op2Class]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
jne _Lbl263
; LN:2398 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2399 RETURN
ret
; LN:2400 ENDIF
_Lbl263:
; LN:2401 IF Op1Class=INTClass OR Op1Class=FLTClass OR Op1Class=BOOLClass THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
je _Lbl264
; LN:2402 IF TSymName<>"~" THEN
mov esi,_StrConst204
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl265
; LN:2403 TDataType=Op1Type
xor eax,eax
mov al, byte [Op1Type]
mov [TDataType],ax
; LN:2404 GOSUB GetDtaTyp
call GetDtaTyp
; LN:2405 IF Op1Mod=0 AND Op2Mod=ConstBit THEN
xor bh,bh
xor eax,eax
mov ax, word [Op1Mod]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [Op2Mod]
mov edx,4
cmp eax,edx
sete bl
and bh,bl
je _Lbl266
; LN:2406 Op2Name=STR$(Op2Detail)
mov eax, dword [Op2Detail]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,Op2Name
mov esi,_TmpVec1
call __MovStr
; LN:2407 IF Op1Type=BOOLVAR OR Op1Type=BYTEVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Type]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl267
; LN:2408 IF Op2Detail>255 THEN
cmp [Op2Detail],255
jle _Lbl268
; LN:2409 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2410 RETURN
ret
; LN:2411 ENDIF
_Lbl268:
; LN:2412 ENDIF
_Lbl267:
; LN:2413 IF Op1Type=WORDVAR THEN
cmp [Op1Type],3
jne _Lbl269
; LN:2414 IF Op2Detail>65535 THEN
cmp [Op2Detail],65535
jle _Lbl270
; LN:2415 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2416 RETURN
ret
; LN:2417 ENDIF
_Lbl270:
; LN:2418 ENDIF
_Lbl269:
; LN:2419 IF Op1Type=LONGVAR THEN
cmp [Op1Type],4
jne _Lbl271
; LN:2420 IF Op2Detail>$7fffffff THEN
cmp [Op2Detail],2147483647
jle _Lbl272
; LN:2421 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2422 RETURN
ret
; LN:2423 ENDIF
_Lbl272:
; LN:2424 ENDIF
_Lbl271:
; LN:2425 OutBuf="mov"+OpSizeStr+"["+Op1Name+"],"+Op2Name
mov esi,_StrConst205
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[OpSizeStr]
mov [_TmpVec2],edi
mov edi,[OpSizeStr+4]
mov [_TmpVec2+4],edi
mov edi,[OpSizeStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst206
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[Op1Name]
mov [_TmpVec4],edi
mov edi,[Op1Name+4]
mov [_TmpVec4+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst207
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov edi,[Op2Name]
mov [_TmpVec6],edi
mov edi,[Op2Name+4]
mov [_TmpVec6+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec6+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2426 GOSUB OutCodeData
call OutCodeData
; LN:2427 RETURN
ret
; LN:2428 ENDIF
_Lbl266:
; LN:2429 IF Op1Mod=0 AND Op2Mod=0 THEN
xor bh,bh
xor eax,eax
mov ax, word [Op1Mod]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [Op2Mod]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl273
; LN:2430 IF Op1Type>Op2Type AND Op2Type<>BOOLVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
xor edx,edx
mov dl, byte [Op2Type]
cmp eax,edx
setg bl
or bh,bl
mov al, byte [Op2Type]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl274
; LN:2431 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst208
call __SetStrConst
; LN:2432 GOSUB OutCodeData
call OutCodeData
; LN:2433 ENDIF 
_Lbl274:
; LN:2434 IF Op2Type=BOOLVAR OR Op2Type=BYTEVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [Op2Type]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op2Type]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl275
; LN:2435 OutBuf="mov al,["+Op2Name+"]"			
mov esi,_StrConst209
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst210
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2436 GOSUB OutCodeData
call OutCodeData
; LN:2437 GOSUB StoreInt
call StoreInt
; LN:2438 RETURN
ret
; LN:2439 ENDIF
_Lbl275:
; LN:2440 IF Op2Type=WORDVAR THEN
cmp [Op2Type],3
jne _Lbl276
; LN:2441 OutBuf="mov ax,["+Op2Name+"]"			
mov esi,_StrConst211
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst212
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2442 GOSUB OutCodeData
call OutCodeData
; LN:2443 GOSUB StoreInt
call StoreInt
; LN:2444 RETURN
ret
; LN:2445 ENDIF
_Lbl276:
; LN:2446 IF Op2Type=LONGVAR THEN
cmp [Op2Type],4
jne _Lbl277
; LN:2447 OutBuf="mov eax,["+Op2Name+"]"			
mov esi,_StrConst213
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst214
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2448 GOSUB OutCodeData
call OutCodeData
; LN:2449 GOSUB StoreInt
call StoreInt
; LN:2450 RETURN
ret
; LN:2451 ENDIF
_Lbl277:
; LN:2452 ENDIF
_Lbl273:
; LN:2453 D0Loaded=0
mov byte [D0Loaded],0
; LN:2454 GOSUB LoadReg
call LoadReg
; LN:2455 ErrRet
; LN:2455 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl278
; LN:2455 RETURN
ret
; LN:2455 ENDIF
_Lbl278:
; LN:2456 ENDIF
_Lbl265:
; LN:2457 GOSUB StoreD0
call StoreD0
; LN:2458 RETURN
ret
; LN:2459 ENDIF
_Lbl264:
; LN:2460 IF Op1Class=STRClass THEN
cmp [Op1Class],2
jne _Lbl279
; LN:2461 OutBuf="mov edi,"+Op1Name
mov esi,_StrConst215
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2462 GOSUB OutCodeData
call OutCodeData
; LN:2463 OutBuf="mov esi,"+Op2Name
mov esi,_StrConst216
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2464 GOSUB OutCodeData
call OutCodeData
; LN:2465 UseMovStr=TRUE
mov byte [UseMovStr],1
; LN:2466 OutBuf="call __MovStr"
mov edi,[OutBuf]
mov esi,_StrConst217
call __SetStrConst
; LN:2467 GOSUB OutCodeData
call OutCodeData
; LN:2468 RETURN
ret
; LN:2469 ENDIF
_Lbl279:
; LN:2470 IF Op1Class=CPXClass OR Op1Class=ARRClass THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
je _Lbl280
; LN:2471 IF LAND(Op1Mod,VectorBit)=0 THEN
xor eax,eax
mov ax, word [Op1Mod]
mov edx,32
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl281
; LN:2472 OutBuf="mov edi,"+Op1Name
mov esi,_StrConst218
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2473 ELSE
jmp _Lbl282
_Lbl281:
; LN:2474 OutBuf="mov edi,["+Op1Name+"]"
mov esi,_StrConst219
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst220
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2475 ENDIF
_Lbl282:
; LN:2476 GOSUB OutCodeData
call OutCodeData
; LN:2477 IF LAND(Op2Mod,VectorBit)=0 THEN
xor eax,eax
mov ax, word [Op2Mod]
mov edx,32
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl283
; LN:2478 OutBuf="mov esi,"+Op2Name
mov esi,_StrConst221
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2479 ELSE
jmp _Lbl284
_Lbl283:
; LN:2480 OutBuf="mov esi,["+Op2Name+"]; Get src addr"
mov esi,_StrConst222
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst223
mov [_TmpVec3],esi
mov [_TmpVec3+4],16
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2481 ENDIF
_Lbl284:
; LN:2482 GOSUB OutCodeData
call OutCodeData
; LN:2483 IF Op1Class=ARRClass THEN
cmp [Op1Class],3
jne _Lbl285
; LN:2484 TempInt=Op1DataSize
mov eax, dword [Op1DataSize]
mov [TempInt],eax
; LN:2485 ELSE
jmp _Lbl286
_Lbl285:
; LN:2486 TempInt=SymTable(Op1Detail).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [Op1Detail]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TempInt],eax
; LN:2487 ENDIF
_Lbl286:
; LN:2488 OutBuf="mov ecx,"+STR$(TempInt)	
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst224
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2489 GOSUB OutCodeData
call OutCodeData
; LN:2490 INC LabelNum
inc [LabelNum]
; LN:2491 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst225
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst226
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2492 GOSUB OutCodeData
call OutCodeData
; LN:2493 OutBuf="mov al,byte [esi]"
mov edi,[OutBuf]
mov esi,_StrConst227
call __SetStrConst
; LN:2494 GOSUB OutCodeData
call OutCodeData
; LN:2495 OutBuf="mov byte [edi],al"
mov edi,[OutBuf]
mov esi,_StrConst228
call __SetStrConst
; LN:2496 GOSUB OutCodeData
call OutCodeData
; LN:2497 OutBuf="inc esi"
mov edi,[OutBuf]
mov esi,_StrConst229
call __SetStrConst
; LN:2498 GOSUB OutCodeData
call OutCodeData
; LN:2499 OutBuf="inc edi"
mov edi,[OutBuf]
mov esi,_StrConst230
call __SetStrConst
; LN:2500 GOSUB OutCodeData
call OutCodeData
; LN:2501 OutBuf="dec ecx"
mov edi,[OutBuf]
mov esi,_StrConst231
call __SetStrConst
; LN:2502 GOSUB OutCodeData
call OutCodeData
; LN:2503 OutBuf="jne "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst232
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst233
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2504 GOSUB OutCodeData
call OutCodeData
; LN:2505 RETURN
ret
; LN:2506 ENDIF
_Lbl280:
; LN:2507 SELECT CASE Op1Class
xor eax,eax
mov al, byte [Op1Class]
mov [_SwitchInt],eax
; LN:2508 CASE BOOLClass
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl288
; LN:2509 D0Loaded=0
mov byte [D0Loaded],0
; LN:2510 GOSUB LoadReg
call LoadReg
; LN:2511 ErrMain
; LN:2511 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2512 GOSUB StoreD0
call StoreD0
; LN:2513 RETURN
ret
; LN:2514 CASE OBJClass
jmp _Lbl287
_Lbl288:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl290
; LN:2515 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:2516 RETURN
ret
; LN:2517 CASE FRMClass
jmp _Lbl287
_Lbl290:
mov eax,8
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl291
; LN:2518 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:2519 RETURN
ret
; LN:2520 CASE ELSE 
jmp _Lbl287
_Lbl291:
; LN:2521 PRINT  "Internal Error"
mov esi,_StrConst234
mov [_TmpVec1],esi
mov [_TmpVec1+4],15
mov [_TmpVec1+8],0
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
jne _OELbl34
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl34:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:2522 END
xor eax,eax
invoke ExitProcess, eax
; LN:2523 END SELECT
jmp _Lbl287
_Lbl292:
_Lbl287:
StoreInt:
; LN:2526 IF Op1Type=BOOLVAR OR Op1Type=BYTEVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Type]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl293
; LN:2527 OutBuf="mov ["+Op1Name+"],al"
mov esi,_StrConst235
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst236
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2528 ENDIF
_Lbl293:
; LN:2529 IF Op1Type=WORDVAR THEN
cmp [Op1Type],3
jne _Lbl294
; LN:2530 OutBuf="mov ["+Op1Name+"],ax"
mov esi,_StrConst237
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst238
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2531 ENDIF
_Lbl294:
; LN:2532 IF Op1Type=LONGVAR THEN
cmp [Op1Type],4
jne _Lbl295
; LN:2533 OutBuf="mov ["+Op1Name+"],eax"
mov esi,_StrConst239
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst240
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2534 ENDIF
_Lbl295:
; LN:2535 GOSUB OutCodeData
call OutCodeData
; LN:2536 RETURN
ret
ForX:
; LN:2539 GOSUB TokenSym
call TokenSym
; LN:2540 ErrMain
; LN:2540 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2541 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl297
; LN:2542 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:2543 GOTO MainLoop
jmp MainLoop
; LN:2544 ENDIF
_Lbl297:
; LN:2545 ForDataType=SymTable(SymNdx).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [ForDataType],ax
; LN:2546 GOSUB IncConStk
call IncConStk
; LN:2547 ErrMain
; LN:2547 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2548 ConStk(ConStkPtr).LoopName=SymTemp.SymName
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:2549 GOSUB GetSymTemp
call GetSymTemp
; LN:2550 GOSUB ClassOp1
call ClassOp1
; LN:2551 IF OpClass<>INTClass OR DMVector<>0 OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl299
; LN:2552 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2553 GOTO MainLoop
jmp MainLoop
; LN:2554 ENDIF
_Lbl299:
; LN:2555 GOSUB GetLopVec
call GetLopVec
; LN:2556 ErrMain
; LN:2556 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2557 ConStk(ConStkPtr).LoopVec=LopVarNdx
mov esi,ConStk-(1*73)+41
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LopVarNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2558 ConStk(ConStkPtr).ConType=5
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2559 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2560 EqualMain
; LN:2560 GOSUB GetEqual
call GetEqual
; LN:2560 ErrMain
; LN:2560 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2561 GOSUB Expr
call Expr
; LN:2562 ErrMain
; LN:2562 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2563 IF TSymName="~" THEN
mov esi,_StrConst241
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl303
; LN:2564 TSymName="eax"
mov edi,[TSymName]
mov esi,_StrConst242
call __SetStrConst
; LN:2565 ENDIF
_Lbl303:
; LN:2566 ' set initial value into loop var
; LN:2567 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl304
; LN:2568 OutBuf="mov ["+ConStk(ConStkPtr).LoopName+"],"+TSymName
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst243
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst244
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2569 ELSE
jmp _Lbl305
_Lbl304:
; LN:2570 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl306
; LN:2571 OutBuf="mov edi,["+TSymName+"]"
mov esi,_StrConst245
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst246
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2572 GOSUB OutCodeData
call OutCodeData
; LN:2573 OutBuf="mov eax,[edi]"
mov edi,[OutBuf]
mov esi,_StrConst247
call __SetStrConst
; LN:2574 GOSUB OutCodeData
call OutCodeData
; LN:2575 ELSE
jmp _Lbl307
_Lbl306:
; LN:2576 OutBuf="mov eax,["+TSymName+"]"
mov esi,_StrConst248
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst249
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2577 GOSUB OutCodeData
call OutCodeData
; LN:2578 ENDIF
_Lbl307:
; LN:2579 OutBuf="mov ["+ConStk(ConStkPtr).LoopName+"],eax"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst250
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst251
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2580 ENDIF
_Lbl305:
; LN:2581 GOSUB OutCodeData
call OutCodeData
; LN:2582 GOSUB NexToken
call NexToken
; LN:2583 IF TokenBuf<>"to" THEN
mov esi,_StrConst252
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl308
; LN:2584 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2585 GOTO MainLoop
jmp MainLoop
; LN:2586 ENDIF
_Lbl308:
; LN:2587 GOSUB Expr
call Expr
; LN:2588 ErrMain
; LN:2588 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2589 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl310
; LN:2590 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2591 GOTO MainLoop
jmp MainLoop
; LN:2592 ENDIF
_Lbl310:
; LN:2593 IF TSymName<>"~" AND DMConst<>0 THEN
mov esi,_StrConst253
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMConst]
mov edx,0
cmp eax,edx
setne bl
and bh,bl
je _Lbl311
; LN:2594 ConStk(ConStkPtr).ImmTo=$ff
mov esi,ConStk-(1*73)+50
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2595 ConStk(ConStkPtr).ImmToVal=TSymName
mov esi,ConStk-(1*73)+51
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TSymName
call __MovStr
; LN:2596 ELSE
jmp _Lbl312
_Lbl311:
; LN:2597 ConStk(ConStkPtr).ImmTo=0
mov esi,ConStk-(1*73)+50
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2598 ENDIF
_Lbl312:
; LN:2599 IF ConStk(ConStkPtr).ImmTo=0 THEN
mov esi,ConStk-(1*73)+50
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl313
; LN:2600 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl314
; LN:2601 OutBuf="mov edi,["+TSymName+"]"
mov esi,_StrConst254
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst255
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2602 GOSUB OutCodeData
call OutCodeData
; LN:2603 OutBuf="mov eax,[edi]"
mov edi,[OutBuf]
mov esi,_StrConst256
call __SetStrConst
; LN:2604 GOSUB OutCodeData
call OutCodeData
; LN:2605 ELSE
jmp _Lbl315
_Lbl314:
; LN:2606 IF TSymName<>"~" THEN
mov esi,_StrConst257
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl316
; LN:2607 OutBuf="mov eax,["+TempStr+"]"
mov esi,_StrConst258
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst259
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2608 GOSUB OutCodeData
call OutCodeData
; LN:2609 ENDIF
_Lbl316:
; LN:2610 ENDIF
_Lbl315:
; LN:2611 OutBuf="mov [_LopVec"+STR$(LopVarNdx)+"],eax"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst260
mov [_TmpVec2],esi
mov [_TmpVec2+4],13
mov [_TmpVec2+8],0
mov esi,_StrConst261
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2612 GOSUB OutCodeData
call OutCodeData
; LN:2613 ENDIF
_Lbl313:
; LN:2614 GOSUB NexToken
call NexToken
; LN:2615 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl317
; LN:2616 ConStk(ConStkPtr).NoStep=$ff
mov esi,ConStk-(1*73)+49
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2617 ELSE
jmp _Lbl318
_Lbl317:
; LN:2618 IF TokenBuf<>"step" THEN
mov esi,_StrConst262
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl319
; LN:2619 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2620 GOTO MainLoop
jmp MainLoop
; LN:2621 ENDIF
_Lbl319:
; LN:2622 ConStk(ConStkPtr).NoStep=0
mov esi,ConStk-(1*73)+49
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2623 GOSUB Expr
call Expr
; LN:2624 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl320
; LN:2625 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2626 GOTO MainLoop
jmp MainLoop
; LN:2627 ENDIF
_Lbl320:
; LN:2628 ErrMain
; LN:2628 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2629 ConStk(ConStkPtr).NegImmStep=0
mov esi,ConStk-(1*73)+72
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2630 IF TSymName<>"~" AND DMConst<>0 THEN
mov esi,_StrConst263
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMConst]
mov edx,0
cmp eax,edx
setne bl
and bh,bl
je _Lbl322
; LN:2631 ConStk(ConStkPtr).ImmStep=$ff
mov esi,ConStk-(1*73)+61
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2632 ConStk(ConStkPtr).ImmStepVal=TSymName
mov esi,ConStk-(1*73)+62
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TSymName
call __MovStr
; LN:2633 IF LEN(TSymName)=10 THEN'???
mov esi,TSymName
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
je _Lbl323
; LN:2634 IF Mid$(TSymName,3,1)>"7" THEN'???
mov edi,[TSymName]
mov [_TmpVec1],edi
mov edi,[TSymName+4]
mov [_TmpVec1+4],edi
mov edi,[TSymName+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,3
mov edx,1
call __MidStr
mov esi,_StrConst264
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setg bl
or bh,bl
je _Lbl324
; LN:2635 ConStk(ConStkPtr).NegImmStep=$ff
mov esi,ConStk-(1*73)+72
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2636 ENDIF
_Lbl324:
; LN:2637 ENDIF
_Lbl323:
; LN:2638 ELSE
jmp _Lbl325
_Lbl322:
; LN:2639 ConStk(ConStkPtr).ImmStep=0
mov esi,ConStk-(1*73)+61
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2640 IF TSymName="~" THEN
mov esi,_StrConst265
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl326
; LN:2641 TSymName="eax"
mov edi,[TSymName]
mov esi,_StrConst266
call __SetStrConst
; LN:2642 ENDIF
_Lbl326:
; LN:2643 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl327
; LN:2644 OutBuf="mov edi,["+TSymName+"]"
mov esi,_StrConst267
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst268
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2645 GOSUB OutCodeData
call OutCodeData
; LN:2646 OutBuf="mov eax,[edi]"
mov edi,[OutBuf]
mov esi,_StrConst269
call __SetStrConst
; LN:2647 GOSUB OutCodeData
call OutCodeData
; LN:2648 ELSE
jmp _Lbl328
_Lbl327:
; LN:2649 OutBuf="mov eax,["+TSymName+"]"
mov esi,_StrConst270
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst271
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2650 GOSUB OutCodeData
call OutCodeData
; LN:2651 ENDIF
_Lbl328:
; LN:2652 OutBuf="mov [_LopVec"+Str$(LopVarNdx)+"+4],eax"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst272
mov [_TmpVec2],esi
mov [_TmpVec2+4],13
mov [_TmpVec2+8],0
mov esi,_StrConst273
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2653 GOSUB OutCodeData
call OutCodeData
; LN:2654 ENDIF
_Lbl325:
; LN:2655 ENDIF
_Lbl318:
; LN:2656 INC LabelNum
inc [LabelNum]
; LN:2657 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst274
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst275
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2658 GOSUB OutCodeData
call OutCodeData
; LN:2659 ConStk(ConStkPtr).LoopLabel=LabelNum
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2660 INC LabelNum
inc [LabelNum]
; LN:2661 ConStk(ConStkPtr).ContLabel=LabelNum
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2662 INC LabelNum
inc [LabelNum]
; LN:2663 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2664 ' compare loopvar to "to" value
; LN:2665 IF ConStk(ConStkPtr).ImmStep=$ff AND ConStk(ConStkPtr).NegImmStep=0 OR ConStk(ConStkPtr).NoStep=$ff THEN
mov esi,ConStk-(1*73)+61
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,ConStk-(1*73)+72
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
mov esi,ConStk-(1*73)+49
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
je _Lbl329
; LN:2666 SymTemp.SymName=ConStk(ConStkPtr).LoopName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:2667 IF ForDataType<LONGVAR THEN
cmp [ForDataType],4
jge _Lbl330
; LN:2668 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst276
call __SetStrConst
; LN:2669 GOSUB OutCodeData
call OutCodeData
; LN:2670 ENDIF
_Lbl330:
; LN:2671 OutBuf="mov eax,["+ConStk(ConStkPtr).LoopName+"]"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst277
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_StrConst278
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2672 GOSUB OutCodeData	
call OutCodeData
; LN:2673 IF ConStk(ConStkPtr).ImmTo=$ff THEN
mov esi,ConStk-(1*73)+50
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
je _Lbl331
; LN:2674 OutBuf="cmp eax,"+ConStk(ConStkPtr).ImmToVal
mov esi,ConStk-(1*73)+51
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov esi,_StrConst279
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2675 GOSUB OutCodeData
call OutCodeData
; LN:2676 ELSE
jmp _Lbl332
_Lbl331:
; LN:2677 OutBuf="cmp eax,[_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"]"
mov esi,ConStk-(1*73)+41
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst280
mov [_TmpVec3],esi
mov [_TmpVec3+4],17
mov [_TmpVec3+8],0
mov esi,_StrConst281
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:2678 GOSUB OutCodeData
call OutCodeData
; LN:2679 ENDIF
_Lbl332:
; LN:2680 OutBuf="jg "+"_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst282
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_StrConst283
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:2681 GOSUB OutCodeData
call OutCodeData
; LN:2682 ENDIF
_Lbl329:
; LN:2683 IF ConStk(ConStkPtr).ImmStep=$ff AND ConStk(ConStkPtr).NegImmStep=$ff THEN
mov esi,ConStk-(1*73)+61
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,ConStk-(1*73)+72
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
and bh,bl
je _Lbl333
; LN:2684 IF ConStk(ConStkPtr).ImmTo=$ff THEN
mov esi,ConStk-(1*73)+50
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
je _Lbl334
; LN:2685 OutBuf=";if ("+ConStk(ConStkPtr).LoopName+"<"+ConStk(ConStkPtr).ImmToVal+") goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+51
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec3]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst284
mov [_TmpVec5],esi
mov [_TmpVec5+4],6
mov [_TmpVec5+8],0
mov esi,_StrConst285
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst286
mov [_TmpVec7],esi
mov [_TmpVec7+4],12
mov [_TmpVec7+8],0
mov esi,_StrConst287
mov [_TmpVec8],esi
mov [_TmpVec8+4],2
mov [_TmpVec8+8],0
mov esi,_TmpVec1
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec5
call __MovStr
; LN:2686 GOSUB OutCodeData
call OutCodeData
; LN:2687 ELSE
jmp _Lbl335
_Lbl334:
; LN:2688 OutBuf=";if ("+ConStk(ConStkPtr).LoopName+"<_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Limit) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+41
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec4],esi
mov edi,[_TmpVec4]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec5],esi
mov [_TmpVec5+4],32
mov [_TmpVec5+8],0
mov edi,_TmpVec5
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst288
mov [_TmpVec6],esi
mov [_TmpVec6+4],6
mov [_TmpVec6+8],0
mov esi,_StrConst289
mov [_TmpVec7],esi
mov [_TmpVec7+4],9
mov [_TmpVec7+8],0
mov esi,_StrConst290
mov [_TmpVec8],esi
mov [_TmpVec8+4],19
mov [_TmpVec8+8],0
mov esi,_StrConst291
mov [_TmpVec9],esi
mov [_TmpVec9+4],2
mov [_TmpVec9+8],0
mov esi,_TmpVec1
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec8+8],esi
mov esi,_TmpVec9
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec6
call __MovStr
; LN:2689 GOSUB OutCodeData
call OutCodeData
; LN:2690 ENDIF
_Lbl335:
; LN:2691 ENDIF
_Lbl333:
; LN:2692 IF ConStk(ConStkPtr).ImmStep=0 AND ConStk(ConStkPtr).NoStep=0 THEN
mov esi,ConStk-(1*73)+61
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,ConStk-(1*73)+49
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl336
; LN:2693 IF ConStk(ConStkPtr).ImmTo=0 THEN
mov esi,ConStk-(1*73)+50
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl337
; LN:2694 OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+ConStk(ConStkPtr).LoopName+">_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Limit)) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+41
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec3]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec5],esi
mov edi,[_TmpVec5]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp3
mov [_TmpVec6],esi
mov [_TmpVec6+4],32
mov [_TmpVec6+8],0
mov edi,_TmpVec6
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst292
mov [_TmpVec7],esi
mov [_TmpVec7+4],14
mov [_TmpVec7+8],0
mov esi,_StrConst293
mov [_TmpVec8],esi
mov [_TmpVec8+4],16
mov [_TmpVec8+8],0
mov esi,_StrConst294
mov [_TmpVec9],esi
mov [_TmpVec9+4],9
mov [_TmpVec9+8],0
mov esi,_StrConst295
mov [_TmpVec10],esi
mov [_TmpVec10+4],20
mov [_TmpVec10+8],0
mov esi,_StrConst296
mov [_TmpVec11],esi
mov [_TmpVec11+4],2
mov [_TmpVec11+8],0
mov esi,_TmpVec1
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec8+8],esi
mov esi,_TmpVec9
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec9+8],esi
mov esi,_TmpVec10
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec10+8],esi
mov esi,_TmpVec11
mov [_TmpVec6+8],esi
mov edi,OutBuf
mov esi,_TmpVec7
call __MovStr
; LN:2695 GOSUB OutCodeData
call OutCodeData
; LN:2696 OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+ConStk(ConStkPtr).LoopName+"<_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Limit)) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+41
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec3]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec5],esi
mov edi,[_TmpVec5]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp3
mov [_TmpVec6],esi
mov [_TmpVec6+4],32
mov [_TmpVec6+8],0
mov edi,_TmpVec6
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst297
mov [_TmpVec7],esi
mov [_TmpVec7+4],14
mov [_TmpVec7+8],0
mov esi,_StrConst298
mov [_TmpVec8],esi
mov [_TmpVec8+4],15
mov [_TmpVec8+8],0
mov esi,_StrConst299
mov [_TmpVec9],esi
mov [_TmpVec9+4],9
mov [_TmpVec9+8],0
mov esi,_StrConst300
mov [_TmpVec10],esi
mov [_TmpVec10+4],20
mov [_TmpVec10+8],0
mov esi,_StrConst301
mov [_TmpVec11],esi
mov [_TmpVec11+4],2
mov [_TmpVec11+8],0
mov esi,_TmpVec1
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec8+8],esi
mov esi,_TmpVec9
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec9+8],esi
mov esi,_TmpVec10
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec10+8],esi
mov esi,_TmpVec11
mov [_TmpVec6+8],esi
mov edi,OutBuf
mov esi,_TmpVec7
call __MovStr
; LN:2697 GOSUB OutCodeData
call OutCodeData
; LN:2698 ELSE
jmp _Lbl338
_Lbl337:
; LN:2699 OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step>=0) && ("+ConStk(ConStkPtr).LoopName+">"+ConStk(ConStkPtr).ImmToVal+")) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+51
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov [_TmpVec3+4],10
mov [_TmpVec3+8],0
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec4],esi
mov edi,[_TmpVec4]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec5],esi
mov [_TmpVec5+4],32
mov [_TmpVec5+8],0
mov edi,_TmpVec5
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst302
mov [_TmpVec6],esi
mov [_TmpVec6+4],14
mov [_TmpVec6+8],0
mov esi,_StrConst303
mov [_TmpVec7],esi
mov [_TmpVec7+4],16
mov [_TmpVec7+8],0
mov esi,_StrConst304
mov [_TmpVec8],esi
mov [_TmpVec8+4],2
mov [_TmpVec8+8],0
mov esi,_StrConst305
mov [_TmpVec9],esi
mov [_TmpVec9+4],13
mov [_TmpVec9+8],0
mov esi,_StrConst306
mov [_TmpVec10],esi
mov [_TmpVec10+4],2
mov [_TmpVec10+8],0
mov esi,_TmpVec1
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec8+8],esi
mov esi,_TmpVec9
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec9+8],esi
mov esi,_TmpVec10
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec6
call __MovStr
; LN:2700 GOSUB OutCodeData
call OutCodeData
; LN:2701 OutBuf=";if ((_LopVec"+STR$(LopVarNdx)+"._Step<0) && ("+ConStk(ConStkPtr).LoopName+"<"+ConStk(ConStkPtr).ImmToVal+")) goto _Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+";"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+51
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov [_TmpVec3+4],10
mov [_TmpVec3+8],0
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec4],esi
mov edi,[_TmpVec4]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec5],esi
mov [_TmpVec5+4],32
mov [_TmpVec5+8],0
mov edi,_TmpVec5
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst307
mov [_TmpVec6],esi
mov [_TmpVec6+4],14
mov [_TmpVec6+8],0
mov esi,_StrConst308
mov [_TmpVec7],esi
mov [_TmpVec7+4],15
mov [_TmpVec7+8],0
mov esi,_StrConst309
mov [_TmpVec8],esi
mov [_TmpVec8+4],2
mov [_TmpVec8+8],0
mov esi,_StrConst310
mov [_TmpVec9],esi
mov [_TmpVec9+4],13
mov [_TmpVec9+8],0
mov esi,_StrConst311
mov [_TmpVec10],esi
mov [_TmpVec10+4],2
mov [_TmpVec10+8],0
mov esi,_TmpVec1
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec8+8],esi
mov esi,_TmpVec9
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec9+8],esi
mov esi,_TmpVec10
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec6
call __MovStr
; LN:2702 GOSUB OutCodeData
call OutCodeData
; LN:2703 ENDIF
_Lbl338:
; LN:2704 ENDIF
_Lbl336:
; LN:2705 GOTO MainLoop
jmp MainLoop
IfX:
; LN:2708 GOSUB CmpOps 
call CmpOps
; LN:2709 ErrMain
; LN:2709 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2710 INC LabelNum
inc [LabelNum]
; LN:2711 IF TokenBuf<>"then" THEN
mov esi,_StrConst312
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl340
; LN:2712 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2713 GOTO MainLoop
jmp MainLoop
; LN:2714 ENDIF
_Lbl340:
; LN:2715 IF SimpleCmp<>0 THEN
cmp [SimpleCmp],0
je _Lbl341
; LN:2716 IF Op1Type=BYTEVAR AND Op2Detail>255 THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [Op2Detail]
mov edx,255
cmp eax,edx
setg bl
and bh,bl
je _Lbl342
; LN:2717 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2718 GOTO MainLoop
jmp MainLoop
; LN:2719 ENDIF
_Lbl342:
; LN:2720 IF Op1Type=WORDVAR AND Op2Detail>65535 THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [Op2Detail]
mov edx,65535
cmp eax,edx
setg bl
and bh,bl
je _Lbl343
; LN:2721 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2722 GOTO MainLoop
jmp MainLoop
; LN:2723 ENDIF
_Lbl343:
; LN:2724 IF Op1Type=LONGVAR AND Op2Detail>$7fffffff THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [Op2Detail]
mov edx,2147483647
cmp eax,edx
setg bl
and bh,bl
je _Lbl344
; LN:2725 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2726 GOTO MainLoop
jmp MainLoop
; LN:2727 ENDIF
_Lbl344:
; LN:2728 OutBuf="cmp ["+Op1Name+"],"+STR$(Op2Detail)
mov eax, dword [Op2Detail]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst313
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov edi,[Op1Name]
mov [_TmpVec3],edi
mov edi,[Op1Name+4]
mov [_TmpVec3+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst314
mov [_TmpVec4],esi
mov [_TmpVec4+4],3
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2729 GOSUB OutCodeData
call OutCodeData
; LN:2730 ENDIF
_Lbl341:
; LN:2731 GOSUB NexToken
call NexToken
; LN:2732 IF TokenLen=0 THEN StructIF
cmp [TokenLen],0
je StructIF
; LN:2733 GOSUB UnDoToken
call UnDoToken
; LN:2734 GOSUB ChkLabel
call ChkLabel
; LN:2735 ErrMain
; LN:2735 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2736 IF SymTable(SymNdx).DataType<>LABELVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,7
cmp eax,edx
setne bl
or bh,bl
je _Lbl347
; LN:2737 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2738 GOTO MainLoop
jmp MainLoop
; LN:2739 ENDIF
_Lbl347:
; LN:2740 IF SimpleCmp=0 THEN
cmp [SimpleCmp],0
jne _Lbl348
; LN:2741 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst315
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst316
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2742 GOSUB OutCodeData
call OutCodeData
; LN:2743 OutBuf="jmp "+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst317
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2744 GOSUB OutCodeData
call OutCodeData
; LN:2745 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst318
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst319
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2746 ELSE
jmp _Lbl349
_Lbl348:
; LN:2747 OutBuf=SimpleOp+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,[SimpleOp]
mov [_TmpVec2],edi
mov edi,[SimpleOp+4]
mov [_TmpVec2+4],edi
mov edi,[SimpleOp+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2748 ENDIF
_Lbl349:
; LN:2749 GOSUB OutCodeData
call OutCodeData
; LN:2750 GOTO MainLoop
jmp MainLoop
StructIF:
; LN:2752 GOSUB IncConStk
call IncConStk
; LN:2753 ErrMain
; LN:2753 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2754 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2755 ConStk(ConStkPtr).ConType=0
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:2756 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:2757 IF SimpleCmp=0 THEN
cmp [SimpleCmp],0
jne _Lbl351
; LN:2758 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst320
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst321
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2759 ELSE
jmp _Lbl352
_Lbl351:
; LN:2760 OutBuf=SimpleStructOp+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[SimpleStructOp]
mov [_TmpVec2],edi
mov edi,[SimpleStructOp+4]
mov [_TmpVec2+4],edi
mov edi,[SimpleStructOp+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst322
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2761 ENDIF
_Lbl352:
; LN:2762 GOSUB OutCodeData 
call OutCodeData
; LN:2763 GOTO MainLoop
jmp MainLoop
GotoX:
; LN:2766 ToSub="jmp "
mov esi,_StrConst323
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,ToSub
mov esi,_TmpVec1
call __MovStr
GotoX1:
; LN:2768 LNFlag=$ff
mov byte [LNFlag],255
; LN:2769 GOSUB NexToken
call NexToken
; LN:2770 IF TokenBuf="[" THEN
mov esi,_StrConst324
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl353
; LN:2771 FOR I=1 TO LEN(SrcLine)
mov [I],1
mov esi,SrcLine
call __StrLen
mov [_Tmp1],eax
mov eax,[_Tmp1]
mov [_LopVec4],eax
_Lbl354:
mov eax,[I]
cmp eax,[_LopVec4]
jg _Lbl356
; LN:2772 IF MID$(SrcLine,I,1)="]" THEN BracketFound
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [I]
mov edx,1
call __MidStr
mov esi,_StrConst325
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl357
jmp BracketFound
_Lbl357:
; LN:2773 NEXT I
_Lbl355:
inc [I]
jmp _Lbl354
_Lbl356:
; LN:2774 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2775 GOTO MainLoop
jmp MainLoop
BracketFound:
; LN:2777 MID$(SrcLine,I,1)=CHR$(0)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [I]
mov edx,1
call __MidStr
mov eax,0
mov esi,_ChrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],1
mov [_TmpVec2+8],0
mov [_ChrTmp1],al
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:2778 GOSUB Expr
call Expr
; LN:2779 IF TDataType<>LABELPTR THEN
cmp [TDataType],16
je _Lbl358
; LN:2780 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2781 GOTO MainLoop
jmp MainLoop
; LN:2782 ENDIF
_Lbl358:
; LN:2783 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl359
; LN:2784 OutBuf="mov esi,["+TSymName+"]"
mov esi,_StrConst326
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst327
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2785 GOSUB OutCode
call OutCode
; LN:2786 OutBuf=ToSub+"dword [esi]"		
mov edi,[ToSub]
mov [_TmpVec1],edi
mov edi,[ToSub+4]
mov [_TmpVec1+4],edi
mov edi,[ToSub+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst328
mov [_TmpVec2],esi
mov [_TmpVec2+4],12
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2787 ELSE
jmp _Lbl360
_Lbl359:
; LN:2788 OutBuf=ToSub+"["+TSymName+"]"
mov edi,[ToSub]
mov [_TmpVec1],edi
mov edi,[ToSub+4]
mov [_TmpVec1+4],edi
mov edi,[ToSub+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst329
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,[TSymName]
mov [_TmpVec3],edi
mov edi,[TSymName+4]
mov [_TmpVec3+4],edi
mov edi,[TSymName+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst330
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2789 ENDIF
_Lbl360:
; LN:2790 GOSUB OutCode
call OutCode
; LN:2791 GOTO MainLoop
jmp MainLoop
; LN:2792 ENDIF
_Lbl353:
; LN:2793 GOSUB UnDoToken
call UnDoToken
; LN:2794 GOSUB ChkLabel
call ChkLabel
; LN:2795 ErrMain
; LN:2795 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2796 IF SymTable(SymNdx).DataType<>LABELVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,7
cmp eax,edx
setne bl
or bh,bl
je _Lbl362
; LN:2797 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2798 GOTO MainLoop
jmp MainLoop
; LN:2799 ENDIF
_Lbl362:
; LN:2800 OutBuf=ToSub+SymbolSaf
mov edi,[ToSub]
mov [_TmpVec1],edi
mov edi,[ToSub+4]
mov [_TmpVec1+4],edi
mov edi,[ToSub+8]
mov [_TmpVec1+8],edi
mov edi,[SymbolSaf]
mov [_TmpVec2],edi
mov edi,[SymbolSaf+4]
mov [_TmpVec2+4],edi
mov edi,[SymbolSaf+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2801 GOSUB OutCodeData
call OutCodeData
; LN:2802 GOTO MainLoop
jmp MainLoop
GosubX:
; LN:2805 ToSub="call "
mov esi,_StrConst331
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,ToSub
mov esi,_TmpVec1
call __MovStr
; LN:2806 GOTO GotoX1
jmp GotoX1
OnX:
; LN:2809 LNFlag=$ff
mov byte [LNFlag],255
; LN:2810 NeedComma=$00
mov byte [NeedComma],0
; LN:2811 JmpArgs=0
mov dword [JmpArgs],0
; LN:2812 GOSUB NexToken
call NexToken
; LN:2813 IF TokenBuf="error" THEN ON_ERROR
mov esi,_StrConst332
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl363
jmp ON_ERROR
_Lbl363:
; LN:2814 GOSUB UnDoToken
call UnDoToken
; LN:2815 INC LabelNum
inc [LabelNum]
; LN:2816 INC TableNum
inc [TableNum]
; LN:2817 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst333
call __SetStrConst
; LN:2818 GOSUB OutInitData
call OutInitData
; LN:2819 OutBuf="_Table"+STR$(TableNum)+":"
mov eax, dword [TableNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst334
mov [_TmpVec2],esi
mov [_TmpVec2+4],7
mov [_TmpVec2+8],0
mov esi,_StrConst335
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2820 GOSUB OutInitData
call OutInitData
; LN:2821 GOSUB GetIntOp' get test integer
call GetIntOp
; LN:2822 ErrMain
; LN:2822 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2823 GOSUB NexToken
call NexToken
; LN:2824 IF TokenBuf="goto" OR TokenBuf="gosub" THEN
mov esi,_StrConst336
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst337
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl365
; LN:2825 IF TokenBuf="goto" THEN
mov esi,_StrConst338
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl366
; LN:2826 ToSubFlag=0
mov byte [ToSubFlag],0
; LN:2827 ELSE
jmp _Lbl367
_Lbl366:
; LN:2828 ToSubFlag=$ff
mov byte [ToSubFlag],255
; LN:2829 ENDIF
_Lbl367:
; LN:2830 ELSE
jmp _Lbl368
_Lbl365:
; LN:2831 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2832 GOTO MainLoop
jmp MainLoop
; LN:2833 ENDIF
_Lbl368:
ChkArgs:
; LN:2835 GOSUB NexToken
call NexToken
; LN:2836 IF TokenLen=0 THEN MakSwitch
cmp [TokenLen],0
je MakSwitch
; LN:2837 IF TokenBuf="," AND NeedComma=$ff THEN
mov esi,_StrConst339
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
xor eax,eax
mov al, byte [NeedComma]
mov edx,255
cmp eax,edx
sete bl
and bh,bl
je _Lbl370
; LN:2838 NeedComma=0
mov byte [NeedComma],0
; LN:2839 GOTO ChkArgs
jmp ChkArgs
; LN:2840 ENDIF
_Lbl370:
; LN:2841 IF TokenBuf="," AND NeedComma=0 THEN
mov esi,_StrConst340
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
xor eax,eax
mov al, byte [NeedComma]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl371
; LN:2842 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2843 GOTO MainLoop
jmp MainLoop
; LN:2844 ENDIF
_Lbl371:
; LN:2845 IF TokenBuf<>"," AND NeedComma=$ff THEN
mov esi,_StrConst341
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
xor eax,eax
mov al, byte [NeedComma]
mov edx,255
cmp eax,edx
sete bl
and bh,bl
je _Lbl372
; LN:2846 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2847 GOTO MainLoop
jmp MainLoop
; LN:2848 ENDIF
_Lbl372:
; LN:2849 GOSUB UnDoToken
call UnDoToken
; LN:2850 GOSUB ChkLabel
call ChkLabel
; LN:2851 ErrMain
; LN:2851 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2852 TempInt=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TempInt],eax
; LN:2853 TDataType=SymTable(SymNdx).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:2854 IF TDataType<>LABELVAR THEN
cmp [TDataType],7
je _Lbl374
; LN:2855 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2856 GOTO MainLoop
jmp MainLoop
; LN:2857 ENDIF
_Lbl374:
; LN:2858 OutBuf="dd "+SymTable(SymNdx).SymName
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst342
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2859 GOSUB OutInitData
call OutInitData
; LN:2860 INC JmpArgs
inc [JmpArgs]
; LN:2861 NeedComma=$ff
mov byte [NeedComma],255
; LN:2862 GOTO ChkArgs
jmp ChkArgs
MakSwitch:
; LN:2864 IF JmpArgs<1 THEN
cmp [JmpArgs],1
jge _Lbl375
; LN:2865 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2866 GOTO MainLoop
jmp MainLoop
; LN:2867 ENDIF
_Lbl375:
; LN:2868 Ctr1=0
mov dword [Ctr1],0
; LN:2869 OutBuf="cmp eax,1"
mov edi,[OutBuf]
mov esi,_StrConst343
call __SetStrConst
; LN:2870 GOSUB OutCodeData
call OutCodeData
; LN:2871 OutBuf="jl "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst344
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst345
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2872 GOSUB OutCodeData
call OutCodeData
; LN:2873 OutBuf="cmp eax,"+STR$(JmpArgs)
mov eax, dword [JmpArgs]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst346
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2874 GOSUB OutCodeData
call OutCodeData
; LN:2875 OutBuf="jg "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst347
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst348
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2876 GOSUB OutCodeData
call OutCodeData
; LN:2877 OutBuf="dec eax"
mov edi,[OutBuf]
mov esi,_StrConst349
call __SetStrConst
; LN:2878 GOSUB OutCodeData
call OutCodeData
; LN:2879 OutBuf="shl eax,2"
mov edi,[OutBuf]
mov esi,_StrConst350
call __SetStrConst
; LN:2880 GOSUB OutCodeData
call OutCodeData
; LN:2881 OutBuf="add eax,_Table"+STR$(TableNum)
mov eax, dword [TableNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst351
mov [_TmpVec2],esi
mov [_TmpVec2+4],15
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2882 GOSUB OutCodeData
call OutCodeData
; LN:2883 OutBuf="mov eax,[eax]"
mov edi,[OutBuf]
mov esi,_StrConst352
call __SetStrConst
; LN:2884 GOSUB OutCodeData
call OutCodeData
; LN:2885 IF ToSubFlag=0 THEN
cmp [ToSubFlag],0
jne _Lbl376
; LN:2886 OutBuf="jmp dword eax"
mov edi,[OutBuf]
mov esi,_StrConst353
call __SetStrConst
; LN:2887 ELSE
jmp _Lbl377
_Lbl376:
; LN:2888 OutBuf="call dword eax"
mov edi,[OutBuf]
mov esi,_StrConst354
call __SetStrConst
; LN:2889 ENDIF
_Lbl377:
; LN:2890 GOSUB OutCodeData
call OutCodeData
; LN:2891 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst355
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst356
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2892 GOSUB OutCodeData
call OutCodeData
; LN:2893 GOTO MainLoop
jmp MainLoop
ON_ERROR:
; LN:2896 GOSUB NexToken
call NexToken
; LN:2897 IF TokenLen=0 THEN' Turn off ON ERROR
cmp [TokenLen],0
jne _Lbl378
; LN:2898 OutBuf="mov [_ErrVec],_ErrExit"
mov edi,[OutBuf]
mov esi,_StrConst357
call __SetStrConst
; LN:2899 GOSUB OutCode
call OutCode
; LN:2900 GOTO MainLoop
jmp MainLoop
; LN:2901 ENDIF
_Lbl378:
; LN:2902 IF TokenBuf<>"goto" THEN
mov esi,_StrConst358
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl379
; LN:2903 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:2904 GOTO MainLoop
jmp MainLoop
; LN:2905 ENDIF
_Lbl379:
; LN:2906 GOSUB ChkLabel
call ChkLabel
; LN:2907 ErrMain
; LN:2907 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2908 IF SymTable(SymNdx).DataType<>LABELVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,7
cmp eax,edx
setne bl
or bh,bl
je _Lbl381
; LN:2909 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:2910 GOTO MainLoop
jmp MainLoop
; LN:2911 ENDIF
_Lbl381:
; LN:2912 OutBuf="mov [_ErrVec],"+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst359
mov [_TmpVec2],esi
mov [_TmpVec2+4],15
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:2913 GOSUB OutCode
call OutCode
; LN:2914 GOTO MainLoop
jmp MainLoop
PrintX:
; LN:2917 UseStrLen=TRUE
mov byte [UseStrLen],1
; LN:2918 GOSUB DevChk
call DevChk
; LN:2919 PrintFlag=$ff
mov byte [PrintFlag],255
; LN:2920 IF DevFlag=$ff THEN
cmp [DevFlag],255
jne _Lbl382
; LN:2921 PrtPthFlg=$ff
mov byte [PrtPthFlg],255
; LN:2922 GOSUB GetPthNum1
call GetPthNum1
; LN:2923 ErrMain
; LN:2923 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2924 PrtPthFlg=0
mov byte [PrtPthFlg],0
; LN:2925 ENDIF
_Lbl382:
; LN:2926 GOSUB NexToken
call NexToken
; LN:2927 IF TokenBuf="using" THEN PrtUsing
mov esi,_StrConst360
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl384
jmp PrtUsing
_Lbl384:
; LN:2928 GOSUB UnDoToken
call UnDoToken
PrintLp:
; LN:2930 GOSUB NexToken
call NexToken
; LN:2931 IF TokenLen=0 THEN PrintEx
cmp [TokenLen],0
je PrintEx
; LN:2932 GOSUB UnDoToken
call UnDoToken
; LN:2933 GOSUB Expr
call Expr
; LN:2934 ErrMain
; LN:2934 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2935 IF TDataType=VOIDX THEN PrtArgSep
cmp [TDataType],13
je PrtArgSep
; LN:2936 IF TabFlag=$ff THEN
cmp [TabFlag],255
jne _Lbl388
; LN:2937 TabFlag=0
mov byte [TabFlag],0
; LN:2938 GOTO PrtArgSep
jmp PrtArgSep
; LN:2939 ENDIF
_Lbl388:
; LN:2940 IF TDataType<>STRINGVAR OR DMAddr<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMAddr]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl389
; LN:2941 GOSUB MakString
call MakString
; LN:2942 ErrMain
; LN:2942 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:2943 ENDIF
_Lbl389:
; LN:2944 GOSUB ClassOp
call ClassOp
; LN:2945 OutBuf="mov esi,"+TSymName
mov esi,_StrConst361
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:2946 GOSUB OutCodeData
call OutCodeData
; LN:2947 OutBuf="mov edi,_PrintBuf"
mov edi,[OutBuf]
mov esi,_StrConst362
call __SetStrConst
; LN:2948 GOSUB OutCodeData
call OutCodeData
; LN:2949 UseMovStr=TRUE
mov byte [UseMovStr],1
; LN:2950 OutBuf="call __MovStr"
mov edi,[OutBuf]
mov esi,_StrConst363
call __SetStrConst
; LN:2951 GOSUB OutCodeData
call OutCodeData
; LN:2952 OutBuf="mov esi,_PrintBuf"
mov edi,[OutBuf]
mov esi,_StrConst364
call __SetStrConst
; LN:2953 GOSUB OutCodeData
call OutCodeData
; LN:2954 OutBuf="call __StrLen"
mov edi,[OutBuf]
mov esi,_StrConst365
call __SetStrConst
; LN:2955 GOSUB OutCodeData
call OutCodeData
; LN:2956 OutBuf="mov edx,eax"
mov edi,[OutBuf]
mov esi,_StrConst366
call __SetStrConst
; LN:2957 GOSUB OutCodeData
call OutCodeData
; LN:2958 OutBuf="add edx,[POS]"
mov edi,[OutBuf]
mov esi,_StrConst367
call __SetStrConst
; LN:2959 GOSUB OutCodeData
call OutCodeData
; LN:2960 OutBuf="mov [POS],edx"
mov edi,[OutBuf]
mov esi,_StrConst368
call __SetStrConst
; LN:2961 GOSUB OutCodeData
call OutCodeData
; LN:2962 OutBuf="invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL"
mov edi,[OutBuf]
mov esi,_StrConst369
call __SetStrConst
; LN:2963 GOSUB OutCodeData
call OutCodeData
; LN:2964 GOSUB CallErrZ
call CallErrZ
PrtArgSep:
; LN:2966 GOSUB NexToken
call NexToken
; LN:2967 IF FileIO<>0 THEN
cmp [FileIO],0
je _Lbl391
; LN:2968 GOSUB OutCRLF
call OutCRLF
; LN:2969 IF TokenBuf="," OR TokenBuf=";" THEN
mov esi,_StrConst370
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst371
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl392
; LN:2970 IF NextByte<>"" THEN PrintLp
xor bh,bh
mov edi,NextByte
mov esi,_NullStr
call __CmpStr
setne bl
or bh,bl
je _Lbl393
jmp PrintLp
_Lbl393:
; LN:2971 ENDIF
_Lbl392:
; LN:2972 GOTO PrintEx
jmp PrintEx
; LN:2973 ENDIF
_Lbl391:
; LN:2974 IF TokenBuf="," THEN
mov esi,_StrConst372
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl394
; LN:2975 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst373
call __SetStrConst
; LN:2976 GOSUB OutCodeData
call OutCodeData
; LN:2977 OutBuf=""'call __PrintTab
mov [OutBuf+12],0
; LN:2978 GOSUB OutCodeData
call OutCodeData
; LN:2979 GOSUB CallErr
call CallErr
; LN:2980 IF NextByte="" THEN PrintEx
xor bh,bh
mov edi,NextByte
mov esi,_NullStr
call __CmpStr
sete bl
or bh,bl
je _Lbl395
jmp PrintEx
_Lbl395:
; LN:2981 GOTO PrintLp
jmp PrintLp
; LN:2982 ENDIF
_Lbl394:
; LN:2983 IF TokenBuf=";" THEN
mov esi,_StrConst374
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl396
; LN:2984 IF NextByte="" THEN PrintEx
xor bh,bh
mov edi,NextByte
mov esi,_NullStr
call __CmpStr
sete bl
or bh,bl
je _Lbl397
jmp PrintEx
_Lbl397:
; LN:2985 GOTO PrintLp
jmp PrintLp
; LN:2986 ENDIF
_Lbl396:
PrintEx:
; LN:2988 IF TokenBuf<>"," AND TokenBuf<>";" THEN
mov esi,_StrConst375
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
mov esi,_StrConst376
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl398
; LN:2989 OutBuf="invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL"
mov edi,[OutBuf]
mov esi,_StrConst377
call __SetStrConst
; LN:2990 GOSUB OutCodeData
call OutCodeData
; LN:2991 OutBuf="mov [POS],0"
mov edi,[OutBuf]
mov esi,_StrConst378
call __SetStrConst
; LN:2992 GOSUB OutCodeData
call OutCodeData
; LN:2993 ENDIF
_Lbl398:
; LN:2994 GOTO MainLoop
jmp MainLoop
PrtUsing:
; LN:2997 GOSUB UnDoToken
call UnDoToken
; LN:2998 GOSUB Expr
call Expr
; LN:2999 GOTO MainLoop
jmp MainLoop
InputX:
; LN:3002 GOSUB DevChk
call DevChk
; LN:3003 IF DevFlag=$ff THEN
cmp [DevFlag],255
jne _Lbl399
; LN:3004 GOSUB GetPthNum1
call GetPthNum1
; LN:3005 ErrMain
; LN:3005 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3006 ENDIF
_Lbl399:
; LN:3007 IF FileIO=0 THEN
cmp [FileIO],0
jne _Lbl401
; LN:3008 GOSUB NexToken
call NexToken
; LN:3009 GOSUB UnDoToken
call UnDoToken
; LN:3010 IF TokenType=TTypQuote THEN
cmp [TokenType],4
jne _Lbl402
; LN:3011 GOSUB Expr
call Expr
; LN:3012 ErrMain
; LN:3012 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3013 OutBuf="invoke WriteConsole,[_OutHandle],["+TSymName+"],["+TSymName+"+4],XferCount,NULL"
mov esi,_StrConst379
mov [_TmpVec1],esi
mov [_TmpVec1+4],35
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst380
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst381
mov [_TmpVec5],esi
mov [_TmpVec5+4],19
mov [_TmpVec5+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3014 GOSUB OutCodeData
call OutCodeData
; LN:3015 CommaMain
; LN:3015 GOSUB GetComma
call GetComma
; LN:3015 ErrMain
; LN:3015 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3016 ELSE
jmp _Lbl405
_Lbl402:
; LN:3017 OutBuf="invoke WriteConsole,[_OutHandle],[_Prompt],1,XferCount,NULL"
mov edi,[OutBuf]
mov esi,_StrConst382
call __SetStrConst
; LN:3018 GOSUB OutCodeData
call OutCodeData
; LN:3019 ENDIF
_Lbl405:
; LN:3020 GOSUB CallErrZ
call CallErrZ
; LN:3021 ENDIF
_Lbl401:
; LN:3022 Target=$ff
mov byte [Target],255
; LN:3023 LOOP
_Lbl406:
; LN:3024 GOSUB Expr
call Expr
; LN:3025 ErrMain
; LN:3025 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3026 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl409
; LN:3027 GOSUB Vectorize
call Vectorize
; LN:3028 ErrMain
; LN:3028 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3029 GOSUB ClassOp
call ClassOp
; LN:3030 ENDIF
_Lbl409:
; LN:3031 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl411
; LN:3032 GOSUB SetTmpVec
call SetTmpVec
; LN:3033 ErrMain
; LN:3033 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3034 ENDIF
_Lbl411:
; LN:3035 OutBuf="mov esi,"+TSymName
mov esi,_StrConst383
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3036 GOSUB OutCodeData
call OutCodeData
; LN:3037 OutBuf="mov [_ArgSafe0],esi"
mov edi,[OutBuf]
mov esi,_StrConst384
call __SetStrConst
; LN:3038 GOSUB OutCodeData
call OutCodeData
; LN:3039 OutBuf="mov [_ArgSafe1],"+STR$(TDataType)
xor eax,eax
mov ax, word [TDataType]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst385
mov [_TmpVec2],esi
mov [_TmpVec2+4],17
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3040 GOSUB OutCodeData
call OutCodeData
; LN:3041 UseInpData=TRUE
mov byte [UseInpData],1
; LN:3042 OutBuf="call __InpData"
mov edi,[OutBuf]
mov esi,_StrConst386
call __SetStrConst
; LN:3043 GOSUB OutCodeData
call OutCodeData
; LN:3044 GOSUB CallErrZ
call CallErrZ
; LN:3045 GOSUB NexToken
call NexToken
; LN:3046 EXITIF TokenBuf<>","
mov esi,_StrConst387
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
jne _Lbl407
; LN:3047 ENDLOOP
jmp _Lbl406
_Lbl407:
; LN:3048 IF FileIO=0 AND NewLine=$0d THEN
xor bh,bh
xor eax,eax
mov al, byte [FileIO]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [NewLine]
mov edx,13
cmp eax,edx
sete bl
and bh,bl
je _Lbl413
; LN:3049 GOSUB OutCRLF
call OutCRLF
; LN:3050 ENDIF
_Lbl413:
; LN:3051 GOTO MainLoop
jmp MainLoop
ReadX:
; LN:3054 NeedComma=0
mov byte [NeedComma],0
; LN:3055 GOSUB NexToken
call NexToken
; LN:3056 IF TokenBuf="#" THEN FileRead' Path# read
mov esi,_StrConst388
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl414
jmp FileRead
_Lbl414:
; LN:3057 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:3058 GOSUB SymSrch
call SymSrch
; LN:3059 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl415
; LN:3060 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:3061 GOTO MainLoop
jmp MainLoop
; LN:3062 ENDIF
_Lbl415:
; LN:3063 GOSUB GetSymTemp
call GetSymTemp
; LN:3064 GOSUB UnDoToken
call UnDoToken
; LN:3065 Target=$ff
mov byte [Target],255
; LN:3066 ReadFlag=$ff
mov byte [ReadFlag],255
; LN:3067 LOOP
_Lbl416:
; LN:3068 IF NeedComma=$ff THEN
cmp [NeedComma],255
jne _Lbl418
; LN:3069 GOSUB NexToken
call NexToken
; LN:3070 IF TokenLen=0 THEN MainLoop
cmp [TokenLen],0
je MainLoop
; LN:3071 IF TokenBuf<>"," THEN
mov esi,_StrConst389
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl420
; LN:3072 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3073 GOTO MainLoop
jmp MainLoop
; LN:3074 ELSE
jmp _Lbl421
_Lbl420:
; LN:3075 NeedComma=0
mov byte [NeedComma],0
; LN:3076 ENDIF
_Lbl421:
; LN:3077 ENDIF
_Lbl418:
; LN:3078 GOSUB GetExp
call GetExp
; LN:3079 ErrMain
; LN:3079 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3080 IF TokenLen=0 THEN MainLoop
cmp [TokenLen],0
je MainLoop
; LN:3081 GOSUB ProcExp
call ProcExp
; LN:3082 ErrMain
; LN:3082 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3083 GOSUB ClassOp
call ClassOp
; LN:3084 GOSUB GetBase
call GetBase
; LN:3085 IF TDataType=COMPVAR OR TDataType>6 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setg bl
or bh,bl
je _Lbl425
; LN:3086 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3087 GOTO MainLoop
jmp MainLoop
; LN:3088 ENDIF
_Lbl425:
; LN:3089 IF DMAddr<>0 THEN
cmp [DMAddr],0
je _Lbl426
; LN:3090 TDataType=LONGVAR
mov word [TDataType],4
; LN:3091 ENDIF
_Lbl426:
; LN:3092 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:3093 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl428
; LN:3094 OutBuf="call __ReadBool"
mov edi,[OutBuf]
mov esi,_StrConst390
call __SetStrConst
; LN:3095 CASE BYTEVAR
jmp _Lbl427
_Lbl428:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl429
; LN:3096 OutBuf="call __ReadByte"'
mov edi,[OutBuf]
mov esi,_StrConst391
call __SetStrConst
; LN:3097 CASE WORDVAR
jmp _Lbl427
_Lbl429:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl430
; LN:3098 OutBuf="call __ReadShort"
mov edi,[OutBuf]
mov esi,_StrConst392
call __SetStrConst
; LN:3099 CASE LONGVAR
jmp _Lbl427
_Lbl430:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl431
; LN:3100 OutBuf="call __ReadLong"
mov edi,[OutBuf]
mov esi,_StrConst393
call __SetStrConst
; LN:3101 CASE FLOATVAR
jmp _Lbl427
_Lbl431:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl432
; LN:3102 OutBuf="call __ReadFlt"
mov edi,[OutBuf]
mov esi,_StrConst394
call __SetStrConst
; LN:3103 CASE STRINGVAR
jmp _Lbl427
_Lbl432:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl433
; LN:3104 OutBuf="mov eax,"+STR$(TDetail)
mov eax, dword [TDetail]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst395
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3105 GOSUB OutCodeData
call OutCodeData
; LN:3106 OutBuf="call __ReadStr"
mov edi,[OutBuf]
mov esi,_StrConst396
call __SetStrConst
; LN:3107 END SELECT
jmp _Lbl427
_Lbl433:
_Lbl427:
; LN:3108 GOSUB OutCodeData
call OutCodeData
; LN:3109 NeedComma=$ff
mov byte [NeedComma],255
; LN:3110 ENDLOOP
jmp _Lbl416
_Lbl417:
FileRead:
; LN:3113 GOSUB UnDoToken
call UnDoToken
; LN:3114 GOSUB ReadWrite
call ReadWrite
; LN:3115 ErrMain
; LN:3115 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3116 INC LabelNum' Start label
inc [LabelNum]
; LN:3117 INC LabelNum' Finish label
inc [LabelNum]
; LN:3118 INC LabelNum' Error label
inc [LabelNum]
; LN:3119 OutBuf="_Lbl"+STR$(LabelNum-2)+":"
mov eax, dword [LabelNum]
mov edx,2
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst397
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst398
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3120 GOSUB OutCodeData
call OutCodeData
; LN:3121 OutBuf="mov [_ArgSafe0],esi"
mov edi,[OutBuf]
mov esi,_StrConst399
call __SetStrConst
; LN:3122 GOSUB OutCodeData
call OutCodeData
; LN:3123 OutBuf="invoke ReadFile,[_IOPthNum],[_IOBuffer],1,XferCount,0"
mov edi,[OutBuf]
mov esi,_StrConst400
call __SetStrConst
; LN:3124 GOSUB OutCodeData
call OutCodeData
; LN:3125 GOSUB SetStatus
call SetStatus
; LN:3126 OutBuf="cmp eax,0"
mov edi,[OutBuf]
mov esi,_StrConst401
call __SetStrConst
; LN:3127 GOSUB OutCodeData
call OutCodeData
; LN:3128 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst402
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst403
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3129 GOSUB OutCodeData
call OutCodeData
; LN:3130 OutBuf="cmp [XferCount],0"
mov edi,[OutBuf]
mov esi,_StrConst404
call __SetStrConst
; LN:3131 GOSUB OutCodeData
call OutCodeData
; LN:3132 OutBuf="je "+"_Lbl"+STR$(LabelNum-1)
mov eax, dword [LabelNum]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst405
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst406
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3133 GOSUB OutCodeData
call OutCodeData
; LN:3134 OutBuf="cmp byte [_IOBuffer+12],13"
mov edi,[OutBuf]
mov esi,_StrConst407
call __SetStrConst
; LN:3135 GOSUB OutCodeData
call OutCodeData
; LN:3136 OutBuf="je _Lbl"+STR$(LabelNum-1)
mov eax, dword [LabelNum]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst408
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3137 GOSUB OutCodeData
call OutCodeData
; LN:3138 OutBuf="cmp byte [_IOBuffer+12],10"
mov edi,[OutBuf]
mov esi,_StrConst409
call __SetStrConst
; LN:3139 GOSUB OutCodeData
call OutCodeData
; LN:3140 OutBuf="je "+"_Lbl"+STR$(LabelNum-2)
mov eax, dword [LabelNum]
mov edx,2
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst410
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst411
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3141 GOSUB OutCodeData
call OutCodeData
; LN:3142 OutBuf="cmp [_ByteCounter],0"
mov edi,[OutBuf]
mov esi,_StrConst412
call __SetStrConst
; LN:3143 GOSUB OutCodeData
call OutCodeData
; LN:3144 OutBuf="je "+"_Lbl"+STR$(LabelNum-2)
mov eax, dword [LabelNum]
mov edx,2
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst413
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst414
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3145 GOSUB OutCodeData
call OutCodeData
; LN:3146 OutBuf="mov al, byte [_IOBuffer+12]"
mov edi,[OutBuf]
mov esi,_StrConst415
call __SetStrConst
; LN:3147 GOSUB OutCodeData
call OutCodeData
; LN:3148 OutBuf="mov esi,[_ArgSafe0]"
mov edi,[OutBuf]
mov esi,_StrConst416
call __SetStrConst
; LN:3149 GOSUB OutCodeData
call OutCodeData
; LN:3150 OutBuf="mov [esi],al"
mov edi,[OutBuf]
mov esi,_StrConst417
call __SetStrConst
; LN:3151 GOSUB OutCodeData
call OutCodeData
; LN:3152 OutBuf="inc esi"
mov edi,[OutBuf]
mov esi,_StrConst418
call __SetStrConst
; LN:3153 GOSUB OutCodeData
call OutCodeData
; LN:3154 OutBuf="mov [_ArgSafe0],esi"
mov edi,[OutBuf]
mov esi,_StrConst419
call __SetStrConst
; LN:3155 GOSUB OutCodeData
call OutCodeData
; LN:3156 OutBuf="dec [_ByteCounter]"
mov edi,[OutBuf]
mov esi,_StrConst420
call __SetStrConst
; LN:3157 GOSUB OutCodeData
call OutCodeData
; LN:3158 OutBuf="jmp "+"_Lbl"+STR$(LabelNum-2)
mov eax, dword [LabelNum]
mov edx,2
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst421
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst422
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3159 GOSUB OutCodeData
call OutCodeData
; LN:3160 OutBuf="_Lbl"+STR$(LabelNum-1)+":"
mov eax, dword [LabelNum]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst423
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst424
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3161 GOSUB OutCodeData
call OutCodeData
; LN:3162 OutBuf="cmp [_ByteCounter],0"
mov edi,[OutBuf]
mov esi,_StrConst425
call __SetStrConst
; LN:3163 GOSUB OutCodeData
call OutCodeData
; LN:3164 OutBuf="je "+"_OELbl"+STR$(OELabelNum+1)
mov eax, dword [OELabelNum]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst426
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst427
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3165 GOSUB OutCodeData
call OutCodeData
; LN:3166 OutBuf="mov esi,[_ArgSafe0]"
mov edi,[OutBuf]
mov esi,_StrConst428
call __SetStrConst
; LN:3167 GOSUB OutCodeData
call OutCodeData
; LN:3168 OutBuf="mov byte [esi],0"
mov edi,[OutBuf]
mov esi,_StrConst429
call __SetStrConst
; LN:3169 GOSUB OutCodeData
call OutCodeData
; LN:3170 OutBuf="jmp _OELbl"+STR$(OELabelNum+1)
mov eax, dword [OELabelNum]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst430
mov [_TmpVec2],esi
mov [_TmpVec2+4],11
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3171 GOSUB OutCodeData
call OutCodeData
; LN:3172 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst431
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst432
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3173 GOSUB OutCodeData
call OutCodeData
; LN:3174 GOSUB CallErrZ
call CallErrZ
; LN:3175 GOTO MainLoop
jmp MainLoop
; LN:3176 GOSUB OutCodeData
call OutCodeData
WriteX:
; LN:3179 GOSUB ReadWrite
call ReadWrite
; LN:3180 ErrMain
; LN:3180 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3181 OutBuf="mov [XferCount],0"
mov edi,[OutBuf]
mov esi,_StrConst433
call __SetStrConst
; LN:3182 GOSUB OutCodeData
call OutCodeData
; LN:3183 INC LabelNum
inc [LabelNum]
; LN:3184 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst434
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst435
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3185 GOSUB OutCodeData
call OutCodeData
; LN:3186 OutBuf="cmp byte [esi],0; Null?"
mov edi,[OutBuf]
mov esi,_StrConst436
call __SetStrConst
; LN:3187 GOSUB OutCodeData
call OutCodeData
; LN:3188 OutBuf="je "+"_Lbl"+STR$(LabelNum+1)
mov eax, dword [LabelNum]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst437
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst438
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3189 GOSUB OutCodeData
call OutCodeData
; LN:3190 OutBuf="inc esi"
mov edi,[OutBuf]
mov esi,_StrConst439
call __SetStrConst
; LN:3191 GOSUB OutCodeData
call OutCodeData
; LN:3192 OutBuf="inc [XferCount]"
mov edi,[OutBuf]
mov esi,_StrConst440
call __SetStrConst
; LN:3193 GOSUB OutCodeData
call OutCodeData
; LN:3194 OutBuf="dec [_ByteCounter]"
mov edi,[OutBuf]
mov esi,_StrConst441
call __SetStrConst
; LN:3195 GOSUB OutCodeData
call OutCodeData
; LN:3196 OutBuf="jne "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst442
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst443
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3197 GOSUB OutCodeData
call OutCodeData
; LN:3198 INC LabelNum
inc [LabelNum]
; LN:3199 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst444
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst445
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3200 GOSUB OutCodeData
call OutCodeData
; LN:3201 GOSUB OutWrite
call OutWrite
; LN:3202 OutBuf="mov edx,[XferCount]"
mov edi,[OutBuf]
mov esi,_StrConst446
call __SetStrConst
; LN:3203 GOSUB OutCodeData
call OutCodeData
; LN:3204 OutBuf="mov [_ArgSafe0],edx"
mov edi,[OutBuf]
mov esi,_StrConst447
call __SetStrConst
; LN:3205 GOSUB OutCodeData
call OutCodeData
; LN:3206 OutBuf="mov eax,[_CRLF]"
mov edi,[OutBuf]
mov esi,_StrConst448
call __SetStrConst
; LN:3207 GOSUB OutCodeData
call OutCodeData
; LN:3208 OutBuf="mov [_XferAddr],eax"
mov edi,[OutBuf]
mov esi,_StrConst449
call __SetStrConst
; LN:3209 GOSUB OutCodeData
call OutCodeData
; LN:3210 OutBuf="mov [XferCount],2"
mov edi,[OutBuf]
mov esi,_StrConst450
call __SetStrConst
; LN:3211 GOSUB OutCodeData
call OutCodeData
; LN:3212 GOSUB OutWrite
call OutWrite
; LN:3213 OutBuf="mov edx,[_ArgSafe0]"
mov edi,[OutBuf]
mov esi,_StrConst451
call __SetStrConst
; LN:3214 GOSUB OutCodeData
call OutCodeData
; LN:3215 OutBuf="add edx,[XferCount]"
mov edi,[OutBuf]
mov esi,_StrConst452
call __SetStrConst
; LN:3216 GOSUB OutCodeData
call OutCodeData
; LN:3217 OutBuf="mov [XferCount],edx"
mov edi,[OutBuf]
mov esi,_StrConst453
call __SetStrConst
; LN:3218 GOSUB OutCodeData
call OutCodeData
; LN:3219 GOTO MainLoop
jmp MainLoop
GetX:
; LN:3222 GOSUB GetPut
call GetPut
; LN:3223 ErrMain
; LN:3223 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3224 GOSUB OutRead
call OutRead
; LN:3225 GOTO MainLoop
jmp MainLoop
PutX:
; LN:3228 GOSUB GetPut
call GetPut
; LN:3229 ErrMain
; LN:3229 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3230 GOSUB OutWrite
call OutWrite
; LN:3231 GOTO MainLoop
jmp MainLoop
EndX:
; LN:3234 GOSUB NexToken
call NexToken
; LN:3235 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl438
; LN:3236 LastStmt=LastStmt+TokenBuf' prevents bug involving false 'end'
mov edi,[LastStmt]
mov [_TmpVec1],edi
mov edi,[LastStmt+4]
mov [_TmpVec1+4],edi
mov edi,[LastStmt+8]
mov [_TmpVec1+8],edi
mov edi,[TokenBuf]
mov [_TmpVec2],edi
mov edi,[TokenBuf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,LastStmt
mov esi,_TmpVec1
call __MovStr
; LN:3237 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:3238 CASE "if"
mov esi,_StrConst454
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl440
; LN:3239 GOTO EndIfX
jmp EndIfX
; LN:3240 CASE "loop"
jmp _Lbl439
_Lbl440:
mov esi,_StrConst455
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl441
; LN:3241 GOTO EndLoopX
jmp EndLoopX
; LN:3242 CASE "while"
jmp _Lbl439
_Lbl441:
mov esi,_StrConst456
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl442
; LN:3243 GOTO EndWhileX
jmp EndWhileX
; LN:3244 CASE "exit"
jmp _Lbl439
_Lbl442:
mov esi,_StrConst457
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl443
; LN:3245 GOTO EndExitX
jmp EndExitX
; LN:3246 CASE "select"
jmp _Lbl439
_Lbl443:
mov esi,_StrConst458
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl444
; LN:3247 GOTO EndSelectX
jmp EndSelectX
; LN:3248 CASE "case"
jmp _Lbl439
_Lbl444:
mov esi,_StrConst459
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl445
; LN:3249 GOTO EndCaseX
jmp EndCaseX
; LN:3250 CASE "function"
jmp _Lbl439
_Lbl445:
mov esi,_StrConst460
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl446
; LN:3251 GOTO EndFunctionX
jmp EndFunctionX
; LN:3252 CASE "procedure"
jmp _Lbl439
_Lbl446:
mov esi,_StrConst461
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl447
; LN:3253 GOTO EndProcedureX
jmp EndProcedureX
; LN:3254 CASE "table"
jmp _Lbl439
_Lbl447:
mov esi,_StrConst462
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl448
; LN:3255 GOTO EndTableX
jmp EndTableX
; LN:3256 CASE "text"
jmp _Lbl439
_Lbl448:
mov esi,_StrConst463
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl449
; LN:3257 GOTO EndTextX
jmp EndTextX
; LN:3258 CASE "type"
jmp _Lbl439
_Lbl449:
mov esi,_StrConst464
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl450
; LN:3259 GOTO EndTypeX
jmp EndTypeX
; LN:3260 CASE ELSE
jmp _Lbl439
_Lbl450:
; LN:3261 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3262 GOTO MainLoop
jmp MainLoop
; LN:3263 END SELECT
jmp _Lbl439
_Lbl451:
_Lbl439:
; LN:3264 ENDIF
_Lbl438:
; LN:3265 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst465
call __SetStrConst
; LN:3266 GOSUB OutCodeData
call OutCodeData
; LN:3267 OutBuf="invoke ExitProcess, eax"
mov edi,[OutBuf]
mov esi,_StrConst466
call __SetStrConst
; LN:3268 GOSUB OutCodeData
call OutCodeData
; LN:3269 GOTO MainLoop
jmp MainLoop
CreateX:
; LN:3272 CrOpFlag=$ff
mov byte [CrOpFlag],255
; LN:3273 Target=$ff
mov byte [Target],255
; LN:3274 GOSUB GetPthNum
call GetPthNum
; LN:3275 ErrMain
; LN:3275 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3276 Target=0
mov byte [Target],0
; LN:3277 GOSUB GetPthNam
call GetPthNam
; LN:3278 ErrMain
; LN:3278 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3279 ColonMain
; LN:3279 GOSUB GetColon
call GetColon
; LN:3279 ErrMain
; LN:3279 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3280 GOSUB GetAccMod
call GetAccMod
; LN:3281 OutBuf="invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0"
mov edi,[OutBuf]
mov esi,_StrConst467
call __SetStrConst
; LN:3282 GOSUB OutCodeData
call OutCodeData
; LN:3283 OutBuf="mov [STATUS],eax"
mov edi,[OutBuf]
mov esi,_StrConst468
call __SetStrConst
; LN:3284 GOSUB OutCodeData
call OutCodeData
; LN:3285 OutBuf="mov ["+PathVar+"],eax"
mov esi,_StrConst469
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[PathVar]
mov [_TmpVec2],edi
mov edi,[PathVar+4]
mov [_TmpVec2+4],edi
mov edi,[PathVar+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst470
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3286 GOSUB OutCodeData
call OutCodeData
; LN:3287 GOSUB CallErr
call CallErr
; LN:3288 GOTO MainLoop
jmp MainLoop
OpenX:
; LN:3291 CrOpFlag=0
mov byte [CrOpFlag],0
; LN:3292 Target=$ff
mov byte [Target],255
; LN:3293 GOSUB GetPthNum
call GetPthNum
; LN:3294 ErrMain
; LN:3294 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3295 Target=0
mov byte [Target],0
; LN:3296 GOSUB GetPthNam
call GetPthNam
; LN:3297 ErrMain
; LN:3297 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3298 ColonMain
; LN:3298 GOSUB GetColon
call GetColon
; LN:3298 ErrMain
; LN:3298 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3299 GOSUB GetAccMod
call GetAccMod
; LN:3300 ErrMain
; LN:3300 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3301 IF DirFlag=$ff THEN
cmp [DirFlag],255
jne _Lbl459
; LN:3302 AccMode=AccMode+"|A_DIR"
mov edi,[AccMode]
mov [_TmpVec1],edi
mov edi,[AccMode+4]
mov [_TmpVec1+4],edi
mov edi,[AccMode+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst471
mov [_TmpVec2],esi
mov [_TmpVec2+4],7
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,AccMode
mov esi,_TmpVec1
call __MovStr
; LN:3303 ENDIF
_Lbl459:
; LN:3304 OutBuf="invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0"
mov edi,[OutBuf]
mov esi,_StrConst472
call __SetStrConst
; LN:3305 GOSUB OutCodeData
call OutCodeData
; LN:3306 OutBuf="mov [STATUS],eax"
mov edi,[OutBuf]
mov esi,_StrConst473
call __SetStrConst
; LN:3307 GOSUB OutCodeData
call OutCodeData
; LN:3308 IF PathIsVector=0 THEN
cmp [PathIsVector],0
jne _Lbl460
; LN:3309 OutBuf="mov ["+PathVar+"],eax"
mov esi,_StrConst474
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[PathVar]
mov [_TmpVec2],edi
mov edi,[PathVar+4]
mov [_TmpVec2+4],edi
mov edi,[PathVar+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst475
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3310 ELSE
jmp _Lbl461
_Lbl460:
; LN:3311 OutBuf="mov edi,["+PathVar+"]"
mov esi,_StrConst476
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[PathVar]
mov [_TmpVec2],edi
mov edi,[PathVar+4]
mov [_TmpVec2+4],edi
mov edi,[PathVar+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst477
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3312 GOSUB OutCodeData
call OutCodeData
; LN:3313 OutBuf="mov [edi],eax"
mov edi,[OutBuf]
mov esi,_StrConst478
call __SetStrConst
; LN:3314 ENDIF
_Lbl461:
; LN:3315 GOSUB OutCodeData
call OutCodeData
; LN:3316 GOSUB CallErr
call CallErr
; LN:3317 GOTO MainLoop
jmp MainLoop
CloseX:
; LN:3320 DiskIO=$ff
mov byte [DiskIO],255
CloseLp:
; LN:3322 GOSUB GetPthNum
call GetPthNum
; LN:3323 ErrMain
; LN:3323 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3324 OutBuf="invoke CloseHandle,[_IOPthNum]"
mov edi,[OutBuf]
mov esi,_StrConst479
call __SetStrConst
; LN:3325 GOSUB OutCodeData
call OutCodeData
; LN:3326 GOSUB SetStatus
call SetStatus
; LN:3327 GOSUB CallErrZ
call CallErrZ
; LN:3328 GOSUB NexToken
call NexToken
; LN:3329 IF TokenLen=0 THEN MainLoop
cmp [TokenLen],0
je MainLoop
; LN:3330 IF TokenBuf<>"," THEN
mov esi,_StrConst480
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl464
; LN:3331 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3332 GOTO MainLoop
jmp MainLoop
; LN:3333 ENDIF
_Lbl464:
; LN:3334 GOTO CloseLp
jmp CloseLp
WhileX:
; LN:3337 INC LabelNum
inc [LabelNum]
; LN:3338 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst481
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst482
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3339 GOSUB OutCodeData
call OutCodeData
; LN:3340 GOSUB CmpOps
call CmpOps
; LN:3341 ErrMain
; LN:3341 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3342 IF TokenBuf<>"do" THEN
mov esi,_StrConst483
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl466
; LN:3343 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3344 GOTO MainLoop
jmp MainLoop
; LN:3345 ENDIF
_Lbl466:
; LN:3346 GOSUB IncConStk
call IncConStk
; LN:3347 ErrMain
; LN:3347 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3348 ConStk(ConStkPtr).LoopLabel=LabelNum
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3349 ConStk(ConStkPtr).ContLabel=LabelNum' For consistancy with CONTINUE statement
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3350 INC LabelNum
inc [LabelNum]
; LN:3351 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3352 ConStk(ConStkPtr).ConType=1
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:3353 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3354 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst484
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst485
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3355 GOSUB OutCodeData
call OutCodeData
; LN:3356 GOTO MainLoop
jmp MainLoop
EndWhileX:
; LN:3359 TempInt=1
mov dword [TempInt],1
; LN:3360 GOSUB ConStkChk
call ConStkChk
; LN:3361 ErrMain
; LN:3361 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3362 OutBuf="jmp "+"_Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst486
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst487
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3363 GOSUB OutCodeData
call OutCodeData
; LN:3364 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst488
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst489
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3365 GOSUB OutCodeData
call OutCodeData
; LN:3366 DEC ConStkPtr
dec [ConStkPtr]
; LN:3367 GOTO MainLoop
jmp MainLoop
NextX:
; LN:3370 IF ConStkPtr=0 THEN
cmp [ConStkPtr],0
jne _Lbl469
; LN:3371 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:3372 GOTO MainLoop
jmp MainLoop
; LN:3373 ENDIF
_Lbl469:
; LN:3374 GOSUB NexToken
call NexToken
; LN:3375 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl470
; LN:3376 TokenSaf=ConStk(ConStkPtr).LoopName
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TokenSaf
mov esi,_TmpVec1
call __MovStr
; LN:3377 ENDIF
_Lbl470:
; LN:3378 IF TokenSaf<>ConStk(ConStkPtr).LoopName THEN
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl471
; LN:3379 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:3380 GOTO MainLoop
jmp MainLoop
; LN:3381 ENDIF
_Lbl471:
; LN:3382 TempInt=5
mov dword [TempInt],5
; LN:3383 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).ContLabel)+":"
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst490
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst491
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3384 GOSUB OutCodeData
call OutCodeData
; LN:3385 GOSUB ConStkChk
call ConStkChk
; LN:3386 ErrMain
; LN:3386 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3387 ' add "step" to loop var
; LN:3388 IF ConStk(ConStkPtr).NoStep=$ff THEN
mov esi,ConStk-(1*73)+49
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
je _Lbl473
; LN:3389 OutBuf="inc ["+ConStk(ConStkPtr).LoopName+"]"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst492
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst493
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3390 GOSUB OutCodeData
call OutCodeData
; LN:3391 ELSE
jmp _Lbl474
_Lbl473:
; LN:3392 IF ConStk(ConStkPtr).ImmStep=0 THEN
mov esi,ConStk-(1*73)+61
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl475
; LN:3393 OutBuf=";"+ConStk(ConStkPtr).LoopName+"="+ConStk(ConStkPtr).LoopName+"+_LopVec"+STR$(ConStk(ConStkPtr).LoopVec)+"._Step;"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+41
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec3]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst494
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_StrConst495
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst496
mov [_TmpVec7],esi
mov [_TmpVec7+4],9
mov [_TmpVec7+8],0
mov esi,_StrConst497
mov [_TmpVec8],esi
mov [_TmpVec8+4],8
mov [_TmpVec8+8],0
mov esi,_TmpVec1
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec5
call __MovStr
; LN:3394 GOSUB OutCodeData
call OutCodeData
; LN:3395 ELSE
jmp _Lbl476
_Lbl475:
; LN:3396 OutBuf=";"+ConStk(ConStkPtr).LoopName+"="+ConStk(ConStkPtr).LoopName+"+"+ConStk(ConStkPtr).ImmStepVal+";"
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,ConStk-(1*73)+62
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec3],esi
mov [_TmpVec3+4],10
mov [_TmpVec3+8],0
mov esi,_StrConst498
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_StrConst499
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_StrConst500
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst501
mov [_TmpVec7],esi
mov [_TmpVec7+4],2
mov [_TmpVec7+8],0
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:3397 GOSUB OutCodeData
call OutCodeData
; LN:3398 ENDIF
_Lbl476:
; LN:3399 ENDIF
_Lbl474:
; LN:3400 ' branch back to loop beginning
; LN:3401 OutBuf="jmp "+"_Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst502
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst503
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3402 GOSUB OutCodeData
call OutCodeData
; LN:3403 ' generate done label
; LN:3404 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst504
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst505
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3405 GOSUB OutCodeData
call OutCodeData
; LN:3406 DEC ConStkPtr
dec [ConStkPtr]
; LN:3407 GOTO MainLoop
jmp MainLoop
RemX:
; LN:3410 GOTO MainLoop
jmp MainLoop
ElseX:
; LN:3413 GOSUB NexToken'  make sure nothing follows
call NexToken
; LN:3414 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl477
; LN:3415 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3416 GOTO MainLoop
jmp MainLoop
; LN:3417 ENDIF
_Lbl477:
; LN:3418 TempInt=0
mov dword [TempInt],0
; LN:3419 GOSUB ConStkChk
call ConStkChk
; LN:3420 ErrMain
; LN:3420 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3421 INC LabelNum
inc [LabelNum]
; LN:3422 OutBuf="jmp "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst506
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst507
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3423 GOSUB OutCodeData
call OutCodeData
; LN:3424 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst508
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst509
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3425 GOSUB OutCodeData
call OutCodeData
; LN:3426 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3427 GOTO MainLoop
jmp MainLoop
EndIfX:
; LN:3430 TempInt=0
mov dword [TempInt],0
; LN:3431 GOSUB ConStkChk
call ConStkChk
; LN:3432 ErrMain
; LN:3432 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3433 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst510
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst511
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3434 GOSUB OutCodeData
call OutCodeData
; LN:3435 DEC ConStkPtr
dec [ConStkPtr]
; LN:3436 GOTO MainLoop
jmp MainLoop
DeleteX:
; LN:3439 GOSUB GetPthNam
call GetPthNam
; LN:3440 ErrMain
; LN:3440 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3441 OutBuf="invoke DeleteFile,[_IOBuffer]"
mov edi,[OutBuf]
mov esi,_StrConst512
call __SetStrConst
; LN:3442 GOSUB OutCodeData
call OutCodeData
; LN:3443 GOSUB SetStatus
call SetStatus
; LN:3444 GOSUB CallErrZ
call CallErrZ
; LN:3445 GOTO MainLoop
jmp MainLoop
BufferX:
; LN:3448 GOSUB TokenSym
call TokenSym
; LN:3449 ErrMain
; LN:3449 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3450 BufName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,BufName
mov esi,_TmpVec1
call __MovStr
; LN:3451 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl482
; LN:3452 GOSUB MakeBuffer
call MakeBuffer
; LN:3453 GOSUB ClrSym
call ClrSym
; LN:3454 SymTemp.DataMod=0
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:3455 SymTemp.DataType=BUFFER
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,15
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:3456 SymTemp.DataSize=8
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax,8
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3457 GOSUB SymInsert
call SymInsert
; LN:3458 ErrMain
; LN:3458 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3459 ENDIF
_Lbl482:
; LN:3460 TDataType=SymTable(SymNdx).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:3461 IF TDataType<>BUFFER THEN
cmp [TDataType],15
je _Lbl484
; LN:3462 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3463 GOTO MainLoop
jmp MainLoop
; LN:3464 ENDIF
_Lbl484:
; LN:3465 EqualMain
; LN:3465 GOSUB GetEqual
call GetEqual
; LN:3465 ErrMain
; LN:3465 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3466 GOSUB Expr
call Expr
; LN:3467 ErrMain
; LN:3467 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3468 IF TSymName<>"~" THEN
mov esi,_StrConst513
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl487
; LN:3469 D0Loaded=0
mov byte [D0Loaded],0
; LN:3470 GOSUB LoadReg
call LoadReg
; LN:3471 ErrMain
; LN:3471 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3472 ENDIF
_Lbl487:
; LN:3473 IF DMConst<>0 AND TSymName="0" THEN
xor bh,bh
xor eax,eax
mov al, byte [DMConst]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,_StrConst514
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl489
; LN:3474 GOSUB ReleaseBuffer
call ReleaseBuffer
; LN:3475 ELSE
jmp _Lbl490
_Lbl489:
; LN:3476 GOSUB GetBuffer
call GetBuffer
; LN:3477 ENDIF
_Lbl490:
; LN:3478 GOTO MainLoop
jmp MainLoop
LoopX:
; LN:3481 GOSUB IncConStk
call IncConStk
; LN:3482 ErrMain
; LN:3482 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3483 GOSUB NexToken
call NexToken
; LN:3484 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl492
; LN:3485 ConStk(ConStkPtr).ConType=3
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:3486 ELSE
jmp _Lbl493
_Lbl492:
; LN:3487 INC LopCtrNum
inc [LopCtrNum]
; LN:3488 IF LopCtrNum>9 THEN
cmp [LopCtrNum],9
jle _Lbl494
; LN:3489 ErrNo=ErrTmpUse
mov dword [ErrNo],26
; LN:3490 GOTO MainLoop
jmp MainLoop
; LN:3491 ENDIF
_Lbl494:
; LN:3492 IF TokenBuf<>"count" THEN
mov esi,_StrConst515
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl495
; LN:3493 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3494 GOTO MainLoop
jmp MainLoop
; LN:3495 ENDIF
_Lbl495:
; LN:3496 EqualMain
; LN:3496 GOSUB GetEqual
call GetEqual
; LN:3496 ErrMain
; LN:3496 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3497 GOSUB GetIntOp
call GetIntOp
; LN:3498 ErrMain
; LN:3498 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3499 OutBuf="mov [_LoopCtr+"+STR$(LopCtrNum*4)+"],"+LdRegName
mov eax, dword [LopCtrNum]
mov edx,4
imul edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst516
mov [_TmpVec2],esi
mov [_TmpVec2+4],15
mov [_TmpVec2+8],0
mov esi,_StrConst517
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov edi,[LdRegName]
mov [_TmpVec4],edi
mov edi,[LdRegName+4]
mov [_TmpVec4+4],edi
mov edi,[LdRegName+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3500 GOSUB OutCodeData
call OutCodeData
; LN:3501 ConStk(ConStkPtr).ConType=4
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:3502 ENDIF
_Lbl493:
; LN:3503 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3504 INC LabelNum
inc [LabelNum]
; LN:3505 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst518
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst519
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3506 GOSUB OutCodeData
call OutCodeData
; LN:3507 ConStk(ConStkPtr).LoopLabel=LabelNum
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3508 ConStk(ConStkPtr).ContLabel=LabelNum' For consistancy with CONTINUE statement
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3509 INC LabelNum
inc [LabelNum]
; LN:3510 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3511 GOTO MainLoop
jmp MainLoop
EndLoopX:
; LN:3514 TempInt=3
mov dword [TempInt],3
; LN:3515 GOSUB ConStkChk
call ConStkChk
; LN:3516 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl498
; LN:3517 ErrNo=0
mov dword [ErrNo],0
; LN:3518 TempInt=4
mov dword [TempInt],4
; LN:3519 GOSUB ConStkChk
call ConStkChk
; LN:3520 ErrMain
; LN:3520 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3521 ENDIF
_Lbl498:
; LN:3522 IF TempInt=3 THEN
cmp [TempInt],3
jne _Lbl500
; LN:3523 OutBuf="jmp "+"_Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst520
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst521
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3524 ELSE
jmp _Lbl501
_Lbl500:
; LN:3525 OutBuf="dec [_LoopCtr"+"+"+STR$(LopCtrNum*4)+"];"
mov eax, dword [LopCtrNum]
mov edx,4
imul edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst522
mov [_TmpVec2],esi
mov [_TmpVec2+4],14
mov [_TmpVec2+8],0
mov esi,_StrConst523
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_StrConst524
mov [_TmpVec4],esi
mov [_TmpVec4+4],3
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3526 GOSUB OutCodeData
call OutCodeData
; LN:3527 OutBuf="jne "+"_Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst525
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst526
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3528 DEC LopCtrNum
dec [LopCtrNum]
; LN:3529 ENDIF
_Lbl501:
; LN:3530 GOSUB OutCodeData
call OutCodeData
; LN:3531 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst527
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst528
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3532 GOSUB OutCodeData
call OutCodeData
; LN:3533 DEC ConStkPtr
dec [ConStkPtr]
; LN:3534 GOTO MainLoop
jmp MainLoop
RepeatX:
; LN:3537 GOSUB IncConStk
call IncConStk
; LN:3538 ErrMain
; LN:3538 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3539 INC LabelNum
inc [LabelNum]
; LN:3540 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst529
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst530
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3541 GOSUB OutCodeData
call OutCodeData
; LN:3542 ConStk(ConStkPtr).LoopLabel=LabelNum
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3543 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3544 ConStk(ConStkPtr).ConType=2
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:3545 INC LabelNum
inc [LabelNum]
; LN:3546 ConStk(ConStkPtr).ContLabel=LabelNum
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3547 INC LabelNum
inc [LabelNum]
; LN:3548 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3549 GOTO MainLoop
jmp MainLoop
UntilX:
; LN:3552 TempInt=2
mov dword [TempInt],2
; LN:3553 GOSUB ConStkChk
call ConStkChk
; LN:3554 ErrMain
; LN:3554 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3555 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).ContLabel)+":"
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst531
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst532
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3556 GOSUB OutCodeData
call OutCodeData
; LN:3557 GOSUB CmpOps
call CmpOps
; LN:3558 ErrMain
; LN:3558 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3559 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl505
; LN:3560 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3561 GOTO MainLoop
jmp MainLoop
; LN:3562 ENDIF
_Lbl505:
; LN:3563 OutBuf="je "+"_Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst533
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_StrConst534
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3564 GOSUB OutCodeData
call OutCodeData
; LN:3565 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst535
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst536
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3566 GOSUB OutCodeData
call OutCodeData
; LN:3567 DEC ConStkPtr
dec [ConStkPtr]
; LN:3568 GOTO MainLoop
jmp MainLoop
ExitIfX:
; LN:3571 GOSUB CmpOps
call CmpOps
; LN:3572 ErrMain
; LN:3572 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3573 IF ConStkPtr<1 THEN
cmp [ConStkPtr],1
jge _Lbl507
; LN:3574 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:3575 GOTO MainLoop
jmp MainLoop
; LN:3576 ENDIF
_Lbl507:
; LN:3577 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl508
; LN:3578 OutBuf="jne "+"_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst537
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst538
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3579 GOSUB OutCodeData
call OutCodeData
; LN:3580 GOTO MainLoop
jmp MainLoop
; LN:3581 ENDIF
_Lbl508:
; LN:3582 IF TokenBuf<>"then" THEN
mov esi,_StrConst539
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl509
; LN:3583 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3584 GOTO MainLoop
jmp MainLoop
; LN:3585 ENDIF
_Lbl509:
; LN:3586 GOSUB NexToken
call NexToken
; LN:3587 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl510
; LN:3588 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3589 GOTO MainLoop
jmp MainLoop
; LN:3590 ENDIF
_Lbl510:
; LN:3591 GOSUB IncConStk
call IncConStk
; LN:3592 ErrMain
; LN:3592 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3593 INC LabelNum
inc [LabelNum]
; LN:3594 ConStk(ConStkPtr).TermLabel=LabelNum
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3595 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:3596 ConStk(ConStkPtr).ConType=6
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:3597 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst540
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst541
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3598 GOSUB OutCodeData
call OutCodeData
; LN:3599 GOTO MainLoop
jmp MainLoop
ShellX:
; LN:3602 GOSUB Expr
call Expr
; LN:3603 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl512
; LN:3604 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3605 GOTO MainLoop
jmp MainLoop
; LN:3606 ENDIF
_Lbl512:
; LN:3607 OutBuf="mov edi,_IOBuffer"
mov edi,[OutBuf]
mov esi,_StrConst542
call __SetStrConst
; LN:3608 GOSUB OutCodeData
call OutCodeData
; LN:3609 OutBuf="mov esi,"+TSymName+"; Get src"
mov esi,_StrConst543
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst544
mov [_TmpVec3],esi
mov [_TmpVec3+4],10
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3610 GOSUB OutCodeData
call OutCodeData
; LN:3611 UseMovStr=TRUE
mov byte [UseMovStr],1
; LN:3612 OutBuf="call __MovStr"
mov edi,[OutBuf]
mov esi,_StrConst545
call __SetStrConst
; LN:3613 GOSUB OutCodeData
call OutCodeData
; LN:3614 OutBuf="cinvoke system,[_IOBuffer]"
mov edi,[OutBuf]
mov esi,_StrConst546
call __SetStrConst
; LN:3615 GOSUB OutCodeData
call OutCodeData
; LN:3616 GOTO MainLoop
jmp MainLoop
FPrintX:
; LN:3619 FileIO=$ff
mov byte [FileIO],255
; LN:3620 GOTO PrintX
jmp PrintX
FInputX:
; LN:3623 FileIO=$ff
mov byte [FileIO],255
; LN:3624 GOTO InputX
jmp InputX
BaseX:
; LN:3627 GOSUB NexToken
call NexToken
; LN:3628 IF TokenBuf<>"0" AND TokenBuf<>"1" THEN
mov esi,_StrConst547
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
mov esi,_StrConst548
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl513
; LN:3629 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3630 GOTO MainLoop
jmp MainLoop
; LN:3631 ENDIF
_Lbl513:
; LN:3632 IF TokenBuf="0" THEN
mov esi,_StrConst549
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl514
; LN:3633 ArrayBase=0
mov byte [ArrayBase],0
; LN:3634 ELSE
jmp _Lbl515
_Lbl514:
; LN:3635 ArrayBase=1
mov byte [ArrayBase],1
; LN:3636 ENDIF
_Lbl515:
; LN:3637 GOTO MainLoop
jmp MainLoop
IncX:
; LN:3640 DecInc="inc"
mov esi,_StrConst550
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,DecInc
mov esi,_TmpVec1
call __MovStr
INCx1:
; LN:3642 Target=$ff
mov byte [Target],255
; LN:3643 GOSUB Expr
call Expr
; LN:3644 ErrMain
; LN:3644 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3645 FcnOp1Nam=TSymName
mov edi,FcnOp1Nam
mov esi,TSymName
call __MovStr
; LN:3646 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl517
; LN:3647 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:3648 GOTO MainLoop
jmp MainLoop
; LN:3649 ENDIF
_Lbl517:
; LN:3650 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl518
; LN:3651 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3652 GOTO MainLoop
jmp MainLoop
; LN:3653 ENDIF
_Lbl518:
; LN:3654 IF DMAddr=0 THEN
cmp [DMAddr],0
jne _Lbl519
; LN:3655 IF LAND(VectorBit,TDataMod)=VectorBit THEN
mov eax,32
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,32
cmp eax,edx
sete bl
or bh,bl
je _Lbl520
; LN:3656 OutBuf="mov esi,["+SymTemp.SymName+"]"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst551
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_StrConst552
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3657 GOSUB OutCodeData
call OutCodeData
; LN:3658 OutBuf=DecInc+_DataType+"[esi]; INC/DEC operand"
mov edi,[DecInc]
mov [_TmpVec1],edi
mov edi,[DecInc+4]
mov [_TmpVec1+4],edi
mov edi,[DecInc+8]
mov [_TmpVec1+8],edi
mov edi,[_DataType]
mov [_TmpVec2],edi
mov edi,[_DataType+4]
mov [_TmpVec2+4],edi
mov edi,[_DataType+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst553
mov [_TmpVec3],esi
mov [_TmpVec3+4],23
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3659 ELSE
jmp _Lbl521
_Lbl520:
; LN:3660 OutBuf=DecInc+" ["+SymTemp.SymName+"]"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,[DecInc]
mov [_TmpVec2],edi
mov edi,[DecInc+4]
mov [_TmpVec2+4],edi
mov edi,[DecInc+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst554
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov esi,_StrConst555
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3661 ENDIF
_Lbl521:
; LN:3662 ELSE
jmp _Lbl522
_Lbl519:
; LN:3663 GOSUB GetVarSiz
call GetVarSiz
; LN:3664 IF LAND(VectorBit,TDataMod)=VectorBit THEN
mov eax,32
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,32
cmp eax,edx
sete bl
or bh,bl
je _Lbl523
; LN:3665 OutBuf=";(long)"+SymTemp.SymName+"._Ptr=(long)"+SymTemp.SymName+"._Ptr"+LEFT$(DecInc,1)+STR$(VarSize)+";"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,[DecInc]
mov [_TmpVec3],edi
mov edi,[DecInc+4]
mov [_TmpVec3+4],edi
mov edi,[DecInc+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov eax, dword [VarSize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst556
mov [_TmpVec5],esi
mov [_TmpVec5+4],8
mov [_TmpVec5+8],0
mov esi,_StrConst557
mov [_TmpVec6],esi
mov [_TmpVec6+4],13
mov [_TmpVec6+8],0
mov esi,_StrConst558
mov [_TmpVec7],esi
mov [_TmpVec7+4],6
mov [_TmpVec7+8],0
mov esi,_StrConst559
mov [_TmpVec8],esi
mov [_TmpVec8+4],2
mov [_TmpVec8+8],0
mov esi,_TmpVec1
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec7+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec8
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec5
call __MovStr
; LN:3666 GOSUB OutCodeData
call OutCodeData
; LN:3667 OutBuf=";*((long*)esi)=(long)"+SymTemp.SymName+"._Ptr;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst560
mov [_TmpVec2],esi
mov [_TmpVec2+4],22
mov [_TmpVec2+8],0
mov esi,_StrConst561
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3668 ELSE
jmp _Lbl524
_Lbl523:
; LN:3669 OutBuf=";"+SymTemp.SymName+"="+SymTemp.SymName+LEFT$(DecInc,1)+STR$(VarSize)+";"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,[DecInc]
mov [_TmpVec3],edi
mov edi,[DecInc+4]
mov [_TmpVec3+4],edi
mov edi,[DecInc+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov eax, dword [VarSize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst562
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_StrConst563
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst564
mov [_TmpVec7],esi
mov [_TmpVec7+4],2
mov [_TmpVec7+8],0
mov esi,_TmpVec1
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec6+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec7
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec5
call __MovStr
; LN:3670 ENDIF
_Lbl524:
; LN:3671 ENDIF
_Lbl522:
; LN:3672 GOSUB OutCodeData
call OutCodeData
; LN:3673 GOTO MainLoop
jmp MainLoop
DecX:
; LN:3676 DecInc="dec"
mov esi,_StrConst565
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,DecInc
mov esi,_TmpVec1
call __MovStr
; LN:3677 GOTO INCx1
jmp INCx1
BufReadX:
; LN:3680 GOSUB BufRW
call BufRW
; LN:3681 ErrMain
; LN:3681 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3682 GOSUB OutRead
call OutRead
; LN:3683 GOTO MainLoop
jmp MainLoop
BufWriteX:
; LN:3686 GOSUB BufRW
call BufRW
; LN:3687 ErrMain
; LN:3687 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3688 GOSUB OutWrite
call OutWrite
; LN:3689 GOTO MainLoop
jmp MainLoop
DecimalsX:
; LN:3692 DigDec=0
mov byte [DigDec],0
Decimals1:
; LN:3694 GOSUB GetIntOp
call GetIntOp
; LN:3695 ErrMain
; LN:3695 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3696 IF DigDec=0 THEN
cmp [DigDec],0
jne _Lbl528
; LN:3697 OutBuf="mov [_Decimals],eax"
mov edi,[OutBuf]
mov esi,_StrConst566
call __SetStrConst
; LN:3698 ELSE
jmp _Lbl529
_Lbl528:
; LN:3699 OutBuf="mov [_Digits],eax"
mov edi,[OutBuf]
mov esi,_StrConst567
call __SetStrConst
; LN:3700 ENDIF
_Lbl529:
; LN:3701 GOSUB OutCodeData
call OutCodeData
; LN:3702 GOTO MainLoop
jmp MainLoop
ExchangeX:
; LN:3705 Target=$ff
mov byte [Target],255
; LN:3706 GOSUB Expr
call Expr
; LN:3707 ErrMain
; LN:3707 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3708 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl531
; LN:3709 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:3710 GOTO MainLoop
jmp MainLoop
; LN:3711 ENDIF
_Lbl531:
; LN:3712 Op1Name=TSymName
mov edi,Op1Name
mov esi,TSymName
call __MovStr
; LN:3713 Op1Class=OpClass
mov al, byte [OpClass]
mov [Op1Class],al
; LN:3714 Op1Type=TDataType
mov ax, word [TDataType]
mov [Op1Type],al
; LN:3715 Op1Mod=TDataMod
mov ax, word [TDataMod]
mov [Op1Mod],ax
; LN:3716 Op1Detail=TDetail
mov eax, dword [TDetail]
mov [Op1Detail],eax
; LN:3717 Op1DataSize=TDataSize
mov eax, dword [TDataSize]
mov [Op1DataSize],eax
; LN:3718 IF Op1Name="NextArg" THEN
mov esi,_StrConst568
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,Op1Name
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl532
; LN:3719 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:3720 GOTO MainLoop
jmp MainLoop
; LN:3721 ENDIF
_Lbl532:
; LN:3722 CommaMain
; LN:3722 GOSUB GetComma
call GetComma
; LN:3722 ErrMain
; LN:3722 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3723 GOSUB Expr
call Expr
; LN:3724 ErrMain
; LN:3724 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3725 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl535
; LN:3726 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:3727 GOTO MainLoop
jmp MainLoop
; LN:3728 ENDIF
_Lbl535:
; LN:3729 Op2Name=TSymName
mov edi,Op2Name
mov esi,TSymName
call __MovStr
; LN:3730 Op2Class=OpClass
mov al, byte [OpClass]
mov [Op2Class],al
; LN:3731 Op2Type=TDataType
mov ax, word [TDataType]
mov [Op2Type],al
; LN:3732 Op2Mod=TDataMod
mov ax, word [TDataMod]
mov [Op2Mod],ax
; LN:3733 Op2Detail=TDetail
mov eax, dword [TDetail]
mov [Op2Detail],eax
; LN:3734 Op2DataSize=TDataSize
mov eax, dword [TDataSize]
mov [Op2DataSize],eax
; LN:3735 IF Op2Name="NextArg" THEN
mov esi,_StrConst569
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,Op2Name
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl536
; LN:3736 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:3737 GOTO MainLoop
jmp MainLoop
; LN:3738 ENDIF
_Lbl536:
; LN:3739 IF Op1Type<>Op2Type THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Type]
xor edx,edx
mov dl, byte [Op2Type]
cmp eax,edx
setne bl
or bh,bl
je _Lbl537
; LN:3740 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3741 GOTO MainLoop
jmp MainLoop
; LN:3742 ENDIF
_Lbl537:
; LN:3743 IF Op1Class<>CPXClass AND Op1DataSize<>Op2DataSize THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,4
cmp eax,edx
setne bl
or bh,bl
mov eax, dword [Op1DataSize]
mov edx, dword [Op2DataSize]
cmp eax,edx
setne bl
and bh,bl
je _Lbl538
; LN:3744 IF Op1Type<>STRINGVAR THEN
cmp [Op1Type],6
je _Lbl539
; LN:3745 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3746 GOTO MainLoop
jmp MainLoop
; LN:3747 ELSE
jmp _Lbl540
_Lbl539:
; LN:3748 IF Op1Detail<>Op2Detail THEN
xor bh,bh
mov eax, dword [Op1Detail]
mov edx, dword [Op2Detail]
cmp eax,edx
setne bl
or bh,bl
je _Lbl541
; LN:3749 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3750 GOTO MainLoop
jmp MainLoop
; LN:3751 ENDIF
_Lbl541:
; LN:3752 ENDIF
_Lbl540:
; LN:3753 ENDIF
_Lbl538:
; LN:3754 IF Op1Class=CPXClass AND SymTable(Op1Detail).DataSize<>SymTable(Op2Detail).DataSize THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTable-(1*60)+40
mov eax, dword [Op1Detail]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+40
mov eax, dword [Op2Detail]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edi,[_TmpVec2]
mov edx, dword [edi]
cmp eax,edx
setne bl
and bh,bl
je _Lbl542
; LN:3755 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3756 GOTO MainLoop
jmp MainLoop
; LN:3757 ENDIF
_Lbl542:
; LN:3758 IF Op1Class=FLTClass OR Op1Class=INTClass OR Op1Class=BOOLClass THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
je _Lbl543
; LN:3759 Promote=$ff
mov byte [Promote],255
; LN:3760 SymTemp.SymName=Op1Name
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,Op1Name
call __MovStr
; LN:3761 GOSUB LoadReg
call LoadReg
; LN:3762 ErrMain
; LN:3762 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3763 SymTemp.SymName=Op2Name
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,Op2Name
call __MovStr
; LN:3764 GOSUB LoadReg
call LoadReg
; LN:3765 ErrMain
; LN:3765 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3766 TempStr=Op1Name
mov edi,TempStr
mov esi,Op1Name
call __MovStr
; LN:3767 Op1Name=Op2Name
mov edi,Op1Name
mov esi,Op2Name
call __MovStr
; LN:3768 Op2Name=TempStr
mov edi,Op2Name
mov esi,TempStr
call __MovStr
; LN:3769 GOSUB StoreD0
call StoreD0
; LN:3770 ErrMain
; LN:3770 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3771 OutBuf="mov eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst570
call __SetStrConst
; LN:3772 GOSUB OutCodeData
call OutCodeData
; LN:3773 Op1Name=Op2Name
mov edi,Op1Name
mov esi,Op2Name
call __MovStr
; LN:3774 GOSUB StoreD0
call StoreD0
; LN:3775 GOTO MainLoop
jmp MainLoop
; LN:3776 ENDIF
_Lbl543:
; LN:3777 IF Op1Class=CPXClass OR Op1Class=ARRClass OR Op1Type=STRINGVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Type]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
je _Lbl547
; LN:3778 IF LAND(Op1Mod,VectorBit)=0 THEN
xor eax,eax
mov ax, word [Op1Mod]
mov edx,32
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl548
; LN:3779 OutBuf="mov esi,"+Op1Name
mov esi,_StrConst571
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3780 ELSE
jmp _Lbl549
_Lbl548:
; LN:3781 OutBuf="mov esi,["+Op1Name+"]"
mov esi,_StrConst572
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst573
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3782 GOSUB OutCodeData
call OutCodeData
; LN:3783 OutBuf="mov esi,[esi]"
mov edi,[OutBuf]
mov esi,_StrConst574
call __SetStrConst
; LN:3784 ENDIF
_Lbl549:
; LN:3785 GOSUB OutCodeData
call OutCodeData
; LN:3786 IF LAND(Op1Mod,VectorBit)=0 THEN
xor eax,eax
mov ax, word [Op1Mod]
mov edx,32
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl550
; LN:3787 OutBuf="mov esi,"+Op2Name
mov esi,_StrConst575
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3788 ELSE
jmp _Lbl551
_Lbl550:
; LN:3789 OutBuf="mov esi,["+Op2Name+"]"
mov esi,_StrConst576
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst577
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3790 GOSUB OutCodeData
call OutCodeData
; LN:3791 OutBuf="mov esi,[esi]"
mov edi,[OutBuf]
mov esi,_StrConst578
call __SetStrConst
; LN:3792 ENDIF
_Lbl551:
; LN:3793 GOSUB OutCodeData
call OutCodeData
; LN:3794 IF Op1Class=ARRClass THEN
cmp [Op1Class],3
jne _Lbl552
; LN:3795 TempInt=Op1DataSize
mov eax, dword [Op1DataSize]
mov [TempInt],eax
; LN:3796 ELSE
jmp _Lbl553
_Lbl552:
; LN:3797 IF Op1Type=STRINGVAR THEN
cmp [Op1Type],6
jne _Lbl554
; LN:3798 TempInt=Op1Detail
mov eax, dword [Op1Detail]
mov [TempInt],eax
; LN:3799 ELSE
jmp _Lbl555
_Lbl554:
; LN:3800 TempInt=SymTable(Op1Detail).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [Op1Detail]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TempInt],eax
; LN:3801 ENDIF
_Lbl555:
; LN:3802 ENDIF
_Lbl553:
; LN:3803 INC LabelNum		
inc [LabelNum]
; LN:3804 OutBuf="mov edx,"+STR$(TempInt)	
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst579
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3805 GOSUB OutCodeData
call OutCodeData
; LN:3806 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst580
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst581
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3807 GOSUB OutCodeData
call OutCodeData
; LN:3808 OutBuf="mov al,[esi]"
mov edi,[OutBuf]
mov esi,_StrConst582
call __SetStrConst
; LN:3809 GOSUB OutCodeData
call OutCodeData
; LN:3810 OutBuf="mov ah,[edi]"
mov edi,[OutBuf]
mov esi,_StrConst583
call __SetStrConst
; LN:3811 GOSUB OutCodeData
call OutCodeData
; LN:3812 OutBuf="mov [esi],ah"
mov edi,[OutBuf]
mov esi,_StrConst584
call __SetStrConst
; LN:3813 GOSUB OutCodeData
call OutCodeData
; LN:3814 OutBuf="mov [edi],al"
mov edi,[OutBuf]
mov esi,_StrConst585
call __SetStrConst
; LN:3815 GOSUB OutCodeData
call OutCodeData
; LN:3816 OutBuf="inc esi"
mov edi,[OutBuf]
mov esi,_StrConst586
call __SetStrConst
; LN:3817 GOSUB OutCodeData
call OutCodeData
; LN:3818 OutBuf="inc edi"
mov edi,[OutBuf]
mov esi,_StrConst587
call __SetStrConst
; LN:3819 GOSUB OutCodeData	
call OutCodeData
; LN:3820 OutBuf="dec edx"
mov edi,[OutBuf]
mov esi,_StrConst588
call __SetStrConst
; LN:3821 GOSUB OutCodeData
call OutCodeData
; LN:3822 OutBuf="jne "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst589
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst590
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3823 GOSUB OutCodeData
call OutCodeData
; LN:3824 GOTO MainLoop	
jmp MainLoop
; LN:3825 ENDIF
_Lbl547:
; LN:3826 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:3827 GOTO MainLoop
jmp MainLoop
BeepX:
; LN:3830 GOTO MainLoop
jmp MainLoop
EndExitX:
; LN:3833 TempInt=6
mov dword [TempInt],6
; LN:3834 GOSUB ConStkChk
call ConStkChk
; LN:3835 ErrMain
; LN:3835 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3836 OutBuf="jmp "+"_Lbl"+STR$(ConStk(ConStkPtr-1).TermLabel)
mov eax, dword [ConStkPtr]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,ConStk-(1*73)+0
mov eax, dword [_Tmp1]
imul eax,73
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
mov esi,_StrConst591
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst592
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3837 GOSUB OutCodeData
call OutCodeData
; LN:3838 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst593
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst594
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:3839 GOSUB OutCodeData
call OutCodeData
; LN:3840 DEC ConStkPtr
dec [ConStkPtr]
; LN:3841 GOTO MainLoop
jmp MainLoop
ReDimX:
; LN:3844 IgnoreRightParam=$ff
mov byte [IgnoreRightParam],255
; LN:3845 GOSUB TokenSym
call TokenSym
; LN:3846 ErrMain
; LN:3846 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3847 BufName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,BufName
mov esi,_TmpVec1
call __MovStr
; LN:3848 BufDataSize=SymTable(SymNdx).DataAddr
mov esi,SymTable-(1*60)+36
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [BufDataSize],eax
; LN:3849 IF LAND(SymTable(SymNdx).DataMod,ReDimBit)<>ReDimBit THEN
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,256
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,256
cmp eax,edx
setne bl
or bh,bl
je _Lbl558
; LN:3850 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3851 ENDIF
_Lbl558:
; LN:3852 GOSUB NexToken
call NexToken
; LN:3853 IF TokenBuf<>"(" THEN
mov esi,_StrConst595
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl559
; LN:3854 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3855 GOTO MainLoop
jmp MainLoop
; LN:3856 ENDIF
_Lbl559:
; LN:3857 TempInt=0
mov dword [TempInt],0
; LN:3858 Ctr1=0
mov dword [Ctr1],0
; LN:3859 FOR I=SrcNdx TO EndNdx
mov eax,[SrcNdx]
mov [I],eax
mov eax,[EndNdx]
mov [_LopVec4],eax
_Lbl560:
mov eax,[I]
cmp eax,[_LopVec4]
jg _Lbl562
; LN:3860 IF MID$(SrcLine,I,1)="," THEN
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [I]
mov edx,1
call __MidStr
mov esi,_StrConst596
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl563
; LN:3861 INC Ctr1
inc [Ctr1]
; LN:3862 ENDIF
_Lbl563:
; LN:3863 NEXT I
_Lbl561:
inc [I]
jmp _Lbl560
_Lbl562:
; LN:3864 IF Ctr1>2 THEN
cmp [Ctr1],2
jle _Lbl564
; LN:3865 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3866 ENDIF
_Lbl564:
; LN:3867 GOSUB Expr
call Expr
; LN:3868 ErrMain
; LN:3868 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3869 IF TSymName<>"~" THEN
mov esi,_StrConst597
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl566
; LN:3870 D0Loaded=0
mov byte [D0Loaded],0
; LN:3871 GOSUB LoadReg
call LoadReg
; LN:3872 ErrMain
; LN:3872 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3873 ENDIF
_Lbl566:
; LN:3874 OutBuf="imul eax,"+STR$(BufDataSize)
mov eax, dword [BufDataSize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst598
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3875 GOSUB OutCodeData
call OutCodeData
; LN:3876 IF DMConst<>0 AND TSymName="0" THEN
xor bh,bh
xor eax,eax
mov al, byte [DMConst]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,_StrConst599
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl568
; LN:3877 GOSUB ReleaseBuffer
call ReleaseBuffer
; LN:3878 ELSE
jmp _Lbl569
_Lbl568:
; LN:3879 GOSUB GetBuffer
call GetBuffer
; LN:3880 ENDIF
_Lbl569:
; LN:3881 GOTO MainLoop
jmp MainLoop
PlayWaveX:
; LN:3884 GOSUB Expr
call Expr
; LN:3885 ErrMain
; LN:3885 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3886 IF OpClass<>STRClass THEN
cmp [OpClass],2
je _Lbl571
; LN:3887 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:3888 GOTO MainLoop
jmp MainLoop
; LN:3889 ENDIF
_Lbl571:
; LN:3890 OutBuf="mov esi,"+TSymName
mov esi,_StrConst600
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3891 GOSUB OutCodeData
call OutCodeData
; LN:3892 OutBuf="mov eax,[esi]"
mov edi,[OutBuf]
mov esi,_StrConst601
call __SetStrConst
; LN:3893 GOSUB OutCodeData
call OutCodeData
; LN:3894 OutBuf="mov [_ArgSafe0],eax"
mov edi,[OutBuf]
mov esi,_StrConst602
call __SetStrConst
; LN:3895 GOSUB OutCodeData
call OutCodeData
; LN:3896 OutBuf="mov [_ArgSafe1],0"
mov edi,[OutBuf]
mov esi,_StrConst603
call __SetStrConst
; LN:3897 GOSUB OutCodeData
call OutCodeData
; LN:3898 GOSUB NexToken
call NexToken
; LN:3899 IF TokenLen=0 THEN PlayWave1
cmp [TokenLen],0
je PlayWave1
; LN:3900 GOSUB Expr
call Expr
; LN:3901 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl573
; LN:3902 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:3903 GOTO MainLoop
jmp MainLoop
; LN:3904 ENDIF
_Lbl573:
; LN:3905 IF TSymName<>"~" THEN
mov esi,_StrConst604
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl574
; LN:3906 D0Loaded=0
mov byte [D0Loaded],0
; LN:3907 GOSUB LoadReg
call LoadReg
; LN:3908 ErrMain
; LN:3908 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3909 ENDIF
_Lbl574:
; LN:3910 OutBuf="mov _ArgSafe1,eax"
mov edi,[OutBuf]
mov esi,_StrConst605
call __SetStrConst
; LN:3911 GOSUB OutCodeData
call OutCodeData
PlayWave1:
; LN:3913 OutBuf="invoke sndPlaySound,[_ArgSafe0],[_ArgSafe1]"
mov edi,[OutBuf]
mov esi,_StrConst606
call __SetStrConst
; LN:3914 GOSUB OutCodeData
call OutCodeData
; LN:3915 GOTO MainLoop
jmp MainLoop
SetVecX:
; LN:3918 GOSUB TokenSym
call TokenSym
; LN:3919 ErrMain
; LN:3919 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3920 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl577
; LN:3921 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:3922 GOTO MainLoop
jmp MainLoop
; LN:3923 ENDIF
_Lbl577:
; LN:3924 VectorName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,VectorName
mov esi,_TmpVec1
call __MovStr
; LN:3925 VDataMod=SymTable(SymNdx).DataMod
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [VDataMod],ax
; LN:3926 VDataAddr=SymTable(SymNdx).DataAddr
mov esi,SymTable-(1*60)+36
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [VDataAddr],eax
; LN:3927 IF SymTable(SymNdx).DataType=STRINGVAR THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
je _Lbl578
; LN:3928 VDetail=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [VDetail],eax
; LN:3929 ELSE
jmp _Lbl579
_Lbl578:
; LN:3930 VDetail=0
mov dword [VDetail],0
; LN:3931 ENDIF
_Lbl579:
; LN:3932 IF LAND(VDataMod,VectorBit)=0 THEN' Not a vector
xor eax,eax
mov ax, word [VDataMod]
mov edx,32
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl580
; LN:3933 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:3934 GOTO MainLoop
jmp MainLoop
; LN:3935 ENDIF
_Lbl580:
; LN:3936 EqualMain
; LN:3936 GOSUB GetEqual
call GetEqual
; LN:3936 ErrMain
; LN:3936 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3937 GOSUB GetIntOp
call GetIntOp
; LN:3938 ErrMain
; LN:3938 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3939 IF LAND(VDataMod,ArrayBit)=ArrayBit THEN
xor eax,eax
mov ax, word [VDataMod]
mov edx,1
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
je _Lbl583
; LN:3940 TempInt=ArrayBase*VDataAddr
xor eax,eax
mov al, byte [ArrayBase]
mov edx, dword [VDataAddr]
imul edx
mov dword [TempInt],eax
; LN:3941 OutBuf="sub eax,"+STR$(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst607
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3942 GOSUB OutCodeData
call OutCodeData
; LN:3943 ENDIF
_Lbl583:
; LN:3944 OutBuf="mov ["+VectorName+"],eax"
mov esi,_StrConst608
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[VectorName]
mov [_TmpVec2],edi
mov edi,[VectorName+4]
mov [_TmpVec2+4],edi
mov edi,[VectorName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst609
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3945 GOSUB OutCodeData
call OutCodeData
; LN:3946 IF VDetail<>0 THEN'  must be STRING.. do rest of vector
cmp [VDetail],0
je _Lbl584
; LN:3947 GOSUB NexToken
call NexToken
; LN:3948 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl585
; LN:3949 OutBuf="mov ["+VectorName+"+4],"+STR$(VDetail)
mov eax, dword [VDetail]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst610
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov edi,[VectorName]
mov [_TmpVec3],edi
mov edi,[VectorName+4]
mov [_TmpVec3+4],edi
mov edi,[VectorName+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst611
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:3950 ELSE
jmp _Lbl586
_Lbl585:
; LN:3951 IF TokenBuf<>"," THEN
mov esi,_StrConst612
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl587
; LN:3952 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3953 GOTO MainLoop
jmp MainLoop
; LN:3954 ENDIF
_Lbl587:
; LN:3955 GOSUB GetIntOp
call GetIntOp
; LN:3956 ErrMain
; LN:3956 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3957 OutBuf="mov ["+VectorName+"+4],eax"
mov esi,_StrConst613
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[VectorName]
mov [_TmpVec2],edi
mov edi,[VectorName+4]
mov [_TmpVec2+4],edi
mov edi,[VectorName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst614
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3958 ENDIF
_Lbl586:
; LN:3959 GOSUB OutCodeData
call OutCodeData
; LN:3960 OutBuf="mov ["+VectorName+"+8],0"
mov esi,_StrConst615
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[VectorName]
mov [_TmpVec2],edi
mov edi,[VectorName+4]
mov [_TmpVec2+4],edi
mov edi,[VectorName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst616
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3961 GOSUB OutCodeData
call OutCodeData
; LN:3962 ENDIF
_Lbl584:
; LN:3963 GOTO MainLoop
jmp MainLoop
DigitsX:
; LN:3966 DigDec=$ff
mov byte [DigDec],255
; LN:3967 GOTO Decimals1
jmp Decimals1
MacroX:
; LN:3970 GOTO MACRODx
jmp MACRODx
EndMacroX:
; LN:3973 ErrNo=ErrEndm
mov dword [ErrNo],18
; LN:3974 GOTO MainLoop
jmp MainLoop
TableX:
; LN:3977 ArraySize=0
mov dword [ArraySize],0
; LN:3978 GOSUB ClrDatTyp
call ClrDatTyp
; LN:3979 GOSUB TokenSym
call TokenSym
; LN:3980 SymNdxSaf=SymNdx
mov eax, dword [SymNdx]
mov [SymNdxSaf],eax
; LN:3981 ErrMain
; LN:3981 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:3982 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl590
; LN:3983 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:3984 GOTO MainLoop
jmp MainLoop
; LN:3985 ENDIF
_Lbl590:
; LN:3986 GOSUB NexToken
call NexToken
; LN:3987 IF TokenBuf<>"as" THEN
mov esi,_StrConst617
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl591
; LN:3988 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:3989 GOTO MainLoop
jmp MainLoop
; LN:3990 ENDIF
_Lbl591:
; LN:3991 OutBuf=""
mov [OutBuf+12],0
; LN:3992 GOSUB OutInitData
call OutInitData
; LN:3993 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst618
call __SetStrConst
; LN:3994 GOSUB OutInitData
call OutInitData
; LN:3995 OutBuf=SymTemp.SymName+":"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst619
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:3996 GOSUB OutInitData
call OutInitData
; LN:3997 GOSUB ClrSym
call ClrSym
; LN:3998 GOSUB NexToken
call NexToken
; LN:3999 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:4000 CASE "boolean"
mov esi,_StrConst620
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl593
; LN:4001 SymTemp.DataType=BOOLVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4002 SymTemp.DataAddr=1
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4003 CASE "byte"
jmp _Lbl592
_Lbl593:
mov esi,_StrConst621
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl594
; LN:4004 SymTemp.DataType=BYTEVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4005 SymTemp.DataAddr=1
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4006 CASE "integer"
jmp _Lbl592
_Lbl594:
mov esi,_StrConst622
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl595
; LN:4007 SymTemp.DataType=WORDVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4008 SymTemp.DataAddr=2
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4009 CASE "long"
jmp _Lbl592
_Lbl595:
mov esi,_StrConst623
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl596
; LN:4010 SymTemp.DataType=LONGVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4011 SymTemp.DataAddr=4
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4012 CASE "double"
jmp _Lbl592
_Lbl596:
mov esi,_StrConst624
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl597
; LN:4013 SymTemp.DataType=FLOATVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4014 SymTemp.DataAddr=8
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,8
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4015 CASE "label"
jmp _Lbl592
_Lbl597:
mov esi,_StrConst625
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl598
; LN:4016 SymTemp.DataType=LABELPTR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,16
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4017 SymTemp.DataAddr=4
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4018 CASE "string"
jmp _Lbl592
_Lbl598:
mov esi,_StrConst626
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl599
; LN:4019 SymTemp.DataType=STRINGVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4020 IF NextByte<>"*" THEN
mov esi,_StrConst627
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl600
; LN:4021 TempInt=255' Default string size
mov dword [TempInt],255
; LN:4022 ELSE
jmp _Lbl601
_Lbl600:
; LN:4023 GOSUB NexToken' Eat '*'
call NexToken
; LN:4024 GOSUB NexToken
call NexToken
; LN:4025 TempStr=TokenSaf
mov edi,TempStr
mov esi,TokenSaf
call __MovStr
; LN:4026 GOSUB StrSiz
call StrSiz
; LN:4027 ErrRet
; LN:4027 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl602
; LN:4027 RETURN
ret
; LN:4027 ENDIF
_Lbl602:
; LN:4028 ENDIF
_Lbl601:
; LN:4029 SymTemp.Detail=TempInt
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4030 SymTemp.DataAddr=TempInt
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4031 StringLength=TempInt
mov eax, dword [TempInt]
mov [StringLength],eax
; LN:4032 CASE ELSE
jmp _Lbl592
_Lbl599:
; LN:4033 TableName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TableName
mov esi,_TmpVec1
call __MovStr
; LN:4034 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:4035 GOSUB SymSrch
call SymSrch
; LN:4036 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl604
; LN:4037 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:4038 GOTO MainLoop
jmp MainLoop
; LN:4039 ENDIF
_Lbl604:
; LN:4040 IF SymTable(SymNdx).DataType<>TYPE THEN
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,12
cmp eax,edx
setne bl
or bh,bl
je _Lbl605
; LN:4041 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4042 GOTO MainLoop
jmp MainLoop
; LN:4043 ENDIF
_Lbl605:
; LN:4044 TypeNdx=SymNdx
mov eax, dword [SymNdx]
mov [TypeNdx],eax
; LN:4045 SymTemp.SymName=TempStr
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:4046 TypeVars=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TypeVars],eax
; LN:4047 SymTemp.DataType=COMPLEX
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,14
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4048 SymTemp.Detail=TypeNdx
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax, dword [TypeNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4049 SymTemp.DataAddr=SymTable(SymNdx).DataSize
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4050 SymTemp.DataSize=SymTemp.DataAddr
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov esi,SymTemp+36
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4051 SymTemp.SymName=TableName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TableName
call __MovStr
; LN:4052 END SELECT
jmp _Lbl592
_Lbl603:
_Lbl592:
; LN:4053 SymTemp.DataMod=ArrayBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4054 SymNdx=SymNdxSaf
mov eax, dword [SymNdxSaf]
mov [SymNdx],eax
; LN:4055 GOSUB SymInsert
call SymInsert
; LN:4056 ErrMain
; LN:4056 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4057 TblDataType=SymTemp.DataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TblDataType],ax
; LN:4058 TDataType=TblDataType' Useful only if NOT COMPLEX data type
mov ax, word [TblDataType]
mov [TDataType],ax
; LN:4059 RepeatFlag=0
mov byte [RepeatFlag],0
TblLoop:
; LN:4061 IF RepeatFlag<>0 THEN
cmp [RepeatFlag],0
je _Lbl607
; LN:4062 DEC RepeatCnt
dec [RepeatCnt]
; LN:4063 IF RepeatCnt=0 THEN
cmp [RepeatCnt],0
jne _Lbl608
; LN:4064 RepeatFlag=0
mov byte [RepeatFlag],0
; LN:4065 GOTO TblLoop
jmp TblLoop
; LN:4066 ENDIF
_Lbl608:
; LN:4067 SrcNdx=0
mov dword [SrcNdx],0
; LN:4068 GOSUB NexToken
call NexToken
; LN:4069 ELSE
jmp _Lbl609
_Lbl607:
; LN:4070 GOSUB ReadSource
call ReadSource
; LN:4071 GOSUB NexToken
call NexToken
; LN:4072 IF TokenBuf="repeat" THEN
mov esi,_StrConst628
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl610
; LN:4073 RepeatFlag=$ff
mov byte [RepeatFlag],255
; LN:4074 GOSUB NexToken
call NexToken
; LN:4075 IF TokenBuf="until" THEN
mov esi,_StrConst629
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl611
; LN:4076 GOSUB NexToken
call NexToken
; LN:4077 RepeatCnt=VAL(TokenSaf)
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [RepeatCnt],eax
; LN:4078 RepeatCnt=RepeatCnt-ArraySize+1
mov eax, dword [RepeatCnt]
mov edx, dword [ArraySize]
sub eax,edx
mov edx,1
add eax,edx
mov dword [RepeatCnt],eax
; LN:4079 ELSE
jmp _Lbl612
_Lbl611:
; LN:4080 RepeatCnt=VAL(TokenSaf)+1
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
add eax,edx
mov dword [RepeatCnt],eax
; LN:4081 ENDIF
_Lbl612:
; LN:4082 SrcLine=SrcLineSaf
mov edi,SrcLine
mov esi,SrcLineSaf
call __MovStr
; LN:4083 GOTO TblLoop
jmp TblLoop
; LN:4084 ELSE
jmp _Lbl613
_Lbl610:
; LN:4085 SrcLineSaf=SrcLine
mov edi,SrcLineSaf
mov esi,SrcLine
call __MovStr
; LN:4086 ENDIF
_Lbl613:
; LN:4087 ENDIF
_Lbl609:
; LN:4088 IF InpFilPtr=1 THEN
cmp [InpFilPtr],1
jne _Lbl614
; LN:4089 INC BasicLineCtr
inc [BasicLineCtr]
; LN:4090 ENDIF
_Lbl614:
; LN:4091 IF TempInt=0 THEN
cmp [TempInt],0
jne _Lbl615
; LN:4092 PRINT "Fatal Error: EOF in TABLE"
mov esi,_StrConst630
mov [_TmpVec1],esi
mov [_TmpVec1+4],26
mov [_TmpVec1+8],0
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
jne _OELbl35
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl35:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4093 END
xor eax,eax
invoke ExitProcess, eax
; LN:4094 ENDIF
_Lbl615:
; LN:4095 'GOSUB NexToken
; LN:4096 TDataAddr=SymTemp.DataAddr		
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataAddr],eax
; LN:4097 IF TokenBuf="end" OR TokenBuf="endtable" THEN
mov esi,_StrConst631
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst632
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl616
; LN:4098 IF TokenBuf="end" THEN
mov esi,_StrConst633
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl617
; LN:4099 GOSUB  NexToken
call NexToken
; LN:4100 IF TokenBuf<>"table" THEN
mov esi,_StrConst634
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl618
; LN:4101 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4102 GOTO MainLoop
jmp MainLoop
; LN:4103 ENDIF
_Lbl618:
; LN:4104 ENDIF
_Lbl617:
; LN:4105 SymTable(SymNdxSaf).DataSize=ArraySize*TDataAddr
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdxSaf]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [ArraySize]
mov edx, dword [TDataAddr]
imul edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4106 OutBuf="; End of table"
mov edi,[OutBuf]
mov esi,_StrConst635
call __SetStrConst
; LN:4107 GOSUB OutInitData
call OutInitData
; LN:4108 OutBuf=""
mov [OutBuf+12],0
; LN:4109 GOSUB OutInitData
call OutInitData
; LN:4110 GOTO MainLoop
jmp MainLoop
; LN:4111 ENDIF
_Lbl616:
; LN:4112 INC ArraySize
inc [ArraySize]
; LN:4113 IF TblDataType=COMPLEX THEN
cmp [TblDataType],14
jne _Lbl619
; LN:4114 GOSUB UnDoToken
call UnDoToken
; LN:4115 FOR I=1 TO TypeVars
mov [I],1
mov eax,[TypeVars]
mov [_LopVec4],eax
_Lbl620:
mov eax,[I]
cmp eax,[_LopVec4]
jg _Lbl622
; LN:4116 GOSUB NexToken
call NexToken
; LN:4117 IF TokenBuf="," THEN
mov esi,_StrConst636
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl623
; LN:4118 GOSUB NexToken
call NexToken
; LN:4119 IF TokenBuf="," THEN
mov esi,_StrConst637
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl624
; LN:4120 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4121 GOTO MainLoop
jmp MainLoop
; LN:4122 ENDIF
_Lbl624:
; LN:4123 ENDIF
_Lbl623:
; LN:4124 TDataType=SymTable(TypeNdx+I).DataType
mov eax, dword [TypeNdx]
mov edx, dword [I]
add eax,edx
mov [_Tmp1],eax
mov esi,SymTable-(1*60)+28
mov eax, dword [_Tmp1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:4125 IF TDataType=STRINGVAR THEN
cmp [TDataType],6
jne _Lbl625
; LN:4126 StringLength=SymTable(TypeNdx+I).Detail
mov eax, dword [TypeNdx]
mov edx, dword [I]
add eax,edx
mov [_Tmp1],eax
mov esi,SymTable-(1*60)+32
mov eax, dword [_Tmp1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [StringLength],eax
; LN:4127 ENDIF
_Lbl625:
; LN:4128 GOSUB MakeTableEntry	
call MakeTableEntry
; LN:4129 NEXT I
_Lbl621:
inc [I]
jmp _Lbl620
_Lbl622:
; LN:4130 ELSE
jmp _Lbl626
_Lbl619:
; LN:4131 GOSUB MakeTableEntry
call MakeTableEntry
; LN:4132 ErrMain
; LN:4132 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4133 ENDIF
_Lbl626:
; LN:4134 GOTO TblLoop
jmp TblLoop
MakeTableEntry:
; LN:4137 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:4138 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl629
; LN:4139 IF TokenBuf="true" THEN
mov esi,_StrConst638
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl630
; LN:4140 OutBuf="db 1"
mov edi,[OutBuf]
mov esi,_StrConst639
call __SetStrConst
; LN:4141 ELSE
jmp _Lbl631
_Lbl630:
; LN:4142 IF TokenBuf="false" THEN
mov esi,_StrConst640
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl632
; LN:4143 OutBuf="db 0"
mov edi,[OutBuf]
mov esi,_StrConst641
call __SetStrConst
; LN:4144 ELSE
jmp _Lbl633
_Lbl632:
; LN:4145 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4146 RETURN
ret
; LN:4147 ENDIF
_Lbl633:
; LN:4148 ENDIF	
_Lbl631:
; LN:4149 CASE BYTEVAR
jmp _Lbl628
_Lbl629:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl634
; LN:4150 GOSUB ChkConst
call ChkConst
; LN:4151 IF IVAL(TokenSaf)>255 THEN
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,255
cmp eax,edx
setg bl
or bh,bl
je _Lbl635
; LN:4152 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4153 RETURN
ret
; LN:4154 ENDIF
_Lbl635:
; LN:4155 GOSUB TblInt
call TblInt
; LN:4156 ErrMain
; LN:4156 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4157 OutBuf="db "+TempStr
mov esi,_StrConst642
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4158 CASE WORDVAR
jmp _Lbl628
_Lbl634:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl637
; LN:4159 GOSUB ChkConst
call ChkConst
; LN:4160 IF IVAL(TokenSaf)>65535 THEN
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,65535
cmp eax,edx
setg bl
or bh,bl
je _Lbl638
; LN:4161 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4162 RETURN
ret
; LN:4163 ENDIF
_Lbl638:
; LN:4164 GOSUB TblInt
call TblInt
; LN:4165 ErrMain
; LN:4165 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4166 OutBuf="dw "+TempStr
mov esi,_StrConst643
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4167 CASE LABELPTR
jmp _Lbl628
_Lbl637:
mov eax,16
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl640
; LN:4168 GOSUB UnDoToken
call UnDoToken
; LN:4169 GOSUB ChkLabel
call ChkLabel
; LN:4170 ErrMain
; LN:4170 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4171 OutBuf="dd "+TempStr
mov esi,_StrConst644
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4172 CASE LONGVAR
jmp _Lbl628
_Lbl640:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl642
; LN:4173 GOSUB ChkConst
call ChkConst
; LN:4174 IF IVAL(TokenSaf)>$7fffffff THEN
mov esi,[TokenSaf]
call __AtoL
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2147483647
cmp eax,edx
setg bl
or bh,bl
je _Lbl643
; LN:4175 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4176 RETURN
ret
; LN:4177 ENDIF
_Lbl643:
; LN:4178 GOSUB TblInt
call TblInt
; LN:4179 ErrMain
; LN:4179 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4180 OutBuf="dd "+TempStr
mov esi,_StrConst645
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4181 CASE FLOATVAR
jmp _Lbl628
_Lbl642:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl645
; LN:4182 '
; LN:4183 CASE STRINGVAR
jmp _Lbl628
_Lbl645:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl646
; LN:4184 IF TokenType<>TTypQuote THEN
cmp [TokenType],4
je _Lbl647
; LN:4185 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4186 RETURN	
ret
; LN:4187 ENDIF
_Lbl647:
; LN:4188 IF LEN(TokenSaf)-1>StringLength THEN
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
sub eax,edx
mov [_Tmp2],eax
xor bh,bh
mov eax, dword [_Tmp2]
mov edx, dword [StringLength]
cmp eax,edx
setg bl
or bh,bl
je _Lbl648
; LN:4189 PRINT SrcLine
mov esi,SrcLine
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl36
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl36:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4190 PRINT "Fatal Error: Oversize string in table" 
mov esi,_StrConst646
mov [_TmpVec1],esi
mov [_TmpVec1+4],38
mov [_TmpVec1+8],0
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
jne _OELbl37
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl37:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4191 END
xor eax,eax
invoke ExitProcess, eax
; LN:4192 ENDIF
_Lbl648:
; LN:4193 IF LEN(TokenSaf)>2 THEN
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
setg bl
or bh,bl
je _Lbl649
; LN:4194 OutBuf="db "+TokenSaf+",0"
mov esi,_StrConst647
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst648
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4195 ELSE
jmp _Lbl650
_Lbl649:
; LN:4196 OutBuf="db 0"
mov edi,[OutBuf]
mov esi,_StrConst649
call __SetStrConst
; LN:4197 ENDIF
_Lbl650:
; LN:4198 FOR Ctr1=1 TO StringLength-LEN(TokenSaf)+1
mov [Ctr1],1
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [StringLength]
mov edx, dword [_Tmp1]
sub eax,edx
mov edx,1
add eax,edx
mov [_LopVec3],eax
_Lbl651:
mov eax,[Ctr1]
cmp eax,[_LopVec3]
jg _Lbl653
; LN:4199 OutBuf=OutBuf+",0"
mov edi,[OutBuf]
mov [_TmpVec1],edi
mov edi,[OutBuf+4]
mov [_TmpVec1+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst650
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4200 NEXT Ctr1
_Lbl652:
inc [Ctr1]
jmp _Lbl651
_Lbl653:
; LN:4201 END SELECT
jmp _Lbl628
_Lbl646:
_Lbl628:
; LN:4202 GOSUB OutInitData
call OutInitData
; LN:4203 RETURN
ret
ChkConst:
; LN:4206 IF TokenType=TTypInt THEN
cmp [TokenType],6
jne _Lbl654
; LN:4207 RETURN
ret
; LN:4208 ENDIF
_Lbl654:
; LN:4209 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:4210 GOSUB SymSrch
call SymSrch
; LN:4211 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl655
; LN:4212 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:4213 RETURN
ret
; LN:4214 ENDIF
_Lbl655:
; LN:4215 TokenSaf=STR$(SymTable(SymNdx).Detail)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
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
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:4216 TokenBuf=TokenSaf
mov edi,TokenBuf
mov esi,TokenSaf
call __MovStr
; LN:4217 TokenType=TTypInt
mov byte [TokenType],6
; LN:4218 RETURN
ret
TblInt:
; LN:4221 IF TokenType=TTypInt THEN
cmp [TokenType],6
jne _Lbl656
; LN:4222 GOSUB ValidInt
call ValidInt
; LN:4223 IF IntOK=0 THEN
cmp [IntOK],0
jne _Lbl657
; LN:4224 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:4225 RETURN
ret
; LN:4226 ENDIF
_Lbl657:
; LN:4227 TempStr=TokenSaf
mov edi,TempStr
mov esi,TokenSaf
call __MovStr
; LN:4228 ENDIF
_Lbl656:
; LN:4229 RETURN
ret
EndTableX:
; LN:4232 Print "Fatal Error: EndTable while not in table"
mov esi,_StrConst651
mov [_TmpVec1],esi
mov [_TmpVec1+4],41
mov [_TmpVec1+8],0
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
jne _OELbl38
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl38:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4233 END
xor eax,eax
invoke ExitProcess, eax
; LN:4234 GOTO MainLoop
jmp MainLoop
IncludeX:
; LN:4237 UseFilNam=""
mov [UseFilNam+12],0
UseLoop:
; LN:4239 GOSUB NexToken
call NexToken
; LN:4240 IF TokenLen=0 THEN Include1
cmp [TokenLen],0
je Include1
; LN:4241 UseFilNam=UseFilNam+TokenSaf
mov edi,[UseFilNam]
mov [_TmpVec1],edi
mov edi,[UseFilNam+4]
mov [_TmpVec1+4],edi
mov edi,[UseFilNam+8]
mov [_TmpVec1+8],edi
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,UseFilNam
mov esi,_TmpVec1
call __MovStr
; LN:4242 GOTO UseLoop
jmp UseLoop
Include1:
; LN:4244 ON ERROR GOTO NoUseFile
mov [_ErrVec],NoUseFile
; LN:4245 INC InpFilPtr
inc [InpFilPtr]
; LN:4246 IF InpFilPtr>20 THEN
cmp [InpFilPtr],20
jle _Lbl659
; LN:4247 PRINT "FATAL ERROR Use Stack OverFlow"
mov esi,_StrConst652
mov [_TmpVec1],esi
mov [_TmpVec1+4],31
mov [_TmpVec1+8],0
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
jne _OELbl39
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl39:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4248 END
xor eax,eax
invoke ExitProcess, eax
; LN:4249 ENDIF
_Lbl659:
; LN:4250 OPEN #InpFile(InpFilPtr),UseFilNam:READ
mov esi,InpFile-(1*4)
mov eax, dword [InpFilPtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,_IOBuffer
mov esi,UseFilNam
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov edi,[_TmpVec1]
mov [edi],eax
cmp eax,-1
jg _OELbl40
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl40:
; LN:4251 ON ERROR
mov [_ErrVec],_ErrExit
; LN:4252 GOTO MainLoop
jmp MainLoop
NoUseFile:
; LN:4254 PRINT  "Cannot open file: "';UseFilNam
mov esi,_StrConst653
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
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
jne _OELbl41
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl41:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4255 END
xor eax,eax
invoke ExitProcess, eax
NoImportFile:
; LN:4258 PRINT "Cannot open Import File"
mov esi,_StrConst654
mov [_TmpVec1],esi
mov [_TmpVec1+4],24
mov [_TmpVec1+8],0
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
jne _OELbl42
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl42:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4259 END
xor eax,eax
invoke ExitProcess, eax
FreezeX:
; LN:4262 GOTO FIXDx
jmp FIXDx
CallX:
; LN:4265 GOSUB NexToken
call NexToken
; LN:4266 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:4267 FcnName=TokenSaf
mov edi,FcnName
mov esi,TokenSaf
call __MovStr
; LN:4268 GOSUB SymSrch
call SymSrch
; LN:4269 GOSUB GetSymTemp
call GetSymTemp
; LN:4270 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl660
; LN:4271 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:4272 GOTO MainLoop
jmp MainLoop
; LN:4273 ENDIF
_Lbl660:
; LN:4274 IF SymTemp.DataType<>PROC THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,11
cmp eax,edx
setne bl
or bh,bl
je _Lbl661
; LN:4275 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4276 GOTO MainLoop
jmp MainLoop
; LN:4277 ENDIF
_Lbl661:
; LN:4278 FcnDataMod=SymTable(SymNdx).DataMod
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [FcnDataMod],ax
; LN:4279 FcnSymNdx=SymNdx
mov eax, dword [SymNdx]
mov [FcnSymNdx],eax
; LN:4280 IF SymTemp.FcnArgs<>0 THEN
mov esi,SymTemp+59
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl662
; LN:4281 GOSUB PushArgs
call PushArgs
; LN:4282 ErrMain
; LN:4282 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4283 ENDIF
_Lbl662:
; LN:4284 TempInt=FcnDataMod
xor eax,eax
mov ax, word [FcnDataMod]
mov [TempInt],eax
; LN:4285 TempInt=LOR(TempInt,CalledBit)
mov eax, dword [TempInt]
mov edx,1024
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [TempInt],eax
; LN:4286 SymTable(FcnSymNdx).DataMod=TempInt
mov esi,SymTable-(1*60)+30
mov eax, dword [FcnSymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4287 OutBuf="call "+FcnName
mov esi,_StrConst655
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[FcnName]
mov [_TmpVec2],edi
mov edi,[FcnName+4]
mov [_TmpVec2+4],edi
mov edi,[FcnName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4288 GOSUB OutCodeData
call OutCodeData
; LN:4289 GOTO MainLoop
jmp MainLoop
ChDirX:
; LN:4292 GOSUB GetPthNam
call GetPthNam
; LN:4293 ErrMain
; LN:4293 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4294 OutBuf="invoke SetCurrentDirectory,[_IOBuffer]"
mov edi,[OutBuf]
mov esi,_StrConst656
call __SetStrConst
; LN:4295 GOSUB OutCodeData
call OutCodeData
; LN:4296 GOSUB SetStatus
call SetStatus
; LN:4297 GOSUB CallErrZ 
call CallErrZ
; LN:4298 GOTO MainLoop
jmp MainLoop
MkDirX:
; LN:4301 GOSUB GetPthNam
call GetPthNam
; LN:4302 ErrMain
; LN:4302 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4303 OutBuf="invoke CreateDirectory,[_IOBuffer],0"
mov edi,[OutBuf]
mov esi,_StrConst657
call __SetStrConst
; LN:4304 GOSUB OutCodeData
call OutCodeData
; LN:4305 GOSUB SetStatus
call SetStatus
; LN:4306 GOSUB CallErrZ
call CallErrZ
; LN:4307 GOTO MainLoop
jmp MainLoop
RmDirX:
; LN:4310 GOSUB GetPthNam
call GetPthNam
; LN:4311 ErrMain
; LN:4311 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4312 OutBuf="invoke RemoveDirectory,[_IOBuffer]"
mov edi,[OutBuf]
mov esi,_StrConst658
call __SetStrConst
; LN:4313 GOSUB OutCodeData
call OutCodeData
; LN:4314 GOSUB SetStatus
call SetStatus
; LN:4315 GOSUB CallErrZ
call CallErrZ
; LN:4316 GOTO MainLoop
jmp MainLoop
SetTimerX:
; LN:4319 'SetTimer
; LN:4320 GOTO MainLoop
jmp MainLoop
EndFunctionX:
; LN:4323 IF FcnFlag=0 THEN
cmp [FcnFlag],0
jne _Lbl667
; LN:4324 ErrNo=ErrEndFcn
mov dword [ErrNo],32
; LN:4325 GOTO MainLoop
jmp MainLoop
; LN:4326 ENDIF
_Lbl667:
; LN:4327 ' Put default return data here
; LN:4328 SELECT CASE TFcnDataType
xor eax,eax
mov al, byte [TFcnDataType]
mov [_SwitchInt],eax
; LN:4329 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl669
; LN:4330 OutBuf="mov [_BoolRet],0"
mov edi,[OutBuf]
mov esi,_StrConst659
call __SetStrConst
; LN:4331 CASE LONGVAR
jmp _Lbl668
_Lbl669:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl670
; LN:4332 OutBuf="mov [_LongRet],0"
mov edi,[OutBuf]
mov esi,_StrConst660
call __SetStrConst
; LN:4333 CASE STRINGVAR
jmp _Lbl668
_Lbl670:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl671
; LN:4334 OutBuf="mov edi,_NullStr"
mov edi,[OutBuf]
mov esi,_StrConst661
call __SetStrConst
; LN:4335 GOSUB OutFunction
call OutFunction
; LN:4336 OutBuf="mov [_StringRet],edi"
mov edi,[OutBuf]
mov esi,_StrConst662
call __SetStrConst
; LN:4337 GOSUB OutFunction
call OutFunction
; LN:4338 OutBuf="mov [_StringRet+4],0"
mov edi,[OutBuf]
mov esi,_StrConst663
call __SetStrConst
; LN:4339 GOSUB OutFunction
call OutFunction
; LN:4340 OutBuf="mov [_StringRet+8],0"
mov edi,[OutBuf]
mov esi,_StrConst664
call __SetStrConst
; LN:4341 CASE FLOATVAR
jmp _Lbl668
_Lbl671:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl672
; LN:4342 '
; LN:4343 END SELECT
jmp _Lbl668
_Lbl672:
_Lbl668:
; LN:4344 GOSUB OutFunction
call OutFunction
; LN:4345 OutBuf="ret"
mov edi,[OutBuf]
mov esi,_StrConst665
call __SetStrConst
; LN:4346 GOSUB OutFunction
call OutFunction
; LN:4347 FcnFlag=0
mov byte [FcnFlag],0
; LN:4348 ProcFcnFlag=0
mov byte [ProcFcnFlag],0
; LN:4349 GOTO MainLoop
jmp MainLoop
EndProcedureX:
; LN:4352 IF ProcFlag=0 THEN
cmp [ProcFlag],0
jne _Lbl673
; LN:4353 ErrNo=ErrEndProc
mov dword [ErrNo],34
; LN:4354 GOTO MainLoop
jmp MainLoop
; LN:4355 ENDIF
_Lbl673:
; LN:4356 OutBuf="ret"
mov edi,[OutBuf]
mov esi,_StrConst666
call __SetStrConst
; LN:4357 GOSUB OutFunction
call OutFunction
; LN:4358 ProcFlag=0
mov byte [ProcFlag],0
; LN:4359 ProcFcnFlag=0
mov byte [ProcFcnFlag],0
; LN:4360 GOTO MainLoop
jmp MainLoop
RandomizeX:
; LN:4363 GOSUB NexToken
call NexToken
; LN:4364 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl674
; LN:4365 GOSUB UnDoToken
call UnDoToken
; LN:4366 GOSUB GetIntOp
call GetIntOp
; LN:4367 ErrMain
; LN:4367 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4368 OutBuf=";srand(eax);"
mov edi,[OutBuf]
mov esi,_StrConst667
call __SetStrConst
; LN:4369 ELSE
jmp _Lbl676
_Lbl674:
; LN:4370 OutBuf=";srand(time(NULL)/2);"
mov edi,[OutBuf]
mov esi,_StrConst668
call __SetStrConst
; LN:4371 ENDIF
_Lbl676:
; LN:4372 GOSUB OutCodeData
call OutCodeData
; LN:4373 GOTO MainLoop
jmp MainLoop
DeclareX:
; LN:4376 GOSUB NexToken
call NexToken
; LN:4377 SymTemp.DataMod=UsrFcnBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,512
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4378 IF TokenBuf="procedure" THEN
mov esi,_StrConst669
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl677
; LN:4379 ProcFcn=0
mov byte [ProcFcn],0
; LN:4380 SymTemp.DataType=PROC
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,11
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4381 ELSE
jmp _Lbl678
_Lbl677:
; LN:4382 IF TokenBuf="function" THEN
mov esi,_StrConst670
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl679
; LN:4383 ProcFcn=$ff
mov byte [ProcFcn],255
; LN:4384 SymTemp.DataType=FCN
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,10
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4385 ELSE
jmp _Lbl680
_Lbl679:
; LN:4386 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4387 GOTO MainLoop
jmp MainLoop
; LN:4388 ENDIF
_Lbl680:
; LN:4389 ENDIF
_Lbl678:
; LN:4390 GOSUB NexToken
call NexToken
; LN:4391 IF TokenBuf="public" THEN
mov esi,_StrConst671
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl681
; LN:4392 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4393 GOTO MainLoop
jmp MainLoop
; LN:4394 ENDIF
_Lbl681:
; LN:4395 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:4396 GOSUB SymSrch
call SymSrch
; LN:4397 IF SymFound<>0 THEN
cmp [SymFound],0
je _Lbl682
; LN:4398 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:4399 GOTO MainLoop
jmp MainLoop
; LN:4400 ENDIF
_Lbl682:
; LN:4401 Ctr3=0
mov dword [Ctr3],0
; LN:4402 GOSUB NexToken
call NexToken
; LN:4403 IF TokenSaf<>"(" THEN
mov esi,_StrConst672
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl683
; LN:4404 IF ProcFcn=0 THEN
cmp [ProcFcn],0
jne _Lbl684
; LN:4405 GOTO ProcFcnDone
jmp ProcFcnDone
; LN:4406 ELSE
jmp _Lbl685
_Lbl684:
; LN:4407 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4408 GOTO MainLoop
jmp MainLoop
; LN:4409 ENDIF
_Lbl685:
; LN:4410 ENDIF
_Lbl683:
; LN:4411 NeedComma=0
mov byte [NeedComma],0
DeclareLoop:
; LN:4413 GOSUB NexToken
call NexToken
; LN:4414 IF TokenBuf=")" THEN
mov esi,_StrConst673
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl686
; LN:4415 IF ProcFcn=0 THEN
cmp [ProcFcn],0
jne _Lbl687
; LN:4416 GOTO ProcFcnDone
jmp ProcFcnDone
; LN:4417 ELSE
jmp _Lbl688
_Lbl687:
; LN:4418 GOSUB NexToken
call NexToken
; LN:4419 IF TokenBuf<>"as" THEN
mov esi,_StrConst674
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl689
; LN:4420 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4421 GOTO MainLoop
jmp MainLoop
; LN:4422 ENDIF
_Lbl689:
; LN:4423 GOSUB NexToken
call NexToken
; LN:4424 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl690
; LN:4425 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4426 GOTO MainLoop
jmp MainLoop
; LN:4427 ENDIF
_Lbl690:
; LN:4428 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:4429 CASE "boolean"
mov esi,_StrConst675
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl692
; LN:4430 SymTemp.FcnDataType=BOOLVAR
mov esi,SymTemp+58
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4431 CASE "integer"
jmp _Lbl691
_Lbl692:
mov esi,_StrConst676
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl693
; LN:4432 SymTemp.FcnDataType=LONGVAR
mov esi,SymTemp+58
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4433 CASE "string"
jmp _Lbl691
_Lbl693:
mov esi,_StrConst677
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl694
; LN:4434 SymTemp.FcnDataType=STRINGVAR
mov esi,SymTemp+58
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4435 CASE "double"
jmp _Lbl691
_Lbl694:
mov esi,_StrConst678
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl695
; LN:4436 SymTemp.FcnDataType=FLOATVAR
mov esi,SymTemp+58
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4437 CASE ELSE
jmp _Lbl691
_Lbl695:
; LN:4438 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4439 GOTO MainLoop
jmp MainLoop
; LN:4440 END SELECT
jmp _Lbl691
_Lbl696:
_Lbl691:
; LN:4441 GOTO ProcFcnDone
jmp ProcFcnDone
; LN:4442 ENDIF
_Lbl688:
; LN:4443 ELSE
jmp _Lbl697
_Lbl686:
; LN:4444 IF NeedComma<>0 THEN
cmp [NeedComma],0
je _Lbl698
; LN:4445 IF TokenSaf<>"," THEN
mov esi,_StrConst679
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl699
; LN:4446 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4447 GOTO MainLoop
jmp MainLoop
; LN:4448 ENDIF
_Lbl699:
; LN:4449 NeedComma=0
mov byte [NeedComma],0
; LN:4450 GOTO DeclareLoop
jmp DeclareLoop
; LN:4451 ELSE
jmp _Lbl700
_Lbl698:
; LN:4452 IF TokenSaf="," THEN
mov esi,_StrConst680
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl701
; LN:4453 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4454 GOTO MainLoop
jmp MainLoop
; LN:4455 ENDIF
_Lbl701:
; LN:4456 ENDIF
_Lbl700:
; LN:4457 INC Ctr3
inc [Ctr3]
; LN:4458 IF Ctr3>7 THEN
cmp [Ctr3],7
jle _Lbl702
; LN:4459 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4460 GOTO MainLoop
jmp MainLoop
; LN:4461 ENDIF
_Lbl702:
; LN:4462 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:4463 CASE "boolean"
mov esi,_StrConst681
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl704
; LN:4464 TempInt=BOOLVAR
mov dword [TempInt],1
; LN:4465 CASE "integer"
jmp _Lbl703
_Lbl704:
mov esi,_StrConst682
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl705
; LN:4466 TempInt=LONGVAR
mov dword [TempInt],4
; LN:4467 CASE "string"
jmp _Lbl703
_Lbl705:
mov esi,_StrConst683
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl706
; LN:4468 TempInt=STRINGVAR
mov dword [TempInt],6
; LN:4469 CASE "double"
jmp _Lbl703
_Lbl706:
mov esi,_StrConst684
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl707
; LN:4470 TempInt=FLOATVAR
mov dword [TempInt],5
; LN:4471 CASE ELSE
jmp _Lbl703
_Lbl707:
; LN:4472 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4473 GOTO MainLoop
jmp MainLoop
; LN:4474 END SELECT
jmp _Lbl703
_Lbl708:
_Lbl703:
; LN:4475 SELECT CASE Ctr3
mov eax, dword [Ctr3]
mov [_SwitchInt],eax
; LN:4476 CASE 1
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl710
; LN:4477 SymTemp.DataAddr=TempInt
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4478 CASE 2
jmp _Lbl709
_Lbl710:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl711
; LN:4479 SymTemp.DataSize=TempInt
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4480 CASE 3
jmp _Lbl709
_Lbl711:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl712
; LN:4481 SymTemp.ArrayDim1=TempInt
mov esi,SymTemp+44
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4482 CASE 4
jmp _Lbl709
_Lbl712:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl713
; LN:4483 SymTemp.ArrayDim2=TempInt
mov esi,SymTemp+48
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4484 CASE 5
jmp _Lbl709
_Lbl713:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl714
; LN:4485 SymTemp.ArrayDim3=TempInt
mov esi,SymTemp+52
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4486 CASE 6
jmp _Lbl709
_Lbl714:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl715
; LN:4487 SymTemp.ArrayDims=TempInt
mov esi,SymTemp+56
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4488 CASE 7
jmp _Lbl709
_Lbl715:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl716
; LN:4489 SymTemp.Misc=TempInt
mov esi,SymTemp+57
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4490 END SELECT
jmp _Lbl709
_Lbl716:
_Lbl709:
; LN:4491 NeedComma=$ff
mov byte [NeedComma],255
; LN:4492 GOTO DeclareLoop
jmp DeclareLoop
; LN:4493 ENDIF
_Lbl697:
ProcFcnDone:
; LN:4495 IF ProcFcn=$ff THEN
cmp [ProcFcn],255
jne _Lbl717
; LN:4496 IF Ctr3=0 THEN
cmp [Ctr3],0
jne _Lbl718
; LN:4497 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4498 GOTO MainLoop
jmp MainLoop
; LN:4499 ENDIF
_Lbl718:
; LN:4500 ENDIF
_Lbl717:
; LN:4501 SymTemp.FcnArgs=Ctr3
mov esi,SymTemp+59
mov [_TmpVec1],esi
mov eax, dword [Ctr3]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4502 SymTemp.Detail=LabelUnresolved
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4503 GOSUB SymInsert
call SymInsert
; LN:4504 GOTO MainLoop
jmp MainLoop
FunctionX:
; LN:4507 GOSUB FcnFlagChk
call FcnFlagChk
; LN:4508 FcnFlag=$ff
mov byte [FcnFlag],255
; LN:4509 ProcFcnFlag=$ff
mov byte [ProcFcnFlag],255
; LN:4510 GOSUB ProcFcnPrep
call ProcFcnPrep
; LN:4511 GOSUB PopArgs
call PopArgs
; LN:4512 ErrMain
; LN:4512 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4513 GOTO MainLoop
jmp MainLoop
ProcedureX:
; LN:4516 GOSUB FcnFlagChk
call FcnFlagChk
; LN:4517 ProcFlag=$ff
mov byte [ProcFlag],255
; LN:4518 ProcFcnFlag=$ff
mov byte [ProcFcnFlag],255
; LN:4519 GOSUB ProcFcnPrep
call ProcFcnPrep
; LN:4520 IF SymTemp.FcnArgs<>0 THEN
mov esi,SymTemp+59
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl720
; LN:4521 GOSUB PopArgs
call PopArgs
; LN:4522 ErrMain
; LN:4522 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4523 ENDIF
_Lbl720:
; LN:4524 ErrMain
; LN:4524 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4525 GOTO MainLoop
jmp MainLoop
FcnFlagChk:
; LN:4528 IF ProcFcnFlag<>0 THEN
cmp [ProcFcnFlag],0
je _Lbl723
; LN:4529 ErrNo=ErrFSNest
mov dword [ErrNo],30
; LN:4530 GOTO MainLoop
jmp MainLoop
; LN:4531 ENDIF
_Lbl723:
; LN:4532 RETURN
ret
ExitX:
; LN:4535 GOSUB NexToken
call NexToken
; LN:4536 IF TokenBuf="if" THEN ExitIfX
mov esi,_StrConst685
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl724
jmp ExitIfX
_Lbl724:
; LN:4537 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4538 GOTO MainLoop
jmp MainLoop
WendX:
; LN:4541 GOTO EndWhileX' Turn into ENDWHILE
jmp EndWhileX
ContinueX:
; LN:4544 GOSUB NexToken
call NexToken
; LN:4545 IF TokenBuf<>"if" THEN
mov esi,_StrConst686
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl725
; LN:4546 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4547 GOTO MainLoop
jmp MainLoop
; LN:4548 ENDIF
_Lbl725:
; LN:4549 IF ConStkPtr<1 THEN
cmp [ConStkPtr],1
jge _Lbl726
; LN:4550 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:4551 GOTO MainLoop
jmp MainLoop
; LN:4552 ENDIF
_Lbl726:
; LN:4553 TempInt=ConStk(ConStkPtr).ConType
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov dword [TempInt],eax
; LN:4554 IF TempInt<0 OR TempInt>5 THEN' Only for FOR/NEXT, LOOP/ENDLOOP, REPEAT/UNTIL/, WHILE/ENDWHILE
xor bh,bh
mov eax, dword [TempInt]
mov edx,0
cmp eax,edx
setl bl
or bh,bl
mov eax, dword [TempInt]
mov edx,5
cmp eax,edx
setg bl
or bh,bl
je _Lbl727
; LN:4555 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:4556 GOTO MainLoop
jmp MainLoop
; LN:4557 ENDIF
_Lbl727:
; LN:4558 GOSUB CmpOps
call CmpOps
; LN:4559 OutBuf="jne "+"_Lbl"+STR$(ConStk(ConStkPtr).LoopLabel)
mov esi,ConStk-(1*73)+45
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst687
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst688
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:4560 GOSUB OutCodeData
call OutCodeData
; LN:4561 GOTO MainLoop
jmp MainLoop
SelectX:
; LN:4564 IF SelectFlag<>0 THEN
cmp [SelectFlag],0
je _Lbl728
; LN:4565 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:4566 GOTO MainLoop
jmp MainLoop
; LN:4567 ENDIF
_Lbl728:
; LN:4568 SelectFlag=$ff
mov byte [SelectFlag],255
; LN:4569 GOSUB NexToken
call NexToken
; LN:4570 IF TokenBuf<>"case" THEN
mov esi,_StrConst689
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl729
; LN:4571 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4572 GOTO MainLoop
jmp MainLoop
; LN:4573 ENDIF
_Lbl729:
; LN:4574 GOSUB Expr
call Expr
; LN:4575 ErrMain
; LN:4575 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4576 IF OpClass<>STRClass AND OpClass<>INTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,2
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl731
; LN:4577 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:4578 GOTO MainLoop
jmp MainLoop
; LN:4579 ENDIF
_Lbl731:
; LN:4580 IF OpClass=INTClass AND TSymName<>"~" THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst690
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl732
; LN:4581 D0Loaded=0
mov byte [D0Loaded],0
; LN:4582 GOSUB LoadReg
call LoadReg
; LN:4583 ErrMain
; LN:4583 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4584 ENDIF
_Lbl732:
; LN:4585 SwitchClass=OpClass
mov al, byte [OpClass]
mov [SwitchClass],al
; LN:4586 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl734
; LN:4587 OutBuf="mov [_SwitchInt],eax"
mov edi,[OutBuf]
mov esi,_StrConst691
call __SetStrConst
; LN:4588 ELSE
jmp _Lbl735
_Lbl734:
; LN:4589 OutBuf="mov edi,["+TSymName+"]"
mov esi,_StrConst692
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst693
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4590 GOSUB OutCodeData
call OutCodeData
; LN:4591 OutBuf="mov [_SwitchStr],edi"
mov edi,[OutBuf]
mov esi,_StrConst694
call __SetStrConst
; LN:4592 GOSUB OutCodeData
call OutCodeData
; LN:4593 OutBuf="mov edi,["+TSymName+"+4]"
mov esi,_StrConst695
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst696
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4594 GOSUB OutCodeData
call OutCodeData
; LN:4595 OutBuf="mov [_SwitchStr+4],edi"
mov edi,[OutBuf]
mov esi,_StrConst697
call __SetStrConst
; LN:4596 GOSUB OutCodeData
call OutCodeData
; LN:4597 OutBuf="mov edi,["+TSymName+"+8]"
mov esi,_StrConst698
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst699
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4598 GOSUB OutCodeData
call OutCodeData
; LN:4599 OutBuf="mov [_SwitchStr+8],edi"
mov edi,[OutBuf]
mov esi,_StrConst700
call __SetStrConst
; LN:4600 ENDIF
_Lbl735:
; LN:4601 GOSUB OutCodeData
call OutCodeData
; LN:4602 GOSUB IncConStk
call IncConStk
; LN:4603 ErrMain
; LN:4603 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4604 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4605 ConStk(ConStkPtr).ConType=7
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,7
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4606 INC LabelNum
inc [LabelNum]
; LN:4607 ConStk(ConStkPtr).TermLabel=LabelNum	
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4608 GOTO MainLoop
jmp MainLoop
EndSelectX:
; LN:4611 IF SelectFlag=0 THEN
cmp [SelectFlag],0
jne _Lbl737
; LN:4612 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:4613 GOTO MainLoop
jmp MainLoop
; LN:4614 ENDIF
_Lbl737:
; LN:4615 IF CaseFlag<>0 THEN
cmp [CaseFlag],0
je _Lbl738
; LN:4616 GOSUB EndCasex
call EndCasex
; LN:4617 CaseFlag=0
mov byte [CaseFlag],0
; LN:4618 ENDIF
_Lbl738:
; LN:4619 SelectFlag=0
mov byte [SelectFlag],0
; LN:4620 CaseElseFlag=0
mov byte [CaseElseFlag],0
; LN:4621 TempInt=7
mov dword [TempInt],7
; LN:4622 GOSUB ConStkChk
call ConStkChk
; LN:4623 ErrMain
; LN:4623 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4624 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)+":"
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst701
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst702
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:4625 GOSUB OutCodeData
call OutCodeData
; LN:4626 DEC ConStkPtr
dec [ConStkPtr]
; LN:4627 GOTO MainLoop 
jmp MainLoop
CaseX:
; LN:4630 IF SelectFlag=0 OR CaseElseFlag<>0 THEN
xor bh,bh
xor eax,eax
mov al, byte [SelectFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [CaseElseFlag]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl740
; LN:4631 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:4632 GOTO MainLoop
jmp MainLoop
; LN:4633 ENDIF
_Lbl740:
; LN:4634 IF CaseFlag<>0 THEN
cmp [CaseFlag],0
je _Lbl741
; LN:4635 GOSUB EndCasex
call EndCasex
; LN:4636 ENDIF
_Lbl741:
; LN:4637 CaseFlag=$ff
mov byte [CaseFlag],255
; LN:4638 INC LabelNum
inc [LabelNum]
; LN:4639 ConStk(ConStkPtr).ConLine=BasicLineCtr
mov esi,ConStk-(1*73)+37
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [BasicLineCtr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4640 ConStk(ConStkPtr).ConType=7
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax,7
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:4641 ConStk(ConStkPtr).ContLabel=LabelNum
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [LabelNum]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4642 GOSUB NexToken
call NexToken
; LN:4643 IF TokenBuf="else" THEN
mov esi,_StrConst703
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl742
; LN:4644 CaseElseFlag=$ff
mov byte [CaseElseFlag],255
; LN:4645 ELSE
jmp _Lbl743
_Lbl742:
; LN:4646 GOSUB UnDoToken
call UnDoToken
; LN:4647 GOSUB Expr
call Expr
; LN:4648 ErrMain
; LN:4648 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4649 IF OpClass<>STRClass AND OpClass<>INTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,2
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl745
; LN:4650 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:4651 GOTO MainLoop
jmp MainLoop
; LN:4652 ENDIF
_Lbl745:
; LN:4653 IF OpClass=INTClass AND TSymName<>"~" THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst704
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl746
; LN:4654 D0Loaded=0
mov byte [D0Loaded],0
; LN:4655 GOSUB LoadReg
call LoadReg
; LN:4656 ErrMain
; LN:4656 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4657 ENDIF
_Lbl746:
; LN:4658 IF OpClass<>SwitchClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
xor edx,edx
mov dl, byte [SwitchClass]
cmp eax,edx
setne bl
or bh,bl
je _Lbl748
; LN:4659 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4660 GOTO MainLoop
jmp MainLoop
; LN:4661 ENDIF
_Lbl748:
; LN:4662 CaseToFlag=0
mov byte [CaseToFlag],0
; LN:4663 GOSUB NexToken
call NexToken
; LN:4664 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl749
; LN:4665 IF TokenBuf="to" THEN
mov esi,_StrConst705
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl750
; LN:4666 CaseToFlag=$ff
mov byte [CaseToFlag],255
; LN:4667 ELSE
jmp _Lbl751
_Lbl750:
; LN:4668 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:4669 GOTO MainLoop
jmp MainLoop
; LN:4670 ENDIF
_Lbl751:
; LN:4671 ENDIF
_Lbl749:
; LN:4672 IF CaseToFlag=0 THEN
cmp [CaseToFlag],0
jne _Lbl752
; LN:4673 SymType="jne "
mov edi,[SymType]
mov esi,_StrConst706
call __SetStrConst
; LN:4674 GOSUB GenCase
call GenCase
; LN:4675 ELSE
jmp _Lbl753
_Lbl752:
; LN:4676 SymType="<"
mov edi,[SymType]
mov esi,_StrConst707
call __SetStrConst
; LN:4677 GOSUB GenCase
call GenCase
; LN:4678 REM Get second arg here
; LN:4679 D0Loaded=0
mov byte [D0Loaded],0
; LN:4680 GOSUB Expr
call Expr
; LN:4681 ErrMain
; LN:4681 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4682 IF OpClass<>STRClass AND OpClass<>INTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,2
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl755
; LN:4683 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:4684 GOTO MainLoop
jmp MainLoop
; LN:4685 ENDIF
_Lbl755:
; LN:4686 IF OpClass=INTClass AND TSymName<>"~" THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst708
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl756
; LN:4687 D0Loaded=0
mov byte [D0Loaded],0
; LN:4688 GOSUB LoadReg
call LoadReg
; LN:4689 ErrMain
; LN:4689 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4690 ENDIF
_Lbl756:
; LN:4691 IF OpClass<>SwitchClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
xor edx,edx
mov dl, byte [SwitchClass]
cmp eax,edx
setne bl
or bh,bl
je _Lbl758
; LN:4692 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:4693 GOTO MainLoop
jmp MainLoop
; LN:4694 ENDIF
_Lbl758:
; LN:4695 SymType=">"
mov edi,[SymType]
mov esi,_StrConst709
call __SetStrConst
; LN:4696 GOSUB GenCase 	
call GenCase
; LN:4697 ENDIF
_Lbl753:
; LN:4698 ENDIF	
_Lbl743:
; LN:4699 GOTO MainLoop
jmp MainLoop
EndCaseX:
; LN:4702 IF SelectFlag=0 OR CaseFlag=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [SelectFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [CaseFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl759
; LN:4703 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:4704 GOTO MainLoop
jmp MainLoop
; LN:4705 ENDIF
_Lbl759:
; LN:4706 CaseFlag=0
mov byte [CaseFlag],0
; LN:4707 GOSUB EndCasex
call EndCasex
; LN:4708 GOTO MainLoop
jmp MainLoop
ConstX:
; LN:4711 GOTO SETDx
jmp SETDx
SwapX:
; LN:4714 GOTO ExchangeX
jmp ExchangeX
ProgramX:
; LN:4717 StartFlag=$ff
mov byte [StartFlag],255
; LN:4718 GOTO MainLoop
jmp MainLoop
Vacant13X:
; LN:4721 GOTO MainLoop
jmp MainLoop
MakeLowerX:
; LN:4724 GOSUB Expr
call Expr
; LN:4725 IF OpClass<>STRClass THEN
cmp [OpClass],2
je _Lbl760
; LN:4726 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:4727 GOTO MainLoop
jmp MainLoop
; LN:4728 ENDIF
_Lbl760:
; LN:4729 OutBuf="mov esi,"+TSymName
mov esi,_StrConst710
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4730 GOSUB OutCodeData
call OutCodeData
; LN:4731 UseLCase=TRUE
mov byte [UseLCase],1
; LN:4732 OutBuf="call __LCase"
mov edi,[OutBuf]
mov esi,_StrConst711
call __SetStrConst
; LN:4733 GOSUB OutCodeData
call OutCodeData
; LN:4734 GOTO MainLoop
jmp MainLoop
MakeUpperX:
; LN:4737 GOSUB Expr
call Expr
; LN:4738 IF OpClass<>STRClass THEN
cmp [OpClass],2
je _Lbl761
; LN:4739 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:4740 GOTO MainLoop
jmp MainLoop
; LN:4741 ENDIF
_Lbl761:
; LN:4742 OutBuf="mov esi,"+TSymName
mov esi,_StrConst712
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4743 GOSUB OutCodeData
call OutCodeData
; LN:4744 UseUCase=TRUE
mov byte [UseUCase],1
; LN:4745 OutBuf="call __UCase"
mov edi,[OutBuf]
mov esi,_StrConst713
call __SetStrConst
; LN:4746 GOSUB OutCodeData
call OutCodeData
; LN:4747 GOTO MainLoop
jmp MainLoop
TextX:
; LN:4750 UseData=TRUE
mov byte [UseData],1
; LN:4751 GOSUB TokenSym
call TokenSym
; LN:4752 ErrMain
; LN:4752 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4753 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl763
; LN:4754 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:4755 GOTO MainLoop
jmp MainLoop
; LN:4756 ENDIF
_Lbl763:
; LN:4757 GOSUB ClrDatTyp
call ClrDatTyp
; LN:4758 TDataType=LABELVAR
mov word [TDataType],7
; LN:4759 SymTemp.DataType=LABELVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,7
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4760 GOSUB ClrSym
call ClrSym
; LN:4761 SymTemp.DataMod=DataBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,128
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:4762 SymTemp.Detail=LabelResolved
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:4763 GOSUB SymInsert
call SymInsert
; LN:4764 ErrMain
; LN:4764 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:4765 OutBuf=SymTemp.SymName+":"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst714
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:4766 GOSUB OutInitData
call OutInitData
TextLoop:
; LN:4768 GOSUB ReadSource
call ReadSource
; LN:4769 IF TempInt=0 THEN
cmp [TempInt],0
jne _Lbl765
; LN:4770 PRINT "FATAL ERROR.. EOF in Text"
mov esi,_StrConst715
mov [_TmpVec1],esi
mov [_TmpVec1+4],26
mov [_TmpVec1+8],0
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
jne _OELbl43
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl43:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4771 END
xor eax,eax
invoke ExitProcess, eax
; LN:4772 ENDIF
_Lbl765:
; LN:4773 OutBuf=" db "+CHR$(OBQUOTE)+SrcLine+CHR$(OBQUOTE)+",0"
mov eax,34
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov eax,34
mov esi,_ChrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],1
mov [_TmpVec2+8],0
mov [_ChrTmp2],al
mov esi,_StrConst716
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov edi,[SrcLine]
mov [_TmpVec4],edi
mov edi,[SrcLine+4]
mov [_TmpVec4+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst717
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:4774 GOSUB OutInitData
call OutInitData
; LN:4775 GOSUB NexToken
call NexToken
; LN:4776 IF TokenBuf="end" THEN
mov esi,_StrConst718
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl766
; LN:4777 GOSUB NexToken
call NexToken
; LN:4778 IF TokenBuf="text" THEN
mov esi,_StrConst719
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl767
; LN:4779 GOTO MainLoop
jmp MainLoop
; LN:4780 ELSE
jmp _Lbl768
_Lbl767:
; LN:4781 GOTO TextLoop
jmp TextLoop
; LN:4782 ENDIF
_Lbl768:
; LN:4783 ENDIF
_Lbl766:
; LN:4784 IF TokenBuf<>"endtext" THEN TextLoop
mov esi,_StrConst720
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl769
jmp TextLoop
_Lbl769:
; LN:4785 GOTO MainLoop
jmp MainLoop
EndTextX:
; LN:4788 Print "Fatal Error: EndText while not in Text"
mov esi,_StrConst721
mov [_TmpVec1],esi
mov [_TmpVec1+4],39
mov [_TmpVec1+8],0
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
jne _OELbl44
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl44:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4789 END
xor eax,eax
invoke ExitProcess, eax
; LN:4790 GOTO MainLoop
jmp MainLoop
EndTypeX:
; LN:4793 Print "Fatal Error: EndType while not in Type"
mov esi,_StrConst722
mov [_TmpVec1],esi
mov [_TmpVec1+4],39
mov [_TmpVec1+8],0
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
jne _OELbl45
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl45:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:4794 END
xor eax,eax
invoke ExitProcess, eax
; LN:4795 GOTO MainLoop
jmp MainLoop
Finish:
; LN:5081 GOSUB ChkUse
call ChkUse
; LN:5083 IF InpFilPtr>1 THEN
cmp [InpFilPtr],1
jle _Lbl770
; LN:5084 CLOSE #InpFile(InpFilPtr)
mov esi,InpFile-(1*4)
mov eax, dword [InpFilPtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl46
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl46:
; LN:5085 DEC InpFilPtr
dec [InpFilPtr]
; LN:5086 GOTO MainLoop
jmp MainLoop
; LN:5087 ENDIF
_Lbl770:
; LN:5088 CLOSE #InpFile(InpFilPtr)
mov esi,InpFile-(1*4)
mov eax, dword [InpFilPtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl47
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl47:
; LN:5089 IF LastStmt="data" THEN
mov esi,_StrConst723
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,LastStmt
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl771
; LN:5090 DataFlag=0
mov byte [DataFlag],0
; LN:5091 ENDIF
_Lbl771:
; LN:5092 IF LastStmt<>"end" THEN
mov esi,_StrConst724
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,LastStmt
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl772
; LN:5093 OutBuf=""
mov [OutBuf+12],0
; LN:5094 GOSUB OutCodeData
call OutCodeData
; LN:5095 OutBuf="; Automatic END statement"
mov edi,[OutBuf]
mov esi,_StrConst725
call __SetStrConst
; LN:5096 GOSUB OutCodeData
call OutCodeData
; LN:5097 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst726
call __SetStrConst
; LN:5098 GOSUB OutCodeData
call OutCodeData
; LN:5099 OutBuf="invoke ExitProcess, eax"
mov edi,[OutBuf]
mov esi,_StrConst727
call __SetStrConst
; LN:5100 GOSUB OutCodeData
call OutCodeData
; LN:5101 ENDIF
_Lbl772:
; LN:5102 OutBuf="_ErrExit:"
mov edi,[OutBuf]
mov esi,_StrConst728
call __SetStrConst
; LN:5103 GOSUB OutCode
call OutCode
; LN:5104 OutBuf="cinvoke puts,_ErrExitMsg"
mov edi,[OutBuf]
mov esi,_StrConst729
call __SetStrConst
; LN:5105 GOSUB OutCode	
call OutCode
; LN:5106 OutBuf="mov eax,[ERR]"
mov edi,[OutBuf]
mov esi,_StrConst730
call __SetStrConst
; LN:5107 GOSUB OutCodeData
call OutCodeData
; LN:5108 OutBuf="invoke ExitProcess, eax"
mov edi,[OutBuf]
mov esi,_StrConst731
call __SetStrConst
; LN:5109 GOSUB OutCodeData
call OutCodeData
; LN:5110 OutBuf="; End of Declaration Section"
mov edi,[OutBuf]
mov esi,_StrConst732
call __SetStrConst
; LN:5111 GOSUB OutDeclare
call OutDeclare
; LN:5112 CLOSE #DeclareFile
mov eax, dword [DeclareFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl48
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl48:
; LN:5113 OutBuf="; End of Initialized Data Section"
mov edi,[OutBuf]
mov esi,_StrConst733
call __SetStrConst
; LN:5114 GOSUB OutInitData
call OutInitData
; LN:5115 OutBuf=""
mov [OutBuf+12],0
; LN:5116 GOSUB OutInitData
call OutInitData
; LN:5117 OutBuf="; Start of Uninitialized Data Section"
mov edi,[OutBuf]
mov esi,_StrConst734
call __SetStrConst
; LN:5118 GOSUB OutInitData
call OutInitData
; LN:5119 OutBuf=""
mov [OutBuf+12],0
; LN:5120 GOSUB OutInitData
call OutInitData
; LN:5121 CLOSE #DataFile
mov eax, dword [DataFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl49
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl49:
; LN:5122 OutBuf="; End of Uninitialized Data Section"
mov edi,[OutBuf]
mov esi,_StrConst735
call __SetStrConst
; LN:5123 GOSUB OutDim
call OutDim
; LN:5124 CLOSE #DimFile
mov eax, dword [DimFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl50
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl50:
; LN:5125 OutBuf="; End of PreCode Section"
mov edi,[OutBuf]
mov esi,_StrConst736
call __SetStrConst
; LN:5126 GOSUB OutPreCode
call OutPreCode
; LN:5127 OutBuf=""
mov [OutBuf+12],0
; LN:5128 GOSUB OutPreCode
call OutPreCode
; LN:5129 CLOSE #PreCodeFile
mov eax, dword [PreCodeFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl51
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl51:
; LN:5130 OutBuf="; End of Code Section"
mov edi,[OutBuf]
mov esi,_StrConst737
call __SetStrConst
; LN:5131 GOSUB OutCode
call OutCode
; LN:5132 CLOSE #CodeFile
mov eax, dword [CodeFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl52
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl52:
; LN:5133 OutBuf="; End of Function Section"
mov edi,[OutBuf]
mov esi,_StrConst738
call __SetStrConst
; LN:5134 GOSUB OutFunction
call OutFunction
; LN:5135 CLOSE #FunctionFile
mov eax, dword [FunctionFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl53
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl53:
; LN:5136 OutBuf="; End of Export Section"
mov edi,[OutBuf]
mov esi,_StrConst739
call __SetStrConst
; LN:5137 GenExport
; LN:5137 WRITE #ExportFile,OutBuf
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:5137 INC AsmLineCtr
inc [AsmLineCtr]
; LN:5138 CLOSE #ExportFile
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl54
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl54:
; LN:5139 CLOSE #ResourceFile
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl55
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl55:
; LN:5140 ON ERROR GOTO NoCFile
mov [_ErrVec],NoCFile
; LN:5141 DELETE FileName+".asm"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst740
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl56
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl56:
NoCFile:
; LN:5143 ON ERROR
mov [_ErrVec],_ErrExit
; LN:5144 '******
; LN:5145 'PRINT  BasicLineCtr;" OmniBasic lines compiled to ";AsmLineCtr;" Assembler lines"
; LN:5146 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5148 TFileName=FileName+".asm"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst741
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TFileName
mov esi,_TmpVec1
call __MovStr
; LN:5149 CREATE #OutFile,TFileName:WRITE+BINARY
mov edi,_IOBuffer
mov esi,TFileName
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,CREATE_NEW,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [OutFile],eax
cmp eax,-1
jg _OELbl57
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl57:
; LN:5151 OPEN #DeclareFile,"_DeclareFile":READ+BINARY
mov esi,_StrConst742
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [DeclareFile],eax
cmp eax,-1
jg _OELbl58
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl58:
; LN:5152 FilBufSiz=FILSIZ(#DeclareFile)
mov eax, dword [DeclareFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl59
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl59:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5153 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl773
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl773:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5154 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5155 BUFREAD #DeclareFile,FilBufAdr,FilBufSiz
mov eax, dword [DeclareFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl60
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl60:
; LN:5156 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl61
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl61:
; LN:5157 CLOSE #DeclareFile
mov eax, dword [DeclareFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl62
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl62:
; LN:5158 DELETE "_DeclareFile"
mov esi,_StrConst743
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl63
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl63:
; LN:5160 OPEN #DataFile,"_DataFile":READ+BINARY
mov esi,_StrConst744
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [DataFile],eax
cmp eax,-1
jg _OELbl64
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl64:
; LN:5161 FilBufSiz=FILSIZ(#DataFile)
mov eax, dword [DataFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl65
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl65:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5162 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl774
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl774:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5163 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5164 BUFREAD #DataFile,FilBufAdr,FilBufSiz
mov eax, dword [DataFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl66
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl66:
; LN:5165 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl67
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl67:
; LN:5166 CLOSE #DataFile
mov eax, dword [DataFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl68
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl68:
; LN:5167 DELETE "_DataFile"
mov esi,_StrConst745
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl69
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl69:
; LN:5169 OPEN #DimFile,"_DimFile":READ+BINARY
mov esi,_StrConst746
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [DimFile],eax
cmp eax,-1
jg _OELbl70
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl70:
; LN:5170 FilBufSiz=FILSIZ(#DimFile)
mov eax, dword [DimFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl71
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl71:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5171 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl775
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl775:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5172 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5173 BUFREAD #DimFile,FilBufAdr,FilBufSiz
mov eax, dword [DimFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl72
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl72:
; LN:5174 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl73
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl73:
; LN:5175 CLOSE #DimFile
mov eax, dword [DimFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl74
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl74:
; LN:5176 DELETE "_DimFile"
mov esi,_StrConst747
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl75
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl75:
; LN:5178 ON ERROR GOTO NoImportFile
mov [_ErrVec],NoImportFile
; LN:5179 OPEN #ImportFile,"_ImportFile.asm":READ+BINARY
mov esi,_StrConst748
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ImportFile],eax
cmp eax,-1
jg _OELbl76
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl76:
; LN:5180 ON ERROR
mov [_ErrVec],_ErrExit
; LN:5181 FilBufSiz=FILSIZ(#ImportFile)
mov eax, dword [ImportFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl77
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl77:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5182 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl776
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl776:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5183 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5184 BUFREAD #ImportFile,FilBufAdr,FilBufSiz
mov eax, dword [ImportFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl78
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl78:
; LN:5185 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl79
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl79:
; LN:5186 CLOSE #ImportFile
mov eax, dword [ImportFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl80
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl80:
; LN:5188 OPEN #PreCodeFile,"_PreCodeFile":READ+BINARY
mov esi,_StrConst749
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [PreCodeFile],eax
cmp eax,-1
jg _OELbl81
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl81:
; LN:5189 FilBufSiz=FILSIZ(#PreCodeFile)
mov eax, dword [PreCodeFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl82
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl82:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5190 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl777
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl777:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5191 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5192 BUFREAD #PreCodeFile,FilBufAdr,FilBufSiz
mov eax, dword [PreCodeFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl83
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl83:
; LN:5193 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl84
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl84:
; LN:5194 CLOSE #PreCodeFile
mov eax, dword [PreCodeFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl85
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl85:
; LN:5195 DELETE "_PreCodeFile"
mov esi,_StrConst750
mov [_TmpVec1],esi
mov [_TmpVec1+4],13
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl86
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl86:
; LN:5197 OPEN #CodeFile,"_CodeFile":READ+BINARY
mov esi,_StrConst751
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [CodeFile],eax
cmp eax,-1
jg _OELbl87
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl87:
; LN:5198 FilBufSiz=FILSIZ(#CodeFile)
mov eax, dword [CodeFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl88
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl88:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5199 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl778
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl778:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5200 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5201 BUFREAD #CodeFile,FilBufAdr,FilBufSiz
mov eax, dword [CodeFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl89
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl89:
; LN:5202 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl90
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl90:
; LN:5203 CLOSE #CodeFile
mov eax, dword [CodeFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl91
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl91:
; LN:5204 DELETE "_CodeFile"
mov esi,_StrConst752
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl92
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl92:
; LN:5206 OPEN #FunctionFile,"_FunctionFile":READ+BINARY
mov esi,_StrConst753
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [FunctionFile],eax
cmp eax,-1
jg _OELbl93
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl93:
; LN:5207 FilBufSiz=FILSIZ(#FunctionFile)
mov eax, dword [FunctionFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl94
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl94:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5208 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl779
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl779:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5209 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5210 BUFREAD #FunctionFile,FilBufAdr,FilBufSiz
mov eax, dword [FunctionFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl95
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl95:
; LN:5211 BUFWRITE #OutFile,FilBufAdr,FilBufSiz
mov eax, dword [OutFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl96
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl96:
; LN:5212 CLOSE #FunctionFile
mov eax, dword [FunctionFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl97
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl97:
; LN:5213 DELETE "_FunctionFile"
mov esi,_StrConst754
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl98
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl98:
; LN:5215 OPEN #ExportFile,"_ExportFile":READ+BINARY
mov esi,_StrConst755
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ExportFile],eax
cmp eax,-1
jg _OELbl99
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl99:
; LN:5216 FilBufSiz=FILSIZ(#ExportFile)
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl100
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl100:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5217 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl780
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl780:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5218 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5219 BUFREAD #ExportFile,FilBufAdr,FilBufSiz
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl101
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl101:
; LN:5220 'BUFWRITE #OutFile,FilBufAdr,FilBufSiz
; LN:5221 CLOSE #ExportFile
mov eax, dword [ExportFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl102
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl102:
; LN:5222 DELETE "_ExportFile"
mov esi,_StrConst756
mov [_TmpVec1],esi
mov [_TmpVec1+4],12
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl103
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl103:
; LN:5224 OPEN #ResourceFile,"_ResourceFile":READ+BINARY
mov esi,_StrConst757
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke CreateFile,[_IOBuffer],GENERIC_WRITE+GENERIC_READ,0,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov [STATUS],eax
mov [ResourceFile],eax
cmp eax,-1
jg _OELbl104
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl104:
; LN:5225 FilBufSiz=FILSIZ(#ResourceFile)
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
invoke GetFileSize,[_IOPthNum],0
mov [STATUS],eax
cmp eax,-1
jg _OELbl105
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl105:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufSiz],eax
; LN:5226 BUFFER FileBuf=FilBufSiz
mov eax, dword [FilBufSiz]
push eax
cmp [FileBuf+4],0
je _Lbl781
invoke  VirtualFree,[FileBuf],0,MEM_RELEASE
mov [FileBuf],0
mov [FileBuf+4],0
_Lbl781:
pop eax
mov [FileBuf+4],eax
invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE
mov [FileBuf],eax
; LN:5227 FilBufAdr=BUFADR(FileBuf)
mov eax,[FileBuf]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [FilBufAdr],eax
; LN:5228 BUFREAD #ResourceFile,FilBufAdr,FilBufSiz
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
mov eax, dword [FilBufAdr]
mov [_XferAddr],eax
mov eax, dword [FilBufSiz]
mov [XferCount],eax
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
cmp eax,0
jne _OELbl106
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl106:
; LN:5229 'BUFWRITE #OutFile,FilBufAdr,FilBufSiz
; LN:5230 CLOSE #ResourceFile
mov eax, dword [ResourceFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl107
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl107:
; LN:5231 DELETE "_ResourceFile"
mov esi,_StrConst758
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl108
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl108:
; LN:5233 CLOSE #OutFile
mov eax, dword [OutFile]
mov [_IOPthNum],eax
invoke CloseHandle,[_IOPthNum]
mov [STATUS],eax
cmp eax,0
jne _OELbl109
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl109:
; LN:5234 ''end
; LN:5235 '******
; LN:5236 FOR Ctr1=1 TO LastSym
mov [Ctr1],1
mov eax,[LastSym]
mov [_LopVec3],eax
_Lbl782:
mov eax,[Ctr1]
cmp eax,[_LopVec3]
jg _Lbl784
; LN:5237 TDataType=SymTable(Ctr1).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [Ctr1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:5238 IF TDataType=LABELVAR OR TDataType=FCN OR TDataType=PROC THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,7
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,11
cmp eax,edx
sete bl
or bh,bl
je _Lbl785
; LN:5239 TDetail=SymTable(Ctr1).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [Ctr1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDetail],eax
; LN:5240 TDataMod=SymTable(Ctr1).DataMod
mov esi,SymTable-(1*60)+30
mov eax, dword [Ctr1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataMod],ax
; LN:5241 IF TDetail=LabelUnresolved THEN
cmp [TDetail],0
jne _Lbl786
; LN:5242 IF TDataType=LABELVAR THEN
cmp [TDataType],7
jne _Lbl787
; LN:5243 INC ErrCnt
inc [ErrCnt]
; LN:5244 PRINT "Label unresolved: "';SymTable(Ctr1).SymName
mov esi,_StrConst759
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
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
jne _OELbl110
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl110:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5245 PRINT SymTable(Ctr1).SymName
mov esi,SymTable-(1*60)+0
mov eax, dword [Ctr1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
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
jne _OELbl111
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl111:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5246 ELSE
jmp _Lbl788
_Lbl787:
; LN:5247 IF TDataType=FCN OR TDataType=PROC THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,11
cmp eax,edx
sete bl
or bh,bl
je _Lbl789
; LN:5248 IF LAND(TDataMod,UsrFcnBit)=UsrFcnBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,512
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,512
cmp eax,edx
sete bl
or bh,bl
je _Lbl790
; LN:5249 IF LAND(TDataMod,CalledBit)=CalledBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,1024
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,1024
cmp eax,edx
sete bl
or bh,bl
je _Lbl791
; LN:5250 INC ErrCnt
inc [ErrCnt]
; LN:5251 PRINT "Function or procedure unresolved: "';SymTable(Ctr1).SymName
mov esi,_StrConst760
mov [_TmpVec1],esi
mov [_TmpVec1+4],35
mov [_TmpVec1+8],0
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
jne _OELbl112
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl112:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5252 PRINT SymTable(Ctr1).SymName
mov esi,SymTable-(1*60)+0
mov eax, dword [Ctr1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
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
jne _OELbl113
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl113:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5253 ENDIF
_Lbl791:
; LN:5254 ENDIF
_Lbl790:
; LN:5255 ENDIF
_Lbl789:
; LN:5256 ENDIF						
_Lbl788:
; LN:5257 ENDIF
_Lbl786:
; LN:5258 ENDIF
_Lbl785:
; LN:5259 NEXT Ctr1
_Lbl783:
inc [Ctr1]
jmp _Lbl782
_Lbl784:
lbl9999:
; LN:5261 IF ConStkPtr<>0 THEN
cmp [ConStkPtr],0
je _Lbl792
; LN:5262 PRINT "Unbalanced control structure in line "';ConStk(ConStkPtr).ConLine	DEC ConStkPtr
mov esi,_StrConst761
mov [_TmpVec1],esi
mov [_TmpVec1+4],38
mov [_TmpVec1+8],0
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
jne _OELbl114
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl114:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5263 INC ErrCnt
inc [ErrCnt]
; LN:5264 GOTO lbl9999
jmp lbl9999
; LN:5265 ENDIF
_Lbl792:
; LN:5266 IF GFNdx<>1 THEN
cmp [GFNdx],1
je _Lbl793
; LN:5267 PRINT "Unbalanced conditional stack"
mov esi,_StrConst762
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
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
jne _OELbl115
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl115:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5268 INC ErrCnt
inc [ErrCnt]
; LN:5269 ENDIF
_Lbl793:
; LN:5270 IF ProcFcnFlag<>0 THEN
cmp [ProcFcnFlag],0
je _Lbl794
; LN:5271 PRINT "Procedure or function not complete"
mov esi,_StrConst763
mov [_TmpVec1],esi
mov [_TmpVec1+4],35
mov [_TmpVec1+8],0
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
jne _OELbl116
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl116:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5272 INC ErrCnt
inc [ErrCnt]
; LN:5273 ENDIF
_Lbl794:
; LN:5274 IF ErrCnt<>0 THEN
cmp [ErrCnt],0
je _Lbl795
; LN:5275 'PRINT ErrCnt;" error(s)"
; LN:5276 ELSE
jmp _Lbl796
_Lbl795:
; LN:5277 REM Do assembly here
; LN:5278 IF AsmOutFlag=0 AND NoGen=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsmOutFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [NoGen]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl797
; LN:5279 PRINT "Assemble:"
mov esi,_StrConst764
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
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
jne _OELbl117
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl117:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5280 SHELL "fasm "+TFileName+" "+FileName+".exe"
mov esi,_StrConst765
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TFileName]
mov [_TmpVec2],edi
mov edi,[TFileName+4]
mov [_TmpVec2+4],edi
mov edi,[TFileName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst766
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[FileName]
mov [_TmpVec4],edi
mov edi,[FileName+4]
mov [_TmpVec4+4],edi
mov edi,[FileName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst767
mov [_TmpVec5],esi
mov [_TmpVec5+4],5
mov [_TmpVec5+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,_IOBuffer
mov esi,_TmpVec1; Get src
call __MovStr
cinvoke system,[_IOBuffer]
; LN:5281 ENDIF
_Lbl797:
; LN:5282 ENDIF
_Lbl796:
; LN:5283 IF AsmOutFlag=0 OR NoGen<>0 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsmOutFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [NoGen]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl798
; LN:5284 DELETE FileName+".asm"
mov edi,[FileName]
mov [_TmpVec1],edi
mov edi,[FileName+4]
mov [_TmpVec1+4],edi
mov edi,[FileName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst768
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,_IOBuffer
mov esi,_TmpVec1
call __MovStr
invoke DeleteFile,[_IOBuffer]
mov [STATUS],eax
cmp eax,0
jne _OELbl118
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl118:
; LN:5285 ENDIF
_Lbl798:
; LN:5286 IF UDump=$ff THEN
cmp [UDump],255
jne _Lbl799
; LN:5287 Fmt=">>>> ^^^^^^^^^^^^^^^^^^^^^^^ >> >>>> >>>>>>>> >>>>>>>> >>>>>>>>"
mov edi,[Fmt]
mov esi,_StrConst769
call __SetStrConst
; LN:5288 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5289 PRINT "Symbol Table:"
mov esi,_StrConst770
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
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
jne _OELbl119
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl119:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5290 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5291 PRINT USING(Fmt,"Sym#","Symbol Name","DT","DM","Detail","DataAddr","DataSize","Link")
mov esi,_StrConst771
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov esi,_StrConst772
mov [_TmpVec2],esi
mov [_TmpVec2+4],12
mov [_TmpVec2+8],0
mov esi,_StrConst773
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov esi,_StrConst774
mov [_TmpVec4],esi
mov [_TmpVec4+4],3
mov [_TmpVec4+8],0
mov esi,_StrConst775
mov [_TmpVec5],esi
mov [_TmpVec5+4],7
mov [_TmpVec5+8],0
mov esi,_StrConst776
mov [_TmpVec6],esi
mov [_TmpVec6+4],9
mov [_TmpVec6+8],0
mov esi,_StrConst777
mov [_TmpVec7],esi
mov [_TmpVec7+4],9
mov [_TmpVec7+8],0
mov esi,_StrConst778
mov [_TmpVec8],esi
mov [_TmpVec8+4],5
mov [_TmpVec8+8],0
; LN:5292 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5293 FOR Ctr3=1 TO LastSym
mov [Ctr3],1
mov eax,[LastSym]
mov [_LopVec5],eax
_Lbl800:
mov eax,[Ctr3]
cmp eax,[_LopVec5]
jg _Lbl802
; LN:5294 TempStr="......................."
mov edi,[TempStr]
mov esi,_StrConst779
call __SetStrConst
; LN:5295 TSymName=SymTable(Ctr3).SymName
mov esi,SymTable-(1*60)+0
mov eax, dword [Ctr3]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __MovStr
; LN:5296 IF TSymName<>"%" THEN
mov esi,_StrConst780
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl803
; LN:5297 LEFT$(TempStr,LEN(TSymName))=TSymName
mov esi,TSymName
call __StrLen
mov [_Tmp1],eax
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp1]
mov edx,eax
mov eax,1
call __MidStr
mov edi,_TmpVec1
mov esi,TSymName
call __MovStr
; LN:5298 TDataType=SymTable(Ctr3).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [Ctr3]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:5299 TDataMod=SymTable(Ctr3).DataMod
mov esi,SymTable-(1*60)+30
mov eax, dword [Ctr3]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataMod],ax
; LN:5300 TDetail=SymTable(Ctr3).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [Ctr3]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDetail],eax
; LN:5301 TDataAddr=SymTable(Ctr3).DataAddr
mov esi,SymTable-(1*60)+36
mov eax, dword [Ctr3]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataAddr],eax
; LN:5302 TDataSize=SymTable(Ctr3).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [Ctr3]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataSize],eax
; LN:5303 PRINT USING(Fmt,ZSTR$(Ctr3),TempStr,ZHEX$(TDataType),ZHEX$(TDataMod),ZHEX$(TDetail),ZHEX$(TDataAddr),ZHEX$(TDataSize))
mov eax, dword [Ctr3]
;_ZLtoA(eax);
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
xor eax,eax
mov ax, word [TDataType]
;_ZLtoH(eax);
mov esi,_StrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
xor eax,eax
mov ax, word [TDataMod]
;_ZLtoH(eax);
mov esi,_StrTmp3
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TDetail]
;_ZLtoH(eax);
mov esi,_StrTmp4
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TDataAddr]
;_ZLtoH(eax);
mov esi,_StrTmp5
mov [_TmpVec5],esi
mov [_TmpVec5+4],32
mov [_TmpVec5+8],0
mov edi,_TmpVec5
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TDataSize]
;_ZLtoH(eax);
mov esi,_StrTmp6
mov [_TmpVec6],esi
mov [_TmpVec6+4],32
mov [_TmpVec6+8],0
mov edi,_TmpVec6
mov esi,_ConvBuf1
call __MovStr
; LN:5304 ENDIF
_Lbl803:
; LN:5305 NEXT Ctr3
_Lbl801:
inc [Ctr3]
jmp _Lbl800
_Lbl802:
; LN:5306 ENDIF
_Lbl799:
; LN:5307 IF DumpSyms=$ff THEN
cmp [DumpSyms],255
jne _Lbl804
; LN:5308 PRINT "Symbol Table:"
mov esi,_StrConst781
mov [_TmpVec1],esi
mov [_TmpVec1+4],14
mov [_TmpVec1+8],0
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
jne _OELbl120
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl120:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5309 FOR Ctr1=UserSym TO LastSym
mov [Ctr1],197
mov eax,[LastSym]
mov [_LopVec3],eax
_Lbl805:
mov eax,[Ctr1]
cmp eax,[_LopVec3]
jg _Lbl807
; LN:5310 TempStr=SymTable(Ctr1).SymName+" "
mov esi,SymTable-(1*60)+0
mov eax, dword [Ctr1]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst782
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:5311 EXITIF TempStr="%"
mov esi,_StrConst783
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempStr
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
jne _Lbl807
; LN:5312 IF POS<63 THEN
cmp [POS],63
jge _Lbl808
; LN:5313 PRINT TempStr,
mov esi,TempStr
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl121
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl121:
xor eax,eax

cmp eax,-1
jg _OELbl122
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl122:
; LN:5314 ELSE
jmp _Lbl809
_Lbl808:
; LN:5315 PRINT TempStr
mov esi,TempStr
mov edi,_PrintBuf
call __MovStr
mov esi,_PrintBuf
call __StrLen
mov edx,eax
add edx,[POS]
mov [POS],edx
invoke WriteConsole,[_OutHandle],[_PrintBuf],eax,XferCount,NULL
cmp eax,0
jne _OELbl123
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl123:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5316 ENDIF
_Lbl809:
; LN:5317 NEXT Ctr1
_Lbl806:
inc [Ctr1]
jmp _Lbl805
_Lbl807:
; LN:5318 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5319 PRINT Ctr1-UserSym';" symbols"
mov eax, dword [Ctr1]
mov edx,197
sub eax,edx
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
jne _OELbl124
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl124:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5320 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5321 ENDIF
_Lbl804:
; LN:5322 END
xor eax,eax
invoke ExitProcess, eax
NoInpFile:
; LN:5324 PRINT  "Cannot open file: "';FileName
mov esi,_StrConst784
mov [_TmpVec1],esi
mov [_TmpVec1+4],19
mov [_TmpVec1+8],0
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
jne _OELbl125
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl125:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5325 END
xor eax,eax
invoke ExitProcess, eax
Help:
; LN:5327 PRINT  "ob file [opts] {CompVar=Const}"
mov esi,_StrConst785
mov [_TmpVec1],esi
mov [_TmpVec1+4],31
mov [_TmpVec1+8],0
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
jne _OELbl126
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl126:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5328 PRINT  "Options:"
mov esi,_StrConst786
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
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
jne _OELbl127
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl127:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5329 PRINT  "    -a        Compile to assembler (.asm file)"
mov esi,_StrConst787
mov [_TmpVec1],esi
mov [_TmpVec1+4],47
mov [_TmpVec1+8],0
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
jne _OELbl128
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl128:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5330 PRINT  "    -d        Compile to DLL"
mov esi,_StrConst788
mov [_TmpVec1],esi
mov [_TmpVec1+4],29
mov [_TmpVec1+8],0
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
jne _OELbl129
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl129:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5331 PRINT  "    -e        Compile with no output but check for errors"
mov esi,_StrConst789
mov [_TmpVec1],esi
mov [_TmpVec1+4],58
mov [_TmpVec1+8],0
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
jne _OELbl130
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl130:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5332 PRINT  "    -h        Halt Compile on first error encountered"
mov esi,_StrConst790
mov [_TmpVec1],esi
mov [_TmpVec1+4],54
mov [_TmpVec1+8],0
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
jne _OELbl131
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl131:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5333 PRINT  "    -g        Compile GUI (Windows) program"
mov esi,_StrConst791
mov [_TmpVec1],esi
mov [_TmpVec1+4],44
mov [_TmpVec1+8],0
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
jne _OELbl132
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl132:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5334 PRINT  "    -s        Symbol Table Dump to stdout"
mov esi,_StrConst792
mov [_TmpVec1],esi
mov [_TmpVec1+4],42
mov [_TmpVec1+8],0
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
jne _OELbl133
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl133:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5335 PRINT  "    -u        Unabridged symbol table dump"
mov esi,_StrConst793
mov [_TmpVec1],esi
mov [_TmpVec1+4],43
mov [_TmpVec1+8],0
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
jne _OELbl134
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl134:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:5337 END
xor eax,eax
invoke ExitProcess, eax
; LN:5339 '***** Subroutine Section ******
DimVar:
; LN:5342 TDataMod=LAND(MemberBit,TypeFlag)
mov eax,16
xor edx,edx
mov dl, byte [TypeFlag]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5343 GOSUB ClrDatTyp
call ClrDatTyp
; LN:5344 VectorFlg=0
mov byte [VectorFlg],0
; LN:5345 MultiFlag=0
mov byte [MultiFlag],0
; LN:5346 DimOK=0
mov byte [DimOK],0
; LN:5347 DimFlag=$ff
mov byte [DimFlag],255
; LN:5348 TDataType=COMPVAR
mov word [TDataType],0
; LN:5349 TDataSize=1
mov dword [TDataSize],1
; LN:5350 ArraySize=1
mov dword [ArraySize],1
; LN:5351 GOSUB ClrSym
call ClrSym
; LN:5352 GOSUB TokenSym
call TokenSym
; LN:5353 ErrRet
; LN:5353 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl810
; LN:5353 RETURN
ret
; LN:5353 ENDIF
_Lbl810:
; LN:5354 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl811
; LN:5355 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:5356 RETURN
ret
; LN:5357 ENDIF
_Lbl811:
; LN:5358 IF SubCtr<>0 THEN
cmp [SubCtr],0
je _Lbl812
; LN:5359 DMArray=$ff
mov byte [DMArray],255
; LN:5360 ArraySize=SubValue(1)*SubValue(2)*SubValue(3)
mov esi,SubValue-(1*4)
mov eax,1
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SubValue-(1*4)
mov eax,2
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SubValue-(1*4)
mov eax,3
shl eax,2
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edi,[_TmpVec2]
mov edx, dword [edi]
imul edx
mov edi,[_TmpVec3]
mov edx, dword [edi]
imul edx
mov dword [ArraySize],eax
; LN:5361 IF SubCtr>1 THEN
cmp [SubCtr],1
jle _Lbl813
; LN:5362 MultiFlag=$ff
mov byte [MultiFlag],255
; LN:5363 TDataMod=LOR(TDataMod,MultiBit)
xor eax,eax
mov ax, word [TDataMod]
mov edx,8
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5364 ENDIF
_Lbl813:
; LN:5365 IF ArraySize=0 THEN
cmp [ArraySize],0
jne _Lbl814
; LN:5366 DMReDim=$ff
mov byte [DMReDim],255
; LN:5367 TDataMod=LOR(TDataMod,ReDimBit)
xor eax,eax
mov ax, word [TDataMod]
mov edx,256
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5368 ENDIF
_Lbl814:
; LN:5369 ENDIF
_Lbl812:
; LN:5370 GOSUB NexToken
call NexToken
; LN:5371 IF TokenBuf<>"as" THEN
mov esi,_StrConst794
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl815
; LN:5372 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:5373 RETURN
ret
; LN:5374 ENDIF
_Lbl815:
; LN:5375 GOSUB NexToken
call NexToken
; LN:5376 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl816
; LN:5377 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:5378 RETURN
ret
; LN:5379 ENDIF
_Lbl816:
; LN:5380 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:5381 CASE "boolean"
mov esi,_StrConst795
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl818
; LN:5382 DTBoolean=$ff
mov byte [DTBoolean],255
; LN:5383 TDataType=BOOLVAR
mov word [TDataType],1
; LN:5384 SymType=" rb "
mov edi,[SymType]
mov esi,_StrConst796
call __SetStrConst
; LN:5385 TDataSize=1
mov dword [TDataSize],1
; LN:5386 TDataAddr=1
mov dword [TDataAddr],1
; LN:5387 GOTO DimVar1
jmp DimVar1
; LN:5388 CASE "byte"
jmp _Lbl817
_Lbl818:
mov esi,_StrConst797
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl819
; LN:5389 DTByte=$ff
mov byte [DTByte],255
; LN:5390 TDataType=BYTEVAR
mov word [TDataType],2
; LN:5391 SymType=" rb "
mov edi,[SymType]
mov esi,_StrConst798
call __SetStrConst
; LN:5392 TDataSize=1
mov dword [TDataSize],1
; LN:5393 TDataAddr=1
mov dword [TDataAddr],1
; LN:5394 GOTO DimVar1
jmp DimVar1
; LN:5395 CASE "integer"
jmp _Lbl817
_Lbl819:
mov esi,_StrConst799
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl820
; LN:5396 DTShort=$ff
mov byte [DTShort],255
; LN:5397 TDataType=WORDVAR
mov word [TDataType],3
; LN:5398 SymType=" rw "
mov edi,[SymType]
mov esi,_StrConst800
call __SetStrConst
; LN:5399 TDataSize=2
mov dword [TDataSize],2
; LN:5400 TDataAddr=2
mov dword [TDataAddr],2
; LN:5401 GOTO DimVar1
jmp DimVar1
; LN:5402 CASE "long"
jmp _Lbl817
_Lbl820:
mov esi,_StrConst801
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl821
; LN:5403 DTLong=$ff
mov byte [DTLong],255
; LN:5404 TDataType=LONGVAR
mov word [TDataType],4
; LN:5405 SymType=" rd "
mov edi,[SymType]
mov esi,_StrConst802
call __SetStrConst
; LN:5406 TDataSize=4
mov dword [TDataSize],4
; LN:5407 TDataAddr=4
mov dword [TDataAddr],4
; LN:5408 GOTO DimVar1
jmp DimVar1
; LN:5409 CASE "label"
jmp _Lbl817
_Lbl821:
mov esi,_StrConst803
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl822
; LN:5410 DTLong=$ff
mov byte [DTLong],255
; LN:5411 TDataType=LABELPTR
mov word [TDataType],16
; LN:5412 SymType=" rd "
mov edi,[SymType]
mov esi,_StrConst804
call __SetStrConst
; LN:5413 TDataSize=4
mov dword [TDataSize],4
; LN:5414 TDataAddr=4
mov dword [TDataAddr],4
; LN:5415 GOTO DimVar1
jmp DimVar1
; LN:5416 CASE "double"
jmp _Lbl817
_Lbl822:
mov esi,_StrConst805
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl823
; LN:5417 DTFloat=$ff
mov byte [DTFloat],255
; LN:5418 TDataType=FLOATVAR
mov word [TDataType],5
; LN:5419 SymType=" rf "
mov edi,[SymType]
mov esi,_StrConst806
call __SetStrConst
; LN:5420 TDataSize=8
mov dword [TDataSize],8
; LN:5421 TDataAddr=8
mov dword [TDataAddr],8
; LN:5422 GOTO DimVar1
jmp DimVar1
; LN:5423 CASE "string"
jmp _Lbl817
_Lbl823:
mov esi,_StrConst807
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl824
; LN:5424 DTString=$ff
mov byte [DTString],255
; LN:5425 TDataType=STRINGVAR
mov word [TDataType],6
; LN:5426 SymType=" rb "
mov edi,[SymType]
mov esi,_StrConst808
call __SetStrConst
; LN:5427 IF NextByte<>"*" THEN
mov esi,_StrConst809
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl825
; LN:5428 TempInt=255' Default string size
mov dword [TempInt],255
; LN:5429 ELSE
jmp _Lbl826
_Lbl825:
; LN:5430 GOSUB NexToken' Eat '*'
call NexToken
; LN:5431 GOSUB NexToken
call NexToken
; LN:5432 TempStr=TokenSaf
mov edi,TempStr
mov esi,TokenSaf
call __MovStr
; LN:5433 GOSUB StrSiz
call StrSiz
; LN:5434 ErrRet
; LN:5434 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl827
; LN:5434 RETURN
ret
; LN:5434 ENDIF
_Lbl827:
; LN:5435 ENDIF
_Lbl826:
; LN:5436 SymTemp.Detail=TempInt
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5437 IF TypeFlag=0 AND DMArray=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [TypeFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl828
; LN:5438 VectorFlg=$ff
mov byte [VectorFlg],255
; LN:5439 TDataMod=LOR(TDataMod,VectorBit)
xor eax,eax
mov ax, word [TDataMod]
mov edx,32
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5440 ENDIF
_Lbl828:
; LN:5441 TDataSize=TempInt
mov eax, dword [TempInt]
mov [TDataSize],eax
; LN:5442 TDataAddr=TempInt
mov eax, dword [TempInt]
mov [TDataAddr],eax
; LN:5443 GOTO DimVar1
jmp DimVar1
; LN:5444 CASE ELSE
jmp _Lbl817
_Lbl824:
; LN:5445 TSymName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __MovStr
; LN:5446 TypePtr=SymNdx
mov eax, dword [SymNdx]
mov [TypePtr],eax
; LN:5447 SubCtrSaf=SubCtr
mov al, byte [SubCtr]
mov [SubCtrSaf],al
; LN:5448 SubValSaf=SubValue
mov edi,SubValSaf
mov esi,SubValue
mov ecx,12
_Lbl830:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl830
; LN:5449 GOSUB TokenSym1
call TokenSym1
; LN:5450 ErrRet
; LN:5450 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl831
; LN:5450 RETURN
ret
; LN:5450 ENDIF
_Lbl831:
; LN:5451 IF SymFound=0 OR SymTable(SymNdx).DataType<>TYPE THEN
xor bh,bh
xor eax,eax
mov al, byte [SymFound]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,12
cmp eax,edx
setne bl
or bh,bl
je _Lbl832
; LN:5452 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:5453 RETURN
ret
; LN:5454 ENDIF
_Lbl832:
; LN:5455 TDataSize=SymTable(SymNdx).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataSize],eax
; LN:5456 TDataAddr=SymTable(SymNdx).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataAddr],eax
; LN:5457 SymType=" rb "
mov edi,[SymType]
mov esi,_StrConst810
call __SetStrConst
; LN:5458 SymTemp.Detail=SymNdx
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5459 SymNdx=TypePtr
mov eax, dword [TypePtr]
mov [SymNdx],eax
; LN:5460 SymTemp.SymName=TSymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TSymName
call __MovStr
; LN:5461 SubCtr=SubCtrSaf
mov al, byte [SubCtrSaf]
mov [SubCtr],al
; LN:5462 SubValue=SubValSaf
mov edi,SubValue
mov esi,SubValSaf
mov ecx,12
_Lbl833:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl833
; LN:5463 TDataType=COMPLEX
mov word [TDataType],14
; LN:5464 DTComplex=$ff
mov byte [DTComplex],255
; LN:5465 END SELECT
jmp _Lbl817
_Lbl829:
_Lbl817:
DimVar1:
; LN:5467 GOSUB NexToken
call NexToken
; LN:5468 IF TokenLen=0 OR TokenBuf=";" THEN DimVar2
xor bh,bh
xor eax,eax
mov al, byte [TokenLen]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst811
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl834
jmp DimVar2
_Lbl834:
; LN:5469 IF TokenBuf="pointer" THEN
mov esi,_StrConst812
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl835
; LN:5470 IF TypeFlag=$ff OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov al, byte [TypeFlag]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl836
; LN:5471 ErrNo=ErrIVParm
mov dword [ErrNo],22
; LN:5472 RETURN
ret
; LN:5473 ENDIF
_Lbl836:
; LN:5474 DMAddr=$ff
mov byte [DMAddr],255
; LN:5475 VectorFlg=0
mov byte [VectorFlg],0
; LN:5476 SymType=" rd "
mov edi,[SymType]
mov esi,_StrConst813
call __SetStrConst
; LN:5477 DTString=0
mov byte [DTString],0
; LN:5478 DTComplex=0
mov byte [DTComplex],0
; LN:5479 TDataSize=4
mov dword [TDataSize],4
; LN:5480 TDataAddr=4
mov dword [TDataAddr],4
; LN:5481 TDataMod=LOR(TDataMod,PointerBit)
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5482 GOTO DimVar2
jmp DimVar2
; LN:5483 ENDIF
_Lbl835:
; LN:5484 IF TokenBuf="vector" THEN
mov esi,_StrConst814
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl837
; LN:5485 IF TypeFlag<>0 OR DMAddr<>0 THEN
xor bh,bh
xor eax,eax
mov al, byte [TypeFlag]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMAddr]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl838
; LN:5486 ErrNo=ErrIVParm
mov dword [ErrNo],22
; LN:5487 RETURN
ret
; LN:5488 ENDIF
_Lbl838:
; LN:5489 VectorFlg=$ff
mov byte [VectorFlg],255
; LN:5490 TDataMod=LOR(TDataMod,VectorBit)
xor eax,eax
mov ax, word [TDataMod]
mov edx,32
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5491 GOTO DimVar2
jmp DimVar2
; LN:5492 ENDIF
_Lbl837:
; LN:5493 ErrNo=ErrIVMod
mov dword [ErrNo],10
; LN:5494 RETURN
ret
DimVar2:
; LN:5497 SymTemp.DataType=TDataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor eax,eax
mov ax, word [TDataType]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:5498 IF DMArray<>0 THEN
cmp [DMArray],0
je _Lbl839
; LN:5499 TDataMod=LOR(ArrayBit,TDataMod)
mov eax,1
xor edx,edx
mov dx, word [TDataMod]
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov word [TDataMod],ax
; LN:5500 ENDIF
_Lbl839:
; LN:5501 DimOK=$ff
mov byte [DimOK],255
; LN:5502 SymTemp.DataMod=TDataMod
mov esi,SymTemp+30
mov [_TmpVec1],esi
xor eax,eax
mov ax, word [TDataMod]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:5503 SymTemp.DataSize=ArraySize*TDataSize
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax, dword [ArraySize]
mov edx, dword [TDataSize]
imul edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5504 SymTemp.DataAddr=TDataAddr
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax, dword [TDataAddr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5505 IF TDataType=STRINGVAR OR TDataType=COMPLEX THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,14
cmp eax,edx
sete bl
or bh,bl
je _Lbl840
; LN:5506 ArraySize=SymTemp.DataSize
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [ArraySize],eax
; LN:5507 ENDIF
_Lbl840:
; LN:5508 RETURN
ret
DecVar:
; LN:5511 TempStr=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:5512 IF DMAddr<>0 THEN
cmp [DMAddr],0
je _Lbl841
; LN:5513 GOSUB OutDim' Basic line as comment
call OutDim
; LN:5514 OutBuf=TempStr+" rd 1"
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst815
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:5515 GOSUB OutDim
call OutDim
; LN:5516 RETURN
ret
; LN:5517 ENDIF
_Lbl841:
; LN:5518 IF DMReDim<>0 THEN
cmp [DMReDim],0
je _Lbl842
; LN:5519 GOSUB OutInitData' Basic line as comment
call OutInitData
; LN:5520 BufName=TempStr
mov edi,BufName
mov esi,TempStr
call __MovStr
; LN:5521 GOSUB MakeBuffer
call MakeBuffer
; LN:5522 RETURN
ret
; LN:5523 ENDIF
_Lbl842:
; LN:5524 IF VectorFlg=$ff THEN
cmp [VectorFlg],255
jne _Lbl843
; LN:5525 IF TDataType=STRINGVAR AND DMArray=0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl844
; LN:5526 GOSUB OutInitData' Basic line as comment
call OutInitData
; LN:5527 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst816
call __SetStrConst
; LN:5528 GOSUB OutInitData
call OutInitData
; LN:5529 OutBuf=TempStr+" dd "+TempStr+"+12"
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst817
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov edi,[TempStr]
mov [_TmpVec3],edi
mov edi,[TempStr+4]
mov [_TmpVec3+4],edi
mov edi,[TempStr+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst818
mov [_TmpVec4],esi
mov [_TmpVec4+4],4
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:5530 GOSUB OutInitData
call OutInitData
; LN:5531 OutBuf=" dd "+STR$(TDataSize)
mov eax, dword [TDataSize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst819
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:5532 GOSUB OutInitData
call OutInitData
; LN:5533 OutBuf=" dd 0"
mov edi,[OutBuf]
mov esi,_StrConst820
call __SetStrConst
; LN:5534 GOSUB OutInitData
call OutInitData
; LN:5535 OutBuf=" rb "+STR$(ArraySize)
mov eax, dword [ArraySize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst821
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:5536 GOSUB OutInitData
call OutInitData
; LN:5537 ELSE
jmp _Lbl845
_Lbl844:
; LN:5538 GOSUB OutDim' Basic line as comment
call OutDim
; LN:5539 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst822
call __SetStrConst
; LN:5540 GOSUB OutDim
call OutDim
; LN:5541 OutBuf=TempStr+" rd 3"
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst823
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:5542 GOSUB OutDim
call OutDim
; LN:5543 ENDIF
_Lbl845:
; LN:5544 RETURN
ret
; LN:5545 ENDIF
_Lbl843:
; LN:5546 IF TDataType=STRINGVAR THEN' String array case
cmp [TDataType],6
jne _Lbl846
; LN:5547 GOSUB OutDim' Basic line as comment
call OutDim
; LN:5548 OutBuf=TempStr+" rb "+STR$(ArraySize)
mov eax, dword [ArraySize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst824
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:5549 GOSUB OutDim
call OutDim
; LN:5550 RETURN
ret
; LN:5551 ENDIF
_Lbl846:
; LN:5552 GOSUB OutDim' Basic line as comment
call OutDim
; LN:5553 IF DMArray<>0 OR TDataType=COMPLEX THEN
xor bh,bh
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,14
cmp eax,edx
sete bl
or bh,bl
je _Lbl847
; LN:5554 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst825
call __SetStrConst
; LN:5555 GOSUB OutDim
call OutDim
; LN:5556 TempStr=TempStr+SymType+STR$(ArraySize)
mov eax, dword [ArraySize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov edi,[SymType]
mov [_TmpVec3],edi
mov edi,[SymType+4]
mov [_TmpVec3+4],edi
mov edi,[SymType+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:5557 ELSE
jmp _Lbl848
_Lbl847:
; LN:5558 IF TDataSize=2 THEN
cmp [TDataSize],2
jne _Lbl849
; LN:5559 OutBuf="align 2"
mov edi,[OutBuf]
mov esi,_StrConst826
call __SetStrConst
; LN:5560 GOSUB OutDim
call OutDim
; LN:5561 ELSE
jmp _Lbl850
_Lbl849:
; LN:5562 IF TDataSize=4 OR TDataSize=8 THEN
xor bh,bh
mov eax, dword [TDataSize]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [TDataSize]
mov edx,8
cmp eax,edx
sete bl
or bh,bl
je _Lbl851
; LN:5563 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst827
call __SetStrConst
; LN:5564 GOSUB OutDim
call OutDim
; LN:5565 ENDIF
_Lbl851:
; LN:5566 ENDIF
_Lbl850:
; LN:5567 TempStr=TempStr+SymType+"1"
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov edi,[SymType]
mov [_TmpVec2],edi
mov edi,[SymType+4]
mov [_TmpVec2+4],edi
mov edi,[SymType+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst828
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:5568 ENDIF
_Lbl848:
; LN:5569 OutBuf=TempStr
mov edi,OutBuf
mov esi,TempStr
call __MovStr
; LN:5570 GOSUB OutDim
call OutDim
; LN:5571 RETURN
ret
VarBlank:
; LN:5574 OutBuf=""
mov [OutBuf+12],0
; LN:5575 GOSUB OutDim
call OutDim
; LN:5576 RETURN
ret
OutLabel:
; LN:5579 IF LabelFlag=$ff THEN
cmp [LabelFlag],255
jne _Lbl852
; LN:5580 OutBuf=SymbolSaf
mov edi,OutBuf
mov esi,SymbolSaf
call __MovStr
; LN:5581 GOSUB OutCodeData
call OutCodeData
; LN:5582 ENDIF
_Lbl852:
; LN:5583 RETURN
ret
GetExp:
; LN:5586 FloatFlag=0
mov byte [FloatFlag],0
; LN:5587 TypePtr=0
mov dword [TypePtr],0
; LN:5588 ExpEnd=0
mov byte [ExpEnd],0
; LN:5589 ExpNdx=1
mov dword [ExpNdx],1
; LN:5590 ParenCnt=0
mov byte [ParenCnt],0
; LN:5591 FcnCtr=0
mov byte [FcnCtr],0
; LN:5592 AECtr=0
mov byte [AECtr],0
; LN:5593 ExpTable(ExpNdx)=1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5594 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl853:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl853
GetExp1:
; LN:5596 IF ExpEnd=$ff THEN ExpExit
cmp [ExpEnd],255
je ExpExit
; LN:5597 IF NextByte="," AND FcnCtr=0 AND AECtr=0 THEN ExpExit
mov esi,_StrConst829
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
xor eax,eax
mov al, byte [FcnCtr]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [AECtr]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl855
jmp ExpExit
_Lbl855:
; LN:5598 IF IgnoreRightParam<>0 AND SrcNdx+1=EndNdx THEN ExpExit
xor bh,bh
xor eax,eax
mov al, byte [IgnoreRightParam]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov eax, dword [SrcNdx]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx, dword [EndNdx]
cmp eax,edx
sete bl
and bh,bl
je _Lbl856
jmp ExpExit
_Lbl856:
GetExp2:
; LN:5600 GOSUB NexToken
call NexToken
; LN:5601 IF FcnCtr<>0 AND TokenBuf="#" THEN GetExp2
xor bh,bh
xor eax,eax
mov al, byte [FcnCtr]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,_StrConst830
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
and bh,bl
je _Lbl857
jmp GetExp2
_Lbl857:
; LN:5602 IF TokenLen=0 THEN ExpExit
cmp [TokenLen],0
je ExpExit
; LN:5603 IF TokenBuf="," THEN
mov esi,_StrConst831
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl859
; LN:5604 GOSUB AddRtGrp2
call AddRtGrp2
; LN:5605 IncExpNdx
; LN:5605 INC ExpNdx
inc [ExpNdx]
; LN:5605 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5606 ExpTable(ExpNdx)=2
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5607 IncExpNdx
; LN:5607 INC ExpNdx
inc [ExpNdx]
; LN:5607 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5608 ExpTable(ExpNdx)=1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5609 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl860:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl860
; LN:5610 GOTO GetExp1
jmp GetExp1
; LN:5611 ENDIF
_Lbl859:
; LN:5612 '***********************
; LN:5613 ' Start of Pointer Stuff Here
; LN:5614 IF TokenBuf="[" THEN
mov esi,_StrConst832
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl861
; LN:5615 IncExpNdx
; LN:5615 INC ExpNdx
inc [ExpNdx]
; LN:5615 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5616 GOSUB NexToken
call NexToken
; LN:5617 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl862
; LN:5618 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5619 GOTO ExpExit
jmp ExpExit
; LN:5620 ENDIF
_Lbl862:
; LN:5621 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:5622 GOSUB SymSrch
call SymSrch
; LN:5623 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl863
; LN:5624 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:5625 GOTO ExpExit
jmp ExpExit
; LN:5626 ENDIF
_Lbl863:
; LN:5627 GOSUB GetSymTemp
call GetSymTemp
; LN:5628 IF LAND(SymTemp.DataMod,PointerBit)<>PointerBit THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
setne bl
or bh,bl
je _Lbl864
; LN:5629 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:5630 GOTO ExpExit
jmp ExpExit
; LN:5631 ENDIF
_Lbl864:
; LN:5632 IF SymTemp.DataType=FLOATVAR THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
je _Lbl865
; LN:5633 INC FloatFlag
inc [FloatFlag]
; LN:5634 ENDIF
_Lbl865:
; LN:5635 IF SymTemp.DataType=COMPLEX THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,14
cmp eax,edx
sete bl
or bh,bl
je _Lbl866
; LN:5636 ExpTable(ExpNdx)=24'  cpx begin
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,24
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5637 IncExpNdx
; LN:5637 INC ExpNdx
inc [ExpNdx]
; LN:5637 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5638 ENDIF
_Lbl866:
; LN:5639 ExpTable(ExpNdx)=26'  "["
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,26
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5640 IncExpNdx
; LN:5640 INC ExpNdx
inc [ExpNdx]
; LN:5640 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5641 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5642 LastEntry=SymTemp
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl867:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl867
; LN:5643 GOSUB NexToken
call NexToken
; LN:5644 IF TokenBuf<>"]" OR TokenLen=0 THEN
mov esi,_StrConst833
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
xor eax,eax
mov al, byte [TokenLen]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl868
; LN:5645 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:5646 GOTO ExpExit
jmp ExpExit
; LN:5647 ENDIF
_Lbl868:
; LN:5648 IncExpNdx
; LN:5648 INC ExpNdx
inc [ExpNdx]
; LN:5648 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5649 ExpTable(ExpNdx)=27'  put "]" in table
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,27
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5650 IF SymTemp.DataType<>COMPLEX THEN GetExp1
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,14
cmp eax,edx
setne bl
or bh,bl
je _Lbl869
jmp GetExp1
_Lbl869:
; LN:5651 IncExpNdx
; LN:5651 INC ExpNdx
inc [ExpNdx]
; LN:5651 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5652 IF NextByte="." THEN
mov esi,_StrConst834
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl870
; LN:5653 GOSUB NexToken'  eat "."
call NexToken
; LN:5654 ExpTable(ExpNdx)=13'  "."
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,13
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5655 GOSUB NexToken
call NexToken
; LN:5656 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl871
; LN:5657 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:5658 GOTO ExpExit
jmp ExpExit
; LN:5659 ENDIF
_Lbl871:
; LN:5660 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:5661 GOSUB SymSrch
call SymSrch
; LN:5662 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl872
; LN:5663 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:5664 GOTO ExpExit
jmp ExpExit
; LN:5665 ENDIF
_Lbl872:
; LN:5666 GOSUB GetSymTemp
call GetSymTemp
; LN:5667 IF LAND(MemberBit,SymTemp.DataMod)<>MemberBit THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,16
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,16
cmp eax,edx
setne bl
or bh,bl
je _Lbl873
; LN:5668 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:5669 GOTO ExpExit
jmp ExpExit
; LN:5670 ENDIF
_Lbl873:
; LN:5671 IF SymTemp.DataType=FLOATVAR THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
je _Lbl874
; LN:5672 INC FloatFlag
inc [FloatFlag]
; LN:5673 ENDIF
_Lbl874:
; LN:5674 IncExpNdx
; LN:5674 INC ExpNdx
inc [ExpNdx]
; LN:5674 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5675 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5676 IncExpNdx
; LN:5676 INC ExpNdx
inc [ExpNdx]
; LN:5676 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5677 ENDIF
_Lbl870:
; LN:5678 ExpTable(ExpNdx)=25'  cpx end
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,25
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5679 GOTO GetExp1
jmp GetExp1
; LN:5680 ENDIF
_Lbl861:
; LN:5681 ' End of Pointer Stuff Here
; LN:5682 '***********************
; LN:5683 IF TokenType=TTypMath THEN
cmp [TokenType],3
jne _Lbl875
; LN:5684 IncExpNdx
; LN:5684 INC ExpNdx
inc [ExpNdx]
; LN:5684 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5685 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:5686 CASE "+"
mov esi,_StrConst835
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl877
; LN:5687 GOSUB Unary
call Unary
; LN:5688 ExpTable(ExpNdx)=15
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,15
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5689 CASE"-"
jmp _Lbl876
_Lbl877:
mov esi,_StrConst836
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl878
; LN:5690 GOSUB Unary
call Unary
; LN:5691 ExpTable(ExpNdx)=16
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,16
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5692 CASE "*"
jmp _Lbl876
_Lbl878:
mov esi,_StrConst837
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl879
; LN:5693 ExpTable(ExpNdx)=17
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,17
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5694 CASE "/"
jmp _Lbl876
_Lbl879:
mov esi,_StrConst838
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl880
; LN:5695 ExpTable(ExpNdx)=18
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,18
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5696 CASE "&"
jmp _Lbl876
_Lbl880:
mov esi,_StrConst839
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl881
; LN:5697 ExpTable(ExpNdx)=146
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,146
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5698 CASE "|"
jmp _Lbl876
_Lbl881:
mov esi,_StrConst840
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl882
; LN:5699 ExpTable(ExpNdx)=147
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,147
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5700 END SELECT
jmp _Lbl876
_Lbl882:
_Lbl876:
; LN:5701 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl883:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl883
; LN:5702 GOTO GetExp1
jmp GetExp1
; LN:5703 ENDIF
_Lbl875:
; LN:5704 IF TokenBuf="(" THEN
mov esi,_StrConst841
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl884
; LN:5705 IncExpNdx
; LN:5705 INC ExpNdx
inc [ExpNdx]
; LN:5705 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5706 IF LAND(ArrayBit,LastEntry.DataMod)<>0 AND SymTemp.DataType<$10 THEN
mov esi,LastEntry+30
mov [_TmpVec1],esi
mov eax,1
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,16
cmp eax,edx
setl bl
and bh,bl
je _Lbl885
; LN:5707 ExpTable(ExpNdx)=3
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5708 INC ParenCnt
inc [ParenCnt]
; LN:5709 ParenStk(ParenCnt)=3
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:5710 INC AECtr
inc [AECtr]
; LN:5711 IncExpNdx
; LN:5711 INC ExpNdx
inc [ExpNdx]
; LN:5711 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5712 ExpTable(ExpNdx)=1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5713 GOTO GetExp3
jmp GetExp3
; LN:5714 ENDIF
_Lbl885:
; LN:5715 IF LAND(ArrayBit,LastEntry.DataMod)<>0 AND SymTemp.DataType=LABELPTR THEN
mov esi,LastEntry+30
mov [_TmpVec1],esi
mov eax,1
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,16
cmp eax,edx
sete bl
and bh,bl
je _Lbl886
; LN:5716 ExpTable(ExpNdx)=3
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5717 INC ParenCnt
inc [ParenCnt]
; LN:5718 ParenStk(ParenCnt)=3
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov eax,3
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:5719 INC AECtr
inc [AECtr]
; LN:5720 IncExpNdx
; LN:5720 INC ExpNdx
inc [ExpNdx]
; LN:5720 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5721 ExpTable(ExpNdx)=1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5722 GOTO GetExp3
jmp GetExp3
; LN:5723 ENDIF
_Lbl886:
; LN:5724 IF LastEntry.DataType=FCN THEN
mov esi,LastEntry+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
je _Lbl887
; LN:5725 ExpTable(ExpNdx)=5
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5726 INC ParenCnt
inc [ParenCnt]
; LN:5727 ParenStk(ParenCnt)=5
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:5728 INC FcnCtr
inc [FcnCtr]
; LN:5729 IncExpNdx
; LN:5729 INC ExpNdx
inc [ExpNdx]
; LN:5729 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5730 ExpTable(ExpNdx)=1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5731 GOTO GetExp3
jmp GetExp3
; LN:5732 ENDIF
_Lbl887:
; LN:5733 IF LastEntry.DataType<>9 AND ExpNdx<>1 THEN
mov esi,LastEntry+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,9
cmp eax,edx
setne bl
or bh,bl
mov eax, dword [ExpNdx]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl888
; LN:5734 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5735 GOTO ExpExit
jmp ExpExit
; LN:5736 ENDIF
_Lbl888:
; LN:5737 LevelCnt=1
mov byte [LevelCnt],1
; LN:5738 GOSUB PreScan1
call PreScan1
; LN:5739 GOSUB AddLftGrp
call AddLftGrp
; LN:5740 ExpTable(ExpNdx)=1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5741 INC ParenCnt
inc [ParenCnt]
; LN:5742 ParenStk(ParenCnt)=1
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov byte [esi],al
GetExp3:
; LN:5744 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl889:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl889
; LN:5745 GOTO GetExp1
jmp GetExp1
; LN:5746 ENDIF
_Lbl884:
; LN:5747 IF TokenBuf=")" THEN
mov esi,_StrConst842
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl890
; LN:5748 GOSUB AddRtGrp2
call AddRtGrp2
; LN:5749 IncExpNdx
; LN:5749 INC ExpNdx
inc [ExpNdx]
; LN:5749 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5750 IF ParenCnt=0 THEN
cmp [ParenCnt],0
jne _Lbl891
; LN:5751 ErrNo=ErrParen
mov dword [ErrNo],27
; LN:5752 GOTO ExpExit
jmp ExpExit
; LN:5753 ENDIF
_Lbl891:
; LN:5754 IF ParenStk(ParenCnt)=3 OR ParenStk(ParenCnt)=5 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
je _Lbl892
; LN:5755 ExpTable(ExpNdx)=2
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5756 IncExpNdx
; LN:5756 INC ExpNdx
inc [ExpNdx]
; LN:5756 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5757 ENDIF
_Lbl892:
; LN:5758 ExpTable(ExpNdx)=ParenStk(ParenCnt)+1
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov edx,1
add eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5759 IF ExpTable(ExpNdx)=4 THEN
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
je _Lbl893
; LN:5760 DEC AECtr
dec [AECtr]
; LN:5761 ENDIF
_Lbl893:
; LN:5762 IF ExpTable(ExpNdx)=6 THEN
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
je _Lbl894
; LN:5763 DEC FcnCtr
dec [FcnCtr]
; LN:5764 ENDIF
_Lbl894:
; LN:5765 DEC ParenCnt
dec [ParenCnt]
; LN:5766 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl895:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl895
; LN:5767 GOSUB AddRtGrp1
call AddRtGrp1
; LN:5768 GOTO GetExp1
jmp GetExp1
; LN:5769 ENDIF
_Lbl890:
; LN:5770 IF TokenBuf="." THEN
mov esi,_StrConst843
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl896
; LN:5771 IncExpNdx
; LN:5771 INC ExpNdx
inc [ExpNdx]
; LN:5771 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5772 ExpTable(ExpNdx)=13
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,13
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5773 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl897:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl897
; LN:5774 GOTO GetExp1
jmp GetExp1
; LN:5775 ENDIF
_Lbl896:
; LN:5776 SELECT CASE TokenType
xor eax,eax
mov al, byte [TokenType]
mov [_SwitchInt],eax
; LN:5777 CASE TTypSym
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl899
; LN:5778 IncExpNdx
; LN:5778 INC ExpNdx
inc [ExpNdx]
; LN:5778 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5779 SymTemp.SymName=TokenBuf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenBuf
call __MovStr
; LN:5780 GOSUB SymSearch
call SymSearch
; LN:5781 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl900
; LN:5782 GOSUB GetSymTemp
call GetSymTemp
; LN:5783 IF SymTemp.DataType=FCN THEN' Function found
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
je _Lbl901
; LN:5784 IF MID$(SrcLine,SrcNdx+1,2)="()" THEN
mov eax, dword [SrcNdx]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp1]
mov edx,2
call __MidStr
mov esi,_StrConst844
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl902
; LN:5785 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5786 IncExpNdx
; LN:5786 INC ExpNdx
inc [ExpNdx]
; LN:5786 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5787 INC SrcNdx
inc [SrcNdx]
; LN:5788 ExpTable(ExpNdx)=5
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5789 IncExpNdx
; LN:5789 INC ExpNdx
inc [ExpNdx]
; LN:5789 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5790 INC SrcNdx
inc [SrcNdx]
; LN:5791 ExpTable(ExpNdx)=6
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5792 NextByte=MID$(SrcLine,SrcNdx+1,1)
mov eax, dword [SrcNdx]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp1]
mov edx,1
call __MidStr
mov edi,NextByte
mov esi,_TmpVec1
call __MovStr
; LN:5793 GOTO GetExp1
jmp GetExp1
; LN:5794 ENDIF
_Lbl902:
; LN:5795 GOSUB PreScan
call PreScan
; LN:5796 GOSUB AddLftGrp
call AddLftGrp
; LN:5797 LastEntry=SymTemp
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl903:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl903
; LN:5798 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5799 GOTO GetExp1
jmp GetExp1
; LN:5800 ENDIF
_Lbl901:
; LN:5801 ENDIF
_Lbl900:
; LN:5802 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:5803 GOSUB SymSrch
call SymSrch
; LN:5804 IF ErrNo<>0 THEN ExpExit
cmp [ErrNo],0
jne ExpExit
; LN:5805 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl905
; LN:5806 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:5807 GOTO ExpExit
jmp ExpExit
; LN:5808 ENDIF
_Lbl905:
; LN:5809 GOSUB GetSymTemp
call GetSymTemp
; LN:5810 IF LAND(SymTemp.DataMod,PointerBit)=0 AND SymTemp.DataType<$10 THEN'  special test for pointer
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,16
cmp eax,edx
setl bl
and bh,bl
je _Lbl906
; LN:5811 DataTemp=SymTemp.DataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov byte [DataTemp],al
; LN:5812 IF SymTemp.DataType=FLOATVAR THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
je _Lbl907
; LN:5813 INC FloatFlag
inc [FloatFlag]
; LN:5814 ENDIF
_Lbl907:
; LN:5815 ELSE
jmp _Lbl908
_Lbl906:
; LN:5816 DataTemp=LONGVAR
mov byte [DataTemp],4
; LN:5817 ENDIF
_Lbl908:
; LN:5818 IF DataTemp>=BOOLVAR AND DataTemp<=STRINGVAR OR DataTemp=COMPLEX OR DataTemp=BUFFER THEN
xor bh,bh
xor eax,eax
mov al, byte [DataTemp]
mov edx,1
cmp eax,edx
setge bl
or bh,bl
xor eax,eax
mov al, byte [DataTemp]
mov edx,6
cmp eax,edx
setle bl
and bh,bl
xor eax,eax
mov al, byte [DataTemp]
mov edx,14
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DataTemp]
mov edx,15
cmp eax,edx
sete bl
or bh,bl
je _Lbl909
; LN:5819 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5820 IF LAND(MemberBit,SymTemp.DataMod)<>0 AND LastEntry.SymName<>"." AND SymTemp.DataType<$10 THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,16
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst845
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
and bh,bl
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,16
cmp eax,edx
setl bl
and bh,bl
je _Lbl910
; LN:5821 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5822 GOTO ExpExit
jmp ExpExit
; LN:5823 ENDIF
_Lbl910:
; LN:5824 IF TypePtr<>0 AND LastEntry.SymName="." THEN
xor bh,bh
mov eax, dword [TypePtr]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst846
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
and bh,bl
je _Lbl911
; LN:5825 IF SymNdx-TypePtr>SymTable(TypePtr).Detail OR TypePtr>SymNdx THEN
mov eax, dword [SymNdx]
mov edx, dword [TypePtr]
sub eax,edx
mov [_Tmp1],eax
mov esi,SymTable-(1*60)+32
mov eax, dword [TypePtr]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov eax, dword [_Tmp1]
mov edi,[_TmpVec1]
mov edx, dword [edi]
cmp eax,edx
setg bl
or bh,bl
mov eax, dword [TypePtr]
mov edx, dword [SymNdx]
cmp eax,edx
setg bl
or bh,bl
je _Lbl912
; LN:5826 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:5827 GOTO ExpExit
jmp ExpExit
; LN:5828 ELSE
jmp _Lbl913
_Lbl912:
; LN:5829 TypePtr=0
mov dword [TypePtr],0
; LN:5830 ENDIF
_Lbl913:
; LN:5831 ENDIF
_Lbl911:
; LN:5832 IF DataTemp=COMPLEX THEN
cmp [DataTemp],14
jne _Lbl914
; LN:5833 TempStr=NextByte
mov edi,TempStr
mov esi,NextByte
call __MovStr
; LN:5834 GOSUB PreScan
call PreScan
; LN:5835 GOSUB AddLftGrp
call AddLftGrp
; LN:5836 NextByte=TempStr
mov edi,NextByte
mov esi,TempStr
call __MovStr
; LN:5837 INC ParenCnt
inc [ParenCnt]
; LN:5838 ParenStk(ParenCnt)=24
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov eax,24
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:5839 ExpTable(ExpNdx)=24
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,24
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5840 IncExpNdx
; LN:5840 INC ExpNdx
inc [ExpNdx]
; LN:5840 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5841 TypePtr=SymTemp.Detail
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TypePtr],eax
; LN:5842 ENDIF
_Lbl914:
; LN:5843 IF DataTemp<>COMPLEX AND LAND(ArrayBit,SymTemp.DataMod)=ArrayBit AND SymTemp.DataType<$10 THEN
xor bh,bh
xor eax,eax
mov al, byte [DataTemp]
mov edx,14
cmp eax,edx
setne bl
or bh,bl
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,1
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,16
cmp eax,edx
setl bl
and bh,bl
je _Lbl915
; LN:5844 TempStr=NextByte
mov edi,TempStr
mov esi,NextByte
call __MovStr
; LN:5845 GOSUB PreScan
call PreScan
; LN:5846 GOSUB AddLftGrp
call AddLftGrp
; LN:5847 NextByte=TempStr
mov edi,NextByte
mov esi,TempStr
call __MovStr
; LN:5848 ENDIF
_Lbl915:
; LN:5849 IF DataTemp<>COMPLEX THEN
cmp [DataTemp],14
je _Lbl916
; LN:5850 GOSUB AddLftGrp
call AddLftGrp
; LN:5851 ENDIF
_Lbl916:
; LN:5852 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5853 LastEntry=SymTemp
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl917:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl917
; LN:5854 GOSUB AddRtGrp1
call AddRtGrp1
; LN:5855 GOTO GetExp1
jmp GetExp1
; LN:5856 ENDIF
_Lbl909:
; LN:5857 IF DataTemp=COMPVAR OR DataTemp=MACROVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [DataTemp]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DataTemp]
mov edx,8
cmp eax,edx
sete bl
or bh,bl
je _Lbl918
; LN:5858 Konstant=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [Konstant],eax
; LN:5859 SymTemp.SymName=STR$(Konstant)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [Konstant]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:5860 GOSUB ProcKonst
call ProcKonst
; LN:5861 IF ErrNo<>0 THEN ExpExit
cmp [ErrNo],0
jne ExpExit
; LN:5862 GOSUB AddRtGrp1
call AddRtGrp1
; LN:5863 GOTO GetExp1
jmp GetExp1
; LN:5864 ENDIF
_Lbl918:
; LN:5865 GOTO ExpExit
jmp ExpExit
; LN:5866 CASE TTypFloat
jmp _Lbl898
_Lbl899:
mov eax,10
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl920
; LN:5867 INC FloatFlag
inc [FloatFlag]
; LN:5868 IncExpNdx
; LN:5868 INC ExpNdx
inc [ExpNdx]
; LN:5868 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5869 GOSUB AddLftGrp
call AddLftGrp
; LN:5870 GOSUB ValidFlt
call ValidFlt
; LN:5871 IF FloatOK=0 THEN
cmp [FloatOK],0
jne _Lbl921
; LN:5872 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5873 GOTO ExpExit
jmp ExpExit
; LN:5874 ENDIF
_Lbl921:
; LN:5875 SymTemp.SymName=TokenBuf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenBuf
call __MovStr
; LN:5876 GOSUB SymSrch
call SymSrch
; LN:5877 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl922
; LN:5878 GOSUB ClrSym
call ClrSym
; LN:5879 SymTemp.DataType=FLOATVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:5880 SymTemp.DataSize=8
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax,8
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5881 SymTemp.DataMod=ConstBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:5882 GOSUB SymInsert
call SymInsert
; LN:5883 ErrRet
; LN:5883 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl923
; LN:5883 RETURN
ret
; LN:5883 ENDIF
_Lbl923:
; LN:5884 ENDIF
_Lbl922:
; LN:5885 GOSUB GetSymTemp
call GetSymTemp
; LN:5886 LastEntry=SymTemp
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl924:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl924
; LN:5887 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5888 GOSUB AddRtGrp1
call AddRtGrp1
; LN:5889 CASE TTypInt
jmp _Lbl898
_Lbl920:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl925
; LN:5890 IncExpNdx
; LN:5890 INC ExpNdx
inc [ExpNdx]
; LN:5890 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5891 GOSUB AddLftGrp
call AddLftGrp
; LN:5892 GOSUB ValidInt
call ValidInt
; LN:5893 IF IntOK=0 THEN
cmp [IntOK],0
jne _Lbl926
; LN:5894 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5895 GOTO ExpExit
jmp ExpExit
; LN:5896 ENDIF
_Lbl926:
; LN:5897 Konstant=VAL(TokenBuf)
mov esi,[TokenBuf]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [Konstant],eax
; LN:5898 SymTemp.SymName=Str$(Konstant)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [Konstant]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:5899 GOSUB ProcKonst
call ProcKonst
; LN:5900 IF ErrNo<>0 THEN ExpExit
cmp [ErrNo],0
jne ExpExit
; LN:5901 GOSUB AddRtGrp1
call AddRtGrp1
; LN:5902 CASE TTypHex
jmp _Lbl898
_Lbl925:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl928
; LN:5903 IncExpNdx
; LN:5903 INC ExpNdx
inc [ExpNdx]
; LN:5903 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5904 GOSUB AddLftGrp
call AddLftGrp
; LN:5905 GOSUB ValidHex
call ValidHex
; LN:5906 IF HexOK=0 THEN
cmp [HexOK],0
jne _Lbl929
; LN:5907 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5908 GOTO ExpExit
jmp ExpExit
; LN:5909 ENDIF
_Lbl929:
; LN:5910 SymTemp.SymName=TokenBuf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenBuf
call __MovStr
; LN:5911 GOSUB ProcKonst
call ProcKonst
; LN:5912 IF ErrNo<>0 THEN ExpExit
cmp [ErrNo],0
jne ExpExit
; LN:5913 GOSUB AddRtGrp1
call AddRtGrp1
; LN:5914 CASE TTypQuote
jmp _Lbl898
_Lbl928:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl931
; LN:5915 IncExpNdx
; LN:5915 INC ExpNdx
inc [ExpNdx]
; LN:5915 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5916 IF LEN(TokenSaf)=2 THEN'  null string
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl932
; LN:5917 LastEntry=SymTable(20)
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+0
mov eax,20
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl933:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl933
; LN:5918 ExpTable(ExpNdx)=20'  20 is table entry for null string
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,20
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5919 GOTO GetExp1
jmp GetExp1
; LN:5920 ENDIF
_Lbl932:
; LN:5921 GOSUB MakeStrConst
call MakeStrConst
; LN:5922 TempStr="_StrConst"+STR$(PoolCtr)
mov eax, dword [PoolCtr]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst847
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TempStr
mov esi,_TmpVec2
call __MovStr
; LN:5923 SymTemp.SymName=TempStr
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:5924 'Skip SymSrch, just point to next vacancy in symbol table
; LN:5925 SymNdx=LastSym+1
mov eax, dword [LastSym]
mov edx,1
add eax,edx
mov dword [SymNdx],eax
; LN:5926 IF SymNdx>SymTabSiz THEN
cmp [SymNdx],3000
jle _Lbl934
; LN:5927 SymFull=$ff
mov byte [SymFull],255
; LN:5928 ENDIF
_Lbl934:
; LN:5929 SymTemp.DataType=STRINGVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:5930 SymTemp.DataMod=ConstBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:5931 GOSUB ClrSym
call ClrSym
; LN:5932 SymTemp.Detail=LEN(TokenSaf)-1
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
sub eax,edx
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5933 SymTemp.DataSize=SymTemp.Detail
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov esi,SymTemp+32
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5934 GOSUB SymInsert
call SymInsert
; LN:5935 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl935
; LN:5936 GOTO ExpExit
jmp ExpExit
; LN:5937 ENDIF
_Lbl935:
; LN:5938 LastEntry=SymTemp
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl936:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl936
; LN:5939 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5940 CASE ELSE
jmp _Lbl898
_Lbl931:
; LN:5941 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5942 RETURN
ret
; LN:5943 END SELECT
jmp _Lbl898
_Lbl937:
_Lbl898:
; LN:5944 GOTO GetExp1
jmp GetExp1
ExpExit:
; LN:5946 IF ExpLen=ExpTabSiz THEN
cmp [ExpLen],300
jne _Lbl938
; LN:5947 ErrNo=ErrCpxExp
mov dword [ErrNo],24
; LN:5948 ENDIF
_Lbl938:
; LN:5949 IF ExpLen=1 THEN
cmp [ExpLen],1
jne _Lbl939
; LN:5950 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:5951 ENDIF
_Lbl939:
; LN:5952 IF ErrNo=0 THEN' Check this block of code
cmp [ErrNo],0
jne _Lbl940
; LN:5953 IF ParenCnt<>0 THEN
cmp [ParenCnt],0
je _Lbl941
; LN:5954 IF ParenStk(ParenCnt)=24 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,24
cmp eax,edx
sete bl
or bh,bl
je _Lbl942
; LN:5955 IncExpNdx
; LN:5955 INC ExpNdx
inc [ExpNdx]
; LN:5955 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5956 ExpTable(ExpNdx)=25
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,25
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5957 DEC ParenCnt
dec [ParenCnt]
; LN:5958 ENDIF
_Lbl942:
; LN:5959 ENDIF
_Lbl941:
; LN:5960 IF ParenCnt<>0 THEN
cmp [ParenCnt],0
je _Lbl943
; LN:5961 IF ParenStk(ParenCnt)=22 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,22
cmp eax,edx
sete bl
or bh,bl
je _Lbl944
; LN:5962 IncExpNdx
; LN:5962 INC ExpNdx
inc [ExpNdx]
; LN:5962 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5963 ExpTable(ExpNdx)=23
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,23
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5964 ParenCnt=0
mov byte [ParenCnt],0
; LN:5965 ENDIF
_Lbl944:
; LN:5966 ENDIF
_Lbl943:
; LN:5967 IF ParenCnt<>0 THEN
cmp [ParenCnt],0
je _Lbl945
; LN:5968 ErrNo=ErrParen
mov dword [ErrNo],27
; LN:5969 ELSE
jmp _Lbl946
_Lbl945:
; LN:5970 IncExpNdx
; LN:5970 INC ExpNdx
inc [ExpNdx]
; LN:5970 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:5971 ExpTable(ExpNdx)=2
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,2
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:5972 ENDIF
_Lbl946:
; LN:5973 ENDIF
_Lbl940:
; LN:5974 RETURN
ret
PreScan:
; LN:5977 LevelCnt=0
mov byte [LevelCnt],0
; LN:5978 GOSUB PreScan1
call PreScan1
; LN:5979 RETURN
ret
PreScan1:
; LN:5982 SrcNdxSaf=SrcNdx
mov eax, dword [SrcNdx]
mov [SrcNdxSaf],eax
; LN:5983 ExpEndSaf=ExpEnd
mov al, byte [ExpEnd]
mov [ExpEndSaf],al
PreScan2:
; LN:5985 GOSUB NexToken
call NexToken
; LN:5986 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl947
; LN:5987 NextByte="%"
mov esi,_StrConst848
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __MovStr
; LN:5988 SrcNdx=SrcNdxSaf
mov eax, dword [SrcNdxSaf]
mov [SrcNdx],eax
; LN:5989 ExpEnd=ExpEndSaf
mov al, byte [ExpEndSaf]
mov [ExpEnd],al
; LN:5990 RETURN
ret
; LN:5991 ENDIF
_Lbl947:
; LN:5992 IF TokenType=TTypMath AND LevelCnt=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [TokenType]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [LevelCnt]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl948
; LN:5993 NextByte=TokenBuf
mov edi,NextByte
mov esi,TokenBuf
call __MovStr
; LN:5994 SrcNdx=SrcNdxSaf
mov eax, dword [SrcNdxSaf]
mov [SrcNdx],eax
; LN:5995 ExpEnd=ExpEndSaf
mov al, byte [ExpEndSaf]
mov [ExpEnd],al
; LN:5996 RETURN
ret
; LN:5997 ENDIF
_Lbl948:
; LN:5998 IF TokenBuf="(" THEN
mov esi,_StrConst849
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl949
; LN:5999 INC LevelCnt
inc [LevelCnt]
; LN:6000 ENDIF
_Lbl949:
; LN:6001 IF TokenBuf=")" THEN
mov esi,_StrConst850
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl950
; LN:6002 DEC LevelCnt
dec [LevelCnt]
; LN:6003 ENDIF
_Lbl950:
; LN:6004 GOTO PreScan2
jmp PreScan2
Unary:
; LN:6007 LstExp=ExpTable(ExpNdx-1)
mov eax, dword [ExpNdx]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [LstExp],eax
; LN:6008 IF LstExp=1 OR LstExp=3 OR LstExp=5 OR LstExp=22 OR LstExp=24 THEN
xor bh,bh
mov eax, dword [LstExp]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [LstExp]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [LstExp]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [LstExp]
mov edx,22
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [LstExp]
mov edx,24
cmp eax,edx
sete bl
or bh,bl
je _Lbl951
; LN:6009 ExpTable(ExpNdx)=21' *********
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,21
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6010 IncExpNdx
; LN:6010 INC ExpNdx
inc [ExpNdx]
; LN:6010 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:6011 ENDIF
_Lbl951:
; LN:6012 RETURN
ret
AddLftGrp:
; LN:6015 IF NextByte="*" OR NextByte="/" OR NextByte="&" THEN
mov esi,_StrConst851
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst852
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst853
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl952
; LN:6016 IF LAND(MemberBit,SymTemp.DataMod)<>MemberBit THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,16
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,16
cmp eax,edx
setne bl
or bh,bl
je _Lbl953
; LN:6017 IF ParenCnt<>0 THEN
cmp [ParenCnt],0
je _Lbl954
; LN:6018 IF ParenStk(ParenCnt)=22 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,22
cmp eax,edx
sete bl
or bh,bl
je _Lbl955
; LN:6019 RETURN
ret
; LN:6020 ENDIF
_Lbl955:
; LN:6021 ENDIF
_Lbl954:
; LN:6022 INC ParenCnt
inc [ParenCnt]
; LN:6023 ParenStk(ParenCnt)=22
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
mov eax,22
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:6024 ExpTable(ExpNdx)=22
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,22
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6025 IncExpNdx
; LN:6025 INC ExpNdx
inc [ExpNdx]
; LN:6025 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:6026 ENDIF
_Lbl953:
; LN:6027 ENDIF
_Lbl952:
; LN:6028 RETURN
ret
AddRtGrp1:
; LN:6031 IF ParenCnt=0 THEN
cmp [ParenCnt],0
jne _Lbl956
; LN:6032 RETURN
ret
; LN:6033 ENDIF
_Lbl956:
; LN:6034 IF NextByte="+" OR NextByte="-" OR NextByte="*" OR NextByte="/"  OR NextByte="&" OR NextByte="|" THEN
mov esi,_StrConst854
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst855
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst856
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst857
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst858
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst859
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl957
; LN:6035 IF ParenStk(ParenCnt)=24 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,24
cmp eax,edx
sete bl
or bh,bl
je _Lbl958
; LN:6036 IncExpNdx
; LN:6036 INC ExpNdx
inc [ExpNdx]
; LN:6036 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:6037 DEC ParenCnt
dec [ParenCnt]
; LN:6038 ExpTable(ExpNdx)=25
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,25
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6039 ENDIF
_Lbl958:
; LN:6040 IF ParenCnt=0 THEN
cmp [ParenCnt],0
jne _Lbl959
; LN:6041 RETURN
ret
; LN:6042 ENDIF
_Lbl959:
; LN:6043 IF NextByte="+" OR NextByte="-"  OR NextByte="|" THEN
mov esi,_StrConst860
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst861
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst862
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl960
; LN:6044 IF ParenStk(ParenCnt)=22 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,22
cmp eax,edx
sete bl
or bh,bl
je _Lbl961
; LN:6045 IncExpNdx
; LN:6045 INC ExpNdx
inc [ExpNdx]
; LN:6045 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:6046 DEC ParenCnt
dec [ParenCnt]
; LN:6047 ExpTable(ExpNdx)=23
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,23
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6048 LastEntry=SymTable(ExpTable(ExpNdx))
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl962:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl962
; LN:6049 RETURN
ret
; LN:6050 ELSE
jmp _Lbl963
_Lbl961:
; LN:6051 RETURN
ret
; LN:6052 ENDIF
_Lbl963:
; LN:6053 ENDIF
_Lbl960:
; LN:6054 ENDIF
_Lbl957:
; LN:6055 RETURN
ret
AddRtGrp2:
; LN:6058 IF ParenStk(ParenCnt)=24 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,24
cmp eax,edx
sete bl
or bh,bl
je _Lbl964
; LN:6059 IncExpNdx
; LN:6059 INC ExpNdx
inc [ExpNdx]
; LN:6059 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:6060 DEC ParenCnt
dec [ParenCnt]
; LN:6061 ExpTable(ExpNdx)=25
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,25
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6062 ENDIF
_Lbl964:
; LN:6063 IF ParenStk(ParenCnt)=22 THEN
mov esi,ParenStk-(1*1)
xor eax,eax
mov al, byte [ParenCnt]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,22
cmp eax,edx
sete bl
or bh,bl
je _Lbl965
; LN:6064 IncExpNdx
; LN:6064 INC ExpNdx
inc [ExpNdx]
; LN:6064 ExpLen=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLen],eax
; LN:6065 DEC ParenCnt
dec [ParenCnt]
; LN:6066 ExpTable(ExpNdx)=23
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,23
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6067 ENDIF
_Lbl965:
; LN:6068 RETURN
ret
ProcKonst:
; LN:6071 GOSUB SymSrch
call SymSrch
; LN:6072 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl966
; LN:6073 GOSUB ClrSym
call ClrSym
; LN:6074 SymTemp.DataType=LONGVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6075 SymTemp.DataSize=4
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6076 SymTemp.DataMod=ConstBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6077 SymTemp.Detail=IVAL(SymTemp.SymName)
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,[_TmpVec2]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6078 GOSUB SymInsert
call SymInsert
; LN:6079 ErrRet
; LN:6079 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl967
; LN:6079 RETURN
ret
; LN:6079 ENDIF
_Lbl967:
; LN:6080 ENDIF
_Lbl966:
; LN:6081 GOSUB GetSymTemp
call GetSymTemp
; LN:6082 LastEntry=SymTemp
mov esi,LastEntry+0
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl968:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl968
; LN:6083 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6084 RETURN
ret
ProcExp:
; LN:6087 IF ExpFlag=$ff THEN
cmp [ExpFlag],255
jne _Lbl969
; LN:6088 FOR Ctr1=1 to ExpLen
mov [Ctr1],1
mov eax,[ExpLen]
mov [_LopVec3],eax
_Lbl970:
mov eax,[Ctr1]
cmp eax,[_LopVec3]
jg _Lbl972
; LN:6089 PRINT SymTable(ExpTable(Ctr1)).SymName;
mov esi,ExpTable-(1*4)
mov eax, dword [Ctr1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
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
jne _OELbl135
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl135:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:6090 NEXT Ctr1
_Lbl971:
inc [Ctr1]
jmp _Lbl970
_Lbl972:
; LN:6091 PRINT
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:6092 ENDIF
_Lbl969:
; LN:6093 LOOP
_Lbl973:
; LN:6094 LastGroup=$00
mov byte [LastGroup],0
; LN:6095 TempInt=ExpNdx
mov eax, dword [ExpNdx]
mov [TempInt],eax
; LN:6096 GOSUB ParenScan
call ParenScan
; LN:6097 ExpNdx=TempInt
mov eax, dword [TempInt]
mov [ExpNdx],eax
; LN:6098 IF ParenCnt=0 THEN
cmp [ParenCnt],0
jne _Lbl975
; LN:6099 RETURN
ret
; LN:6100 ENDIF
_Lbl975:
; LN:6101 GOSUB SolveTerm
call SolveTerm
; LN:6102 ErrRet
; LN:6102 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl976
; LN:6102 RETURN
ret
; LN:6102 ENDIF
_Lbl976:
; LN:6103 GOSUB SquishExp
call SquishExp
; LN:6104 ENDLOOP
jmp _Lbl973
_Lbl974:
ParenScan:
; LN:6107 ParenCnt=0
mov byte [ParenCnt],0
; LN:6108 ExpNdx=0
mov dword [ExpNdx],0
; LN:6109 PType=0
mov dword [PType],0
; LN:6110 ExpLeft=0
mov dword [ExpLeft],0
; LN:6111 ExpRight=0
mov dword [ExpRight],0
; LN:6112 IF ExpNdx>ExpLen THEN'???
xor bh,bh
mov eax, dword [ExpNdx]
mov edx, dword [ExpLen]
cmp eax,edx
setg bl
or bh,bl
je _Lbl977
; LN:6113 RETURN
ret
; LN:6114 ENDIF
_Lbl977:
ParenScn1:
; LN:6116 INC ExpNdx
inc [ExpNdx]
; LN:6117 PType=ExpTable(ExpNdx)
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [PType],eax
; LN:6118 IF PType=1 OR PType=PTArrOpn OR PType=PTFcnOpn OR PType=22 OR PType=PTCpxOpn OR PType=26 THEN
xor bh,bh
mov eax, dword [PType]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,22
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,24
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,26
cmp eax,edx
sete bl
or bh,bl
je _Lbl978
; LN:6119 ExpLeft=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpLeft],eax
; LN:6120 INC ParenCnt
inc [ParenCnt]
; LN:6121 ENDIF
_Lbl978:
; LN:6122 IF PType=2 OR PType=PTArrCls OR PType=PTFcnCls OR PType=23 OR PType=PTFCpxCls OR PType=27 THEN
xor bh,bh
mov eax, dword [PType]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,23
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,25
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [PType]
mov edx,27
cmp eax,edx
sete bl
or bh,bl
je _Lbl979
; LN:6123 ExpRight=ExpNdx
mov eax, dword [ExpNdx]
mov [ExpRight],eax
; LN:6124 RETURN
ret
; LN:6125 ENDIF
_Lbl979:
; LN:6126 GOTO ParenScn1
jmp ParenScn1
SquishExp:
; LN:6129 LOOP
_Lbl980:
; LN:6130 IF ExpRight+1>ExpLen THEN
mov eax, dword [ExpRight]
mov edx,1
add eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx, dword [ExpLen]
cmp eax,edx
setg bl
or bh,bl
je _Lbl982
; LN:6131 ExpLen=ExpLeft-1
mov eax, dword [ExpLeft]
mov edx,1
sub eax,edx
mov dword [ExpLen],eax
; LN:6132 RETURN
ret
; LN:6133 ENDIF
_Lbl982:
; LN:6134 ExpTable(ExpLeft)=ExpTable(ExpRight+1)
mov esi,ExpTable-(1*4)
mov eax, dword [ExpLeft]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [ExpRight]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6135 INC ExpLeft
inc [ExpLeft]
; LN:6136 INC ExpRight
inc [ExpRight]
; LN:6137 ENDLOOP
jmp _Lbl980
_Lbl981:
SolveTerm:
; LN:6140 D0Loaded=0
mov byte [D0Loaded],0
; LN:6141 IF ExpLeft=1 AND ExpRight=ExpLen THEN
xor bh,bh
mov eax, dword [ExpLeft]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [ExpRight]
mov edx, dword [ExpLen]
cmp eax,edx
sete bl
and bh,bl
je _Lbl983
; LN:6142 LastGroup=$ff
mov byte [LastGroup],255
; LN:6143 ENDIF
_Lbl983:
; LN:6144 IF ExpLeft=2 AND ExpRight=ExpLen-1 AND ExpTable(1)=1 THEN
xor bh,bh
mov eax, dword [ExpLeft]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [ExpLen]
mov edx,1
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [ExpRight]
mov edx, dword [_Tmp1]
cmp eax,edx
sete bl
and bh,bl
mov esi,ExpTable-(1*4)
mov eax,1
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
je _Lbl984
; LN:6145 LastGroup=$ff
mov byte [LastGroup],255
; LN:6146 ENDIF
_Lbl984:
; LN:6147 '*******************************
; LN:6148 ' Pointer Stuff Begins Here
; LN:6149 IF PType=27 THEN
cmp [PType],27
jne _Lbl985
; LN:6150 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:6151 GOSUB ClassOp
call ClassOp
; LN:6152 GOSUB GetTmpVec
call GetTmpVec
; LN:6153 ErrRet
; LN:6153 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl986
; LN:6153 RETURN
ret
; LN:6153 ENDIF
_Lbl986:
; LN:6154 SymTable(SymNdx).DataMod=LAND(SymTable(SymNdx).DataMod,$fd)'  kill addr bit
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov ax, word [edi]
mov edx,253
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6155 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6156 OutBuf="mov esi,["+TSymName+"]"
mov esi,_StrConst863
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst864
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6157 GOSUB OutCodeData
call OutCodeData
; LN:6158 IF SymTemp.DataType=COMPLEX THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,14
cmp eax,edx
sete bl
or bh,bl
je _Lbl987
; LN:6159 OutBuf="add esi,"+STR$(SymTable(ExpTable(ExpNdx+3)).DataAddr)
mov eax, dword [ExpNdx]
mov edx,3
add eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+36
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst865
mov [_TmpVec4],esi
mov [_TmpVec4+4],9
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:6160 GOSUB OutCodeData
call OutCodeData
; LN:6161 ENDIF
_Lbl987:
; LN:6162 OutBuf="mov ["+SymTemp.SymName+"],esi"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst866
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst867
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6163 GOSUB OutCodeData
call OutCodeData
; LN:6164 IF TDataType=STRINGVAR THEN
cmp [TDataType],6
jne _Lbl988
; LN:6165 OutBuf="mov ["+SymTemp.SymName+"+4],"+STR$(TDetail)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [TDetail]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst868
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_StrConst869
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:6166 GOSUB OutCodeData
call OutCodeData
; LN:6167 OutBuf="mov ["+SymTemp.SymName+"+8],0"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst870
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst871
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6168 GOSUB OutCodeData
call OutCodeData
; LN:6169 ENDIF
_Lbl988:
; LN:6170 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6171 ENDIF
_Lbl985:
; LN:6172 ' Pointer Stuff Ends Here
; LN:6173 '*******************************
; LN:6174 IF PType=PTArrCls THEN
cmp [PType],4
jne _Lbl989
; LN:6175 ExpNdx=ExpLeft-1
mov eax, dword [ExpLeft]
mov edx,1
sub eax,edx
mov dword [ExpNdx],eax
; LN:6176 GOSUB ClassOp
call ClassOp
; LN:6177 ArrayDataType=TDataType
mov ax, word [TDataType]
mov [ArrayDataType],ax
; LN:6178 ArrayDetail=TDetail
mov eax, dword [TDetail]
mov [ArrayDetail],eax
; LN:6179 GOSUB GetTmpVec
call GetTmpVec
; LN:6180 ErrRet
; LN:6180 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl990
; LN:6180 RETURN
ret
; LN:6180 ENDIF
_Lbl990:
; LN:6181 GOSUB GetBase
call GetBase
; LN:6182 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6183 TempStr=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:6184 GOSUB GetOpSize
call GetOpSize
; LN:6185 GOSUB BldOffset
call BldOffset
; LN:6186 ErrRet
; LN:6186 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl991
; LN:6186 RETURN
ret
; LN:6186 ENDIF
_Lbl991:
; LN:6187 OutBuf="mov ["+TempStr+"],esi"
mov esi,_StrConst872
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst873
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6188 GOSUB OutCodeData
call OutCodeData
; LN:6189 IF ArrayDataType=STRINGVAR THEN
cmp [ArrayDataType],6
jne _Lbl992
; LN:6190 OutBuf="mov ["+TempStr+"+4],"+STR$(ArrayDetail)
mov eax, dword [ArrayDetail]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst874
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov edi,[TempStr]
mov [_TmpVec3],edi
mov edi,[TempStr+4]
mov [_TmpVec3+4],edi
mov edi,[TempStr+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst875
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6191 GOSUB OutCodeData
call OutCodeData
; LN:6192 OutBuf="mov ["+TempStr+"+8],0"
mov esi,_StrConst876
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst877
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6193 GOSUB OutCodeData
call OutCodeData
; LN:6194 ENDIF
_Lbl992:
; LN:6195 GOTO ArrFcnEnd
jmp ArrFcnEnd
; LN:6196 ENDIF
_Lbl989:
; LN:6197 IF PType=PTFcnCls THEN' Function
cmp [PType],6
jne _Lbl993
; LN:6198 HasFcn=$ff
mov byte [HasFcn],255
; LN:6199 ExpNdx=ExpLeft-1
mov eax, dword [ExpLeft]
mov edx,1
sub eax,edx
mov dword [ExpNdx],eax
; LN:6200 GOSUB GetSymTempExpNdx
call GetSymTempExpNdx
; LN:6201 FcnName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,FcnName
mov esi,_TmpVec1
call __MovStr
; LN:6202 ExpNdx=ExpNdx+2
mov eax, dword [ExpNdx]
mov edx,2
add eax,edx
mov dword [ExpNdx],eax
; LN:6203 IF SymTemp.DataMod=UsrFcnBit THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,512
cmp eax,edx
sete bl
or bh,bl
je _Lbl994
; LN:6204 TFcnDataType=SymTemp.FcnDataType
mov esi,SymTemp+58
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [TFcnDataType],al
; LN:6205 GOSUB GetFcnTypes
call GetFcnTypes
; LN:6206 FOR Ctr3=1 TO TFcnArgs
mov [Ctr3],1
mov eax,[TFcnArgs]
mov [_LopVec5],eax
_Lbl995:
mov eax,[Ctr3]
cmp eax,[_LopVec5]
jg _Lbl997
; LN:6207 GOSUB ClassOp
call ClassOp
; LN:6208 GOSUB ArgPush
call ArgPush
; LN:6209 ErrRet
; LN:6209 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl998
; LN:6209 RETURN
ret
; LN:6209 ENDIF
_Lbl998:
; LN:6210 INC ExpNdx
inc [ExpNdx]
; LN:6211 NEXT Ctr3
_Lbl996:
inc [Ctr3]
jmp _Lbl995
_Lbl997:
; LN:6212 OutBuf="call "+FcnName
mov esi,_StrConst878
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[FcnName]
mov [_TmpVec2],edi
mov edi,[FcnName+4]
mov [_TmpVec2+4],edi
mov edi,[FcnName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6213 GOSUB OutCodeData
call OutCodeData
; LN:6214 SELECT CASE TFcnDataType
xor eax,eax
mov al, byte [TFcnDataType]
mov [_SwitchInt],eax
; LN:6215 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1000
; LN:6216 ExpTable(ExpNdx)=193
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,193
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6217 CASE LONGVAR
jmp _Lbl999
_Lbl1000:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1001
; LN:6218 ExpTable(ExpNdx)=194
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,194
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6219 CASE STRINGVAR
jmp _Lbl999
_Lbl1001:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1002
; LN:6220 ExpTable(ExpNdx)=195
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,195
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6221 CASE FLOATVAR
jmp _Lbl999
_Lbl1002:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1003
; LN:6222 ExpTable(ExpNdx)=196
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,196
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6223 END SELECT					
jmp _Lbl999
_Lbl1003:
_Lbl999:
; LN:6224 ELSE
jmp _Lbl1004
_Lbl994:
; LN:6225 FcnCode=SymTemp.Detail
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov byte [FcnCode],al
; LN:6226 IF FcnCode<51 THEN
cmp [FcnCode],51
jge _Lbl1005
; LN:6227 ON FcnCode GOSUB F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,F18,F19,F20,F21,F22,F23,F24,F25,F26,F27,F28,F29,F30,F31,F32,F33,F34,F35,F36,F37,F38,F39,F40,F41,F42,F43,F44,F45,F46,F47,F48,F49,F50
xor eax,eax
mov al, byte [FcnCode]
cmp eax,1
jl _Lbl1006
cmp eax,50
jg _Lbl1006
dec eax
shl eax,2
add eax,_Table1
mov eax,[eax]
call dword eax
_Lbl1006:
; LN:6228 ELSE
jmp _Lbl1007
_Lbl1005:
; LN:6229 ON FcnCode-50 GOSUB F51,F52,F53,F54,F55,F56,F57,F58,F59,F60,F61,F62,F63,F64,F65,F66,F67,F68,F69,F70,F71,F72,F73,F74,F75,F76,F77,F78,F79,F80,F81,F82
xor eax,eax
mov al, byte [FcnCode]
mov edx,50
sub eax,edx
cmp eax,1
jl _Lbl1008
cmp eax,32
jg _Lbl1008
dec eax
shl eax,2
add eax,_Table2
mov eax,[eax]
call dword eax
_Lbl1008:
; LN:6230 ENDIF
_Lbl1007:
; LN:6231 ENDIF
_Lbl1004:
; LN:6232 ErrRet
; LN:6232 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1009
; LN:6232 RETURN
ret
; LN:6232 ENDIF
_Lbl1009:
; LN:6233 GOTO ArrFcnEnd
jmp ArrFcnEnd
; LN:6234 ENDIF
_Lbl993:
; LN:6235 IF PType=PTFCpxCls THEN
cmp [PType],25
jne _Lbl1010
; LN:6236 IF ExpRight-ExpLeft=2 THEN
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
cmp [_Tmp1],2
jne _Lbl1011
; LN:6237 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:6238 GOSUB ClassOp
call ClassOp
; LN:6239 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1012
; LN:6240 GOSUB Vectorize
call Vectorize
; LN:6241 ErrRet
; LN:6241 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1013
; LN:6241 RETURN
ret
; LN:6241 ENDIF
_Lbl1013:
; LN:6242 ENDIF
_Lbl1012:
; LN:6243 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1014
; LN:6244 GOSUB SetTmpVec
call SetTmpVec
; LN:6245 ErrRet
; LN:6245 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1015
; LN:6245 RETURN
ret
; LN:6245 ENDIF
_Lbl1015:
; LN:6246 ENDIF
_Lbl1014:
; LN:6247 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6248 ENDIF
_Lbl1011:
; LN:6249 ExpNdx=ExpLeft+3
mov eax, dword [ExpLeft]
mov edx,3
add eax,edx
mov dword [ExpNdx],eax
; LN:6250 GOSUB ClassOp
call ClassOp
; LN:6251 IF TDataType=STRINGVAR AND DMVector=0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1016
; LN:6252 'GOSUB VecString
; LN:6253 ENDIF
_Lbl1016:
; LN:6254 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1017
; LN:6255 GOSUB SetTmpVec
call SetTmpVec
; LN:6256 ErrRet
; LN:6256 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1018
; LN:6256 RETURN
ret
; LN:6256 ENDIF
_Lbl1018:
; LN:6257 ENDIF
_Lbl1017:
; LN:6258 ExpNdx=ExpNdx-2
mov eax, dword [ExpNdx]
mov edx,2
sub eax,edx
mov dword [ExpNdx],eax
; LN:6259 GOSUB ClassOp
call ClassOp
; LN:6260 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1019
; LN:6261 GOSUB Vectorize
call Vectorize
; LN:6262 ErrRet
; LN:6262 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1020
; LN:6262 RETURN
ret
; LN:6262 ENDIF
_Lbl1020:
; LN:6263 ENDIF
_Lbl1019:
; LN:6264 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1021
; LN:6265 GOSUB SetTmpVec
call SetTmpVec
; LN:6266 ErrRet
; LN:6266 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1022
; LN:6266 RETURN
ret
; LN:6266 ENDIF
_Lbl1022:
; LN:6267 ENDIF
_Lbl1021:
; LN:6268 ExpNdx=ExpNdx+2
mov eax, dword [ExpNdx]
mov edx,2
add eax,edx
mov dword [ExpNdx],eax
; LN:6269 GOSUB ClassOp
call ClassOp
; LN:6270 ExpNdx=ExpNdx-2
mov eax, dword [ExpNdx]
mov edx,2
sub eax,edx
mov dword [ExpNdx],eax
; LN:6271 SymNdx=ExpTable(ExpNdx)
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [SymNdx],eax
; LN:6272 SymTable(SymNdx).DataType=TDataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov ax, word [TDataType]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6273 SymTable(SymNdx).DataSize=TDataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TDataSize]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6274 SymTable(SymNdx).Detail=TDetail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TDetail]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6275 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl1023
; LN:6276 OutBuf="mov eax,["+SymTable(SymNdx).SymName+"]"
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst879
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_StrConst880
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6277 GOSUB OutCodeData
call OutCodeData
; LN:6278 OutBuf="add eax,["+TSymName+"]"
mov esi,_StrConst881
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst882
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6279 GOSUB OutCodeData
call OutCodeData
; LN:6280 OutBuf="mov ["+SymTable(SymNdx).SymName+"],eax"
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst883
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst884
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6281 GOSUB OutCodeData
call OutCodeData
; LN:6282 ENDIF
_Lbl1023:
; LN:6283 IF OpClass=STRClass AND ReadFlag=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [ReadFlag]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1024
; LN:6284 OutBuf="mov ["+SymTable(SymNdx).SymName+"+4],"+STR$(SymTemp.Detail)
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,SymTemp+32
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst885
mov [_TmpVec4],esi
mov [_TmpVec4+4],6
mov [_TmpVec4+8],0
mov esi,_StrConst886
mov [_TmpVec5],esi
mov [_TmpVec5+4],5
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:6285 GOSUB OutCodeData
call OutCodeData
; LN:6286 OutBuf="mov ["+SymTable(SymNdx).SymName+"+8],0"
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst887
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst888
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6287 GOSUB OutCodeData	
call OutCodeData
; LN:6288 ENDIF
_Lbl1024:
; LN:6289 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6290 ENDIF
_Lbl1010:
; LN:6291 ' Get here if PType=2
; LN:6292 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:6293 GOSUB ClassOp
call ClassOp
; LN:6294 MakeLong
; LN:6294 IF LAND(TDataMod,PointerBit)=PointerBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl1025
; LN:6294 TDataType=LONGVAR
mov word [TDataType],4
; LN:6294 ENDIF
_Lbl1025:
; LN:6295 IF ExpRight-ExpLeft=2 AND DMArray<>0 THEN
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
and bh,bl
je _Lbl1026
; LN:6296 IF CompFlag<>0 THEN
cmp [CompFlag],0
je _Lbl1027
; LN:6297 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6298 ENDIF
_Lbl1027:
; LN:6299 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6300 ENDIF
_Lbl1026:
; LN:6301 IF LastGroup=$ff AND ExpRight-ExpLeft<>2 AND Target=$ff THEN
xor bh,bh
xor eax,eax
mov al, byte [LastGroup]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
setne bl
and bh,bl
xor eax,eax
mov al, byte [Target]
mov edx,255
cmp eax,edx
sete bl
and bh,bl
je _Lbl1028
; LN:6302 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:6303 RETURN
ret
; LN:6304 ENDIF
_Lbl1028:
; LN:6305 IF ExpRight-ExpLeft=2 THEN
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
cmp [_Tmp1],2
jne _Lbl1029
; LN:6306 IF TDataType=STRINGVAR AND DMVector=0 AND DMAddr=0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [DMAddr]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1030
; LN:6307 GOSUB VecString
call VecString
; LN:6308 ENDIF
_Lbl1030:
; LN:6309 IF TDataType=STRINGVAR AND DMVector<>0 AND DMTemp=0 AND DiskIO=$ff  AND BufRWFlg=0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
and bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [DiskIO]
mov edx,255
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [BufRWFlg]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1031
; LN:6310 GOSUB GetBase
call GetBase
; LN:6311 ENDIF
_Lbl1031:
; LN:6312 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6313 ENDIF
_Lbl1029:
ScanStr:
; LN:6315 GOSUB ClassOp
call ClassOp
; LN:6316 MakeLong
; LN:6316 IF LAND(TDataMod,PointerBit)=PointerBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl1032
; LN:6316 TDataType=LONGVAR
mov word [TDataType],4
; LN:6316 ENDIF
_Lbl1032:
; LN:6317 IF TDataType=STRINGVAR AND DMVector=0 AND DMAddr=0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [DMAddr]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1033
; LN:6318 GOSUB VecString
call VecString
; LN:6319 ENDIF
_Lbl1033:
; LN:6320 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1034
; LN:6321 REM need to make a temp vector
; LN:6322 GOSUB SetTmpVec
call SetTmpVec
; LN:6323 ErrRet
; LN:6323 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1035
; LN:6323 RETURN
ret
; LN:6323 ENDIF
_Lbl1035:
; LN:6324 ENDIF
_Lbl1034:
; LN:6325 INC ExpNdx
inc [ExpNdx]
; LN:6326 IF ExpNdx<ExpRight THEN ScanStr
xor bh,bh
mov eax, dword [ExpNdx]
mov edx, dword [ExpRight]
cmp eax,edx
setl bl
or bh,bl
je _Lbl1036
jmp ScanStr
_Lbl1036:
; LN:6327 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:6328 GOSUB ClassOp
call ClassOp
; LN:6329 MakeLong
; LN:6329 IF LAND(TDataMod,PointerBit)=PointerBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl1037
; LN:6329 TDataType=LONGVAR
mov word [TDataType],4
; LN:6329 ENDIF
_Lbl1037:
; LN:6330 IF TDataType=STRINGVAR THEN
cmp [TDataType],6
jne _Lbl1038
; LN:6331 DataOp=0
mov byte [DataOp],0
; LN:6332 Ctr1=0
mov dword [Ctr1],0
Label6184:
; LN:6334 IF DataOp=0 THEN
cmp [DataOp],0
jne _Lbl1039
; LN:6335 GOSUB ClassOp
call ClassOp
; LN:6336 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1040
; LN:6337 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6338 RETURN
ret
; LN:6339 ENDIF
_Lbl1040:
; LN:6340 INC Ctr1
inc [Ctr1]
; LN:6341 IF Ctr1>1 THEN
cmp [Ctr1],1
jle _Lbl1041
; LN:6342 OutBuf="mov esi,"+TSymName
mov esi,_StrConst889
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6343 GOSUB OutCodeData
call OutCodeData
; LN:6344 TSymName=SymTable(ExpTable(ExpNdx-2)).SymName
mov eax, dword [ExpNdx]
mov edx,2
sub eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,TSymName
mov esi,_TmpVec2
call __MovStr
; LN:6345 OutBuf="mov ["+TSymName+"+8],esi"
mov esi,_StrConst890
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst891
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6346 GOSUB OutCodeData
call OutCodeData
; LN:6347 ENDIF
_Lbl1041:
; LN:6348 DataOp=$ff
mov byte [DataOp],255
; LN:6349 ELSE
jmp _Lbl1042
_Lbl1039:
; LN:6350 MathOp=ExpTable(ExpNdx)
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov byte [MathOp],al
; LN:6351 IF MathOp<15 THEN
cmp [MathOp],15
jge _Lbl1043
; LN:6352 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6353 RETURN
ret
; LN:6354 ENDIF
_Lbl1043:
; LN:6355 DataOp=0
mov byte [DataOp],0
; LN:6356 ENDIF
_Lbl1042:
; LN:6357 INC ExpNdx
inc [ExpNdx]
; LN:6358 IF ExpNdx<ExpRight THEN Label6184
xor bh,bh
mov eax, dword [ExpNdx]
mov edx, dword [ExpRight]
cmp eax,edx
setl bl
or bh,bl
je _Lbl1044
jmp Label6184
_Lbl1044:
; LN:6359 IF DataOp=0 THEN
cmp [DataOp],0
jne _Lbl1045
; LN:6360 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6361 RETURN
ret
; LN:6362 ENDIF
_Lbl1045:
; LN:6363 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:6364 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6365 ENDIF
_Lbl1038:
; LN:6366 IF TDataType<2 OR TDataType>5 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,2
cmp eax,edx
setl bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,5
cmp eax,edx
setg bl
or bh,bl
je _Lbl1046
; LN:6367 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6368 RETURN
ret
; LN:6369 ELSE
jmp _Lbl1047
_Lbl1046:
; LN:6370 DataOp=0
mov byte [DataOp],0
; LN:6371 Ctr1=0
mov dword [Ctr1],0
Label6186:
; LN:6373 IF DataOp=0 THEN
cmp [DataOp],0
jne _Lbl1048
; LN:6374 DataOp=$ff
mov byte [DataOp],255
; LN:6375 GOSUB LoadReg
call LoadReg
; LN:6376 ErrRet
; LN:6376 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1049
; LN:6376 RETURN
ret
; LN:6376 ENDIF
_Lbl1049:
; LN:6377 INC Ctr1
inc [Ctr1]
; LN:6378 IF Ctr1>1 THEN
cmp [Ctr1],1
jle _Lbl1050
; LN:6379 SELECT CASE MathOp
xor eax,eax
mov al, byte [MathOp]
mov [_SwitchInt],eax
; LN:6380 CASE 15
mov eax,15
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1052
; LN:6381 GOSUB DoAdd
call DoAdd
; LN:6382 CASE 16
jmp _Lbl1051
_Lbl1052:
mov eax,16
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1053
; LN:6383 GOSUB DoSub
call DoSub
; LN:6384 CASE 17
jmp _Lbl1051
_Lbl1053:
mov eax,17
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1054
; LN:6385 GOSUB DoMul
call DoMul
; LN:6386 CASE 18
jmp _Lbl1051
_Lbl1054:
mov eax,18
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1055
; LN:6387 GOSUB DoDiv
call DoDiv
; LN:6388 CASE 146
jmp _Lbl1051
_Lbl1055:
mov eax,146
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1056
; LN:6389 GOSUB DoAnd
call DoAnd
; LN:6390 CASE 147
jmp _Lbl1051
_Lbl1056:
mov eax,147
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1057
; LN:6391 GOSUB DoOr
call DoOr
; LN:6392 END SELECT
jmp _Lbl1051
_Lbl1057:
_Lbl1051:
; LN:6393 ENDIF
_Lbl1050:
; LN:6394 ELSE
jmp _Lbl1058
_Lbl1048:
; LN:6395 MathOp=ExpTable(ExpNdx)
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov byte [MathOp],al
; LN:6396 DataOp=0
mov byte [DataOp],0
; LN:6397 ENDIF
_Lbl1058:
; LN:6398 INC ExpNdx
inc [ExpNdx]
; LN:6399 IF ExpNdx<ExpRight THEN Label6186
xor bh,bh
mov eax, dword [ExpNdx]
mov edx, dword [ExpRight]
cmp eax,edx
setl bl
or bh,bl
je _Lbl1059
jmp Label6186
_Lbl1059:
; LN:6400 IF DataOp=0 THEN
cmp [DataOp],0
jne _Lbl1060
; LN:6401 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6402 ENDIF
_Lbl1060:
; LN:6403 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:6404 IF LastGroup=$ff AND CompFlag=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [LastGroup]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [CompFlag]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1061
; LN:6405 ExpTable(ExpNdx)=19
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,19
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6406 IF TDataType=FLOATVAR THEN
cmp [TDataType],5
jne _Lbl1062
; LN:6407 SymTable(19).DataType=FLOATVAR
mov esi,SymTable-(1*60)+28
mov eax,19
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,5
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6408 ELSE
jmp _Lbl1063
_Lbl1062:
; LN:6409 SymTable(19).DataType=LONGVAR
mov esi,SymTable-(1*60)+28
mov eax,19
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6410 ENDIF
_Lbl1063:
; LN:6411 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6412 ENDIF
_Lbl1061:
; LN:6413 IF FloatFlag=0 THEN
cmp [FloatFlag],0
jne _Lbl1064
; LN:6414 GOSUB GetTmp
call GetTmp
; LN:6415 ErrRet
; LN:6415 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1065
; LN:6415 RETURN
ret
; LN:6415 ENDIF
_Lbl1065:
; LN:6416 ELSE
jmp _Lbl1066
_Lbl1064:
; LN:6417 GOSUB GetFltTmp
call GetFltTmp
; LN:6418 ErrRet
; LN:6418 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1067
; LN:6418 RETURN
ret
; LN:6418 ENDIF
_Lbl1067:
; LN:6419 ENDIF
_Lbl1066:
; LN:6420 OutBuf="mov ["+SymTemp.SymName+"],"+Reg0Name
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst892
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst893
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov edi,[Reg0Name]
mov [_TmpVec4],edi
mov edi,[Reg0Name+4]
mov [_TmpVec4+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6421 GOSUB OutCodeData
call OutCodeData
; LN:6422 D1Cleared=0
mov byte [D1Cleared],0
; LN:6423 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6424 GOTO GrpCpxEnd
jmp GrpCpxEnd
; LN:6425 ENDIF
_Lbl1047:
ArrFcnEnd:
; LN:6427 DEC ExpLeft
dec [ExpLeft]
GrpCpxEnd:
; LN:6429 ExpTable(ExpLeft)=ExpTable(ExpNdx)
mov esi,ExpTable-(1*4)
mov eax, dword [ExpLeft]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6430 ExpNdx=ExpLeft
mov eax, dword [ExpLeft]
mov [ExpNdx],eax
; LN:6431 INC ExpLeft
inc [ExpLeft]
; LN:6432 RETURN
ret
GetBase:
; LN:6435 IF DMMember<>0 THEN
cmp [DMMember],0
je _Lbl1068
; LN:6436 IF DMArray=0 THEN
cmp [DMArray],0
jne _Lbl1069
; LN:6437 OutBuf="mov esi,"+STR$(TDataAddr)
mov eax, dword [TDataAddr]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst894
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6438 ELSE
jmp _Lbl1070
_Lbl1069:
; LN:6439 GOSUB GetOpSize
call GetOpSize
; LN:6440 OutBuf="mov esi,0-("+STR$(ArrayBase)+"*"+STR$(TempInt)+")"
xor eax,eax
mov al, byte [ArrayBase]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst895
mov [_TmpVec3],esi
mov [_TmpVec3+4],12
mov [_TmpVec3+8],0
mov esi,_StrConst896
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_StrConst897
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov esi,_TmpVec5
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:6441 ENDIF
_Lbl1070:
; LN:6442 GOSUB OutCodeData
call OutCodeData
; LN:6443 RETURN
ret
; LN:6444 ENDIF
_Lbl1068:
; LN:6445 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl1071
; LN:6446 OutBuf="mov esi,["+TSymName+"]"
mov esi,_StrConst898
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst899
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6447 GOSUB OutCodeData
call OutCodeData
; LN:6448 IF TDataType=COMPLEX THEN
cmp [TDataType],14
jne _Lbl1072
; LN:6449 CpxArrayOffset=ArrayBase*TDataAddr
xor eax,eax
mov al, byte [ArrayBase]
mov edx, dword [TDataAddr]
imul edx
mov dword [CpxArrayOffset],eax
; LN:6450 OutBuf="add esi,"+STR$(SymTable(ExpTable(ExpNdx+5)).DataAddr)
mov eax, dword [ExpNdx]
mov edx,5
add eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+36
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst900
mov [_TmpVec4],esi
mov [_TmpVec4+4],9
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:6451 GOSUB OutCodeData
call OutCodeData
; LN:6452 ENDIF
_Lbl1072:
; LN:6453 RETURN
ret
; LN:6454 ENDIF
_Lbl1071:
; LN:6455 IF DMArray<>0 THEN
cmp [DMArray],0
je _Lbl1073
; LN:6456 OutBuf="mov esi,"+TSymName+"-("+STR$(ArrayBase)+"*"+STR$(TDataAddr)+")"
xor eax,eax
mov al, byte [ArrayBase]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TDataAddr]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst901
mov [_TmpVec3],esi
mov [_TmpVec3+4],9
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst902
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_StrConst903
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst904
mov [_TmpVec7],esi
mov [_TmpVec7+4],2
mov [_TmpVec7+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec1
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:6457 IF TDataType=COMPLEX THEN
cmp [TDataType],14
jne _Lbl1074
; LN:6458 CpxArrayOffset=ArrayBase*TDataAddr
xor eax,eax
mov al, byte [ArrayBase]
mov edx, dword [TDataAddr]
imul edx
mov dword [CpxArrayOffset],eax
; LN:6459 OutBuf=OutBuf+"+"+STR$(SymTable(ExpTable(ExpNdx+5)).DataAddr)
mov eax, dword [ExpNdx]
mov edx,5
add eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+36
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov edi,[OutBuf]
mov [_TmpVec4],edi
mov edi,[OutBuf+4]
mov [_TmpVec4+4],edi
mov edi,[OutBuf+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst905
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec3
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:6460 ENDIF
_Lbl1074:
; LN:6461 OutBuf=OutBuf
mov edi,OutBuf
mov esi,OutBuf
call __MovStr
; LN:6462 GOSUB OutCodeData
call OutCodeData
; LN:6463 RETURN
ret
; LN:6464 ENDIF
_Lbl1073:
; LN:6465 IF TDataType=COMPLEX THEN
cmp [TDataType],14
jne _Lbl1075
; LN:6466 OutBuf="mov esi,"+TSymName+"+"+STR$(SymTable(ExpTable(ExpNdx+2)).DataAddr)
mov eax, dword [ExpNdx]
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+36
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst906
mov [_TmpVec4],esi
mov [_TmpVec4+4],9
mov [_TmpVec4+8],0
mov edi,[TSymName]
mov [_TmpVec5],edi
mov edi,[TSymName+4]
mov [_TmpVec5+4],edi
mov edi,[TSymName+8]
mov [_TmpVec5+8],edi
mov esi,_StrConst907
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov esi,_TmpVec3
mov [_TmpVec6+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:6467 GOSUB OutCodeData
call OutCodeData
; LN:6468 RETURN
ret
; LN:6469 ENDIF
_Lbl1075:
; LN:6470 OutBuf="mov esi,"+TSymName
mov esi,_StrConst908
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6471 GOSUB OutCodeData
call OutCodeData
; LN:6472 RETURN
ret
BldOffset:
; LN:6475 SymTable(SymNdx).DataSize=TempInt
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TempInt]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6476 SymTable(SymNdx).DataMod=LAND(ArrayMsk,SymTable(SymNdx).DataMod)
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov eax,65534
mov edi,[_TmpVec2]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:6477 GOSUB ClassOp
call ClassOp
; LN:6478 ExpNdx=ExpNdx+2
mov eax, dword [ExpNdx]
mov edx,2
add eax,edx
mov dword [ExpNdx],eax
; LN:6479 NumArgs=ExpRight-ExpLeft-1
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov edx,1
sub eax,edx
mov byte [NumArgs],al
; LN:6480 IF NumArgs<>SubCtr THEN
xor bh,bh
xor eax,eax
mov al, byte [NumArgs]
xor edx,edx
mov dl, byte [SubCtr]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1076
; LN:6481 ErrNo=ErrArrSub
mov dword [ErrNo],33
; LN:6482 RETURN
ret
; LN:6483 ENDIF
_Lbl1076:
; LN:6484 GOSUB SubLoad
call SubLoad
; LN:6485 IF NumArgs=1 THEN'  1 DIM array
cmp [NumArgs],1
jne _Lbl1077
; LN:6486 IF TempInt<>1 THEN
cmp [TempInt],1
je _Lbl1078
; LN:6487 SELECT CASE TempInt
mov eax, dword [TempInt]
mov [_SwitchInt],eax
; LN:6488 CASE 2
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1080
; LN:6489 OutBuf="shl eax,1"
mov edi,[OutBuf]
mov esi,_StrConst909
call __SetStrConst
; LN:6490 CASE 4
jmp _Lbl1079
_Lbl1080:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1081
; LN:6491 OutBuf="shl eax,2"
mov edi,[OutBuf]
mov esi,_StrConst910
call __SetStrConst
; LN:6492 CASE 8
jmp _Lbl1079
_Lbl1081:
mov eax,8
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1082
; LN:6493 OutBuf="shl eax,3"
mov edi,[OutBuf]
mov esi,_StrConst911
call __SetStrConst
; LN:6494 CASE 16
jmp _Lbl1079
_Lbl1082:
mov eax,16
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1083
; LN:6495 OutBuf="shl eax,4"
mov edi,[OutBuf]
mov esi,_StrConst912
call __SetStrConst
; LN:6496 CASE 32
jmp _Lbl1079
_Lbl1083:
mov eax,32
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1084
; LN:6497 OutBuf="shl eax,5"
mov edi,[OutBuf]
mov esi,_StrConst913
call __SetStrConst
; LN:6498 CASE 64
jmp _Lbl1079
_Lbl1084:
mov eax,64
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1085
; LN:6499 OutBuf="shl eax,6"
mov edi,[OutBuf]
mov esi,_StrConst914
call __SetStrConst
; LN:6500 CASE 128
jmp _Lbl1079
_Lbl1085:
mov eax,128
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1086
; LN:6501 OutBuf="shl eax,7"
mov edi,[OutBuf]
mov esi,_StrConst915
call __SetStrConst
; LN:6502 CASE 256
jmp _Lbl1079
_Lbl1086:
mov eax,256
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1087
; LN:6503 OutBuf="shl eax,8"
mov edi,[OutBuf]
mov esi,_StrConst916
call __SetStrConst
; LN:6504 CASE 512
jmp _Lbl1079
_Lbl1087:
mov eax,512
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1088
; LN:6505 OutBuf="shl eax,9"
mov edi,[OutBuf]
mov esi,_StrConst917
call __SetStrConst
; LN:6506 CASE 1024
jmp _Lbl1079
_Lbl1088:
mov eax,1024
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1089
; LN:6507 OutBuf="shl eax,10"
mov edi,[OutBuf]
mov esi,_StrConst918
call __SetStrConst
; LN:6508 CASE ELSE
jmp _Lbl1079
_Lbl1089:
; LN:6509 OutBuf="imul eax,"+STR$(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst919
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6510 END SELECT		
jmp _Lbl1079
_Lbl1090:
_Lbl1079:
; LN:6511 GOSUB OutCodeData
call OutCodeData
; LN:6512 ENDIF
_Lbl1078:
; LN:6513 OutBuf="add esi,eax;"
mov edi,[OutBuf]
mov esi,_StrConst920
call __SetStrConst
; LN:6514 GOSUB OutCodeData
call OutCodeData
; LN:6515 ExpNdx=ExpNdx-2
mov eax, dword [ExpNdx]
mov edx,2
sub eax,edx
mov dword [ExpNdx],eax
; LN:6516 RETURN
ret
; LN:6517 ENDIF
_Lbl1077:
; LN:6518 OutBuf="mov edx,eax"
mov edi,[OutBuf]
mov esi,_StrConst921
call __SetStrConst
; LN:6519 GOSUB OutCodeData
call OutCodeData
; LN:6520 INC ExpNdx
inc [ExpNdx]
; LN:6521 GOSUB SubLoad
call SubLoad
; LN:6522 ErrRet
; LN:6522 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1091
; LN:6522 RETURN
ret
; LN:6522 ENDIF
_Lbl1091:
; LN:6523 IF NumArgs=2 THEN'  2 DIM array
cmp [NumArgs],2
jne _Lbl1092
; LN:6524 REM eax is (2), edx is (1)
; LN:6525 OutBuf="eax=eax*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+"+STR$(TempInt)+"*edx"
mov esi,SubValue-(1*4)
mov eax,1
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
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp3
mov [_TmpVec4],esi
mov [_TmpVec4+4],32
mov [_TmpVec4+8],0
mov edi,_TmpVec4
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst922
mov [_TmpVec5],esi
mov [_TmpVec5+4],9
mov [_TmpVec5+8],0
mov esi,_StrConst923
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst924
mov [_TmpVec7],esi
mov [_TmpVec7+4],2
mov [_TmpVec7+8],0
mov esi,_StrConst925
mov [_TmpVec8],esi
mov [_TmpVec8+4],5
mov [_TmpVec8+8],0
mov esi,_TmpVec2
mov [_TmpVec5+8],esi
mov esi,_TmpVec6
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec5
call __MovStr
; LN:6526 GOSUB OutCodeData
call OutCodeData
; LN:6527 OutBuf="add esi,eax"
mov edi,[OutBuf]
mov esi,_StrConst926
call __SetStrConst
; LN:6528 GOSUB OutCodeData
call OutCodeData
; LN:6529 ExpNdx=ExpNdx-3
mov eax, dword [ExpNdx]
mov edx,3
sub eax,edx
mov dword [ExpNdx],eax
; LN:6530 RETURN
ret
; LN:6531 ENDIF
_Lbl1092:
; LN:6532 REM Get here if 3 DIM array
; LN:6533 OutBuf="mov edi,eax"
mov edi,[OutBuf]
mov esi,_StrConst927
call __SetStrConst
; LN:6534 GOSUB OutCodeData
call OutCodeData
; LN:6535 INC ExpNdx
inc [ExpNdx]
; LN:6536 GOSUB SubLoad
call SubLoad
; LN:6537 ErrRet
; LN:6537 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1093
; LN:6537 RETURN
ret
; LN:6537 ENDIF
_Lbl1093:
; LN:6538 REM eax is (3), edx is(1), edi is (2)
; LN:6539 OutBuf="eax=edi*"+STR$(SubValue(1))+"*"+STR$(TempInt)+"+eax*"+STR$(SubValue(1))+"*"+STR$(SubValue(2))+"*"+STR$(TempInt)+";"
mov esi,SubValue-(1*4)
mov eax,1
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
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp2
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,SubValue-(1*4)
mov eax,1
shl eax,2
add esi,eax;
mov [_TmpVec4],esi
mov edi,[_TmpVec4]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp3
mov [_TmpVec5],esi
mov [_TmpVec5+4],32
mov [_TmpVec5+8],0
mov edi,_TmpVec5
mov esi,_ConvBuf1
call __MovStr
mov esi,SubValue-(1*4)
mov eax,2
shl eax,2
add esi,eax;
mov [_TmpVec6],esi
mov edi,[_TmpVec6]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp4
mov [_TmpVec7],esi
mov [_TmpVec7+4],32
mov [_TmpVec7+8],0
mov edi,_TmpVec7
mov esi,_ConvBuf1
call __MovStr
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp5
mov [_TmpVec8],esi
mov [_TmpVec8+4],32
mov [_TmpVec8+8],0
mov edi,_TmpVec8
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst928
mov [_TmpVec9],esi
mov [_TmpVec9+4],9
mov [_TmpVec9+8],0
mov esi,_StrConst929
mov [_TmpVec10],esi
mov [_TmpVec10+4],2
mov [_TmpVec10+8],0
mov esi,_StrConst930
mov [_TmpVec11],esi
mov [_TmpVec11+4],6
mov [_TmpVec11+8],0
mov esi,_StrConst931
mov [_TmpVec12],esi
mov [_TmpVec12+4],2
mov [_TmpVec12+8],0
mov esi,_StrConst932
mov [_TmpVec13],esi
mov [_TmpVec13+4],2
mov [_TmpVec13+8],0
mov esi,_StrConst933
mov [_TmpVec14],esi
mov [_TmpVec14+4],2
mov [_TmpVec14+8],0
mov esi,_TmpVec2
mov [_TmpVec9+8],esi
mov esi,_TmpVec10
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec10+8],esi
mov esi,_TmpVec11
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec11+8],esi
mov esi,_TmpVec12
mov [_TmpVec5+8],esi
mov esi,_TmpVec7
mov [_TmpVec12+8],esi
mov esi,_TmpVec13
mov [_TmpVec7+8],esi
mov esi,_TmpVec8
mov [_TmpVec13+8],esi
mov esi,_TmpVec14
mov [_TmpVec8+8],esi
mov edi,OutBuf
mov esi,_TmpVec9
call __MovStr
; LN:6540 GOSUB OutCodeData
call OutCodeData
; LN:6541 OutBuf="eax=eax+"+STR$(TempInt)+"*edx;"
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst934
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_StrConst935
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6542 GOSUB OutCodeData
call OutCodeData
; LN:6543 OutBuf="add esi,eax"
mov edi,[OutBuf]
mov esi,_StrConst936
call __SetStrConst
; LN:6544 GOSUB OutCodeData
call OutCodeData
; LN:6545 ExpNdx=ExpNdx-4
mov eax, dword [ExpNdx]
mov edx,4
sub eax,edx
mov dword [ExpNdx],eax
; LN:6546 RETURN
ret
VecString:
; LN:6549 IF BufRWFlg=$ff THEN'  for the case of BUFRW #fn,ADDR(a$),size
cmp [BufRWFlg],255
jne _Lbl1094
; LN:6550 RETURN
ret
; LN:6551 ENDIF
_Lbl1094:
; LN:6552 GOSUB GetTmpVec
call GetTmpVec
; LN:6553 ErrRet
; LN:6553 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1095
; LN:6553 RETURN
ret
; LN:6553 ENDIF
_Lbl1095:
; LN:6554 GOSUB GetBase
call GetBase
; LN:6555 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6556 TempStr=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:6557 TempInt=TDetail
mov eax, dword [TDetail]
mov [TempInt],eax
; LN:6558 IF PType=PTArrCls THEN
cmp [PType],4
jne _Lbl1096
; LN:6559 GOSUB BldOffset
call BldOffset
; LN:6560 ENDIF
_Lbl1096:
; LN:6561 OutBuf="mov ["+TempStr+"],esi"
mov esi,_StrConst937
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst938
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6562 GOSUB OutCodeData
call OutCodeData
; LN:6563 IF ReadFlag=0 THEN
cmp [ReadFlag],0
jne _Lbl1097
; LN:6564 OutBuf="mov ["+TempStr+"+4],"+STR$(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst939
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov edi,[TempStr]
mov [_TmpVec3],edi
mov edi,[TempStr+4]
mov [_TmpVec3+4],edi
mov edi,[TempStr+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst940
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec1
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6565 GOSUB OutCodeData
call OutCodeData
; LN:6566 OutBuf="mov ["+TempStr+"+8],0"
mov esi,_StrConst941
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TempStr]
mov [_TmpVec2],edi
mov edi,[TempStr+4]
mov [_TmpVec2+4],edi
mov edi,[TempStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst942
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6567 GOSUB OutCodeData
call OutCodeData
; LN:6568 ENDIF
_Lbl1097:
; LN:6569 RETURN
ret
ClassOp:
; LN:6572 GOSUB GetSymTempExpNdx
call GetSymTempExpNdx
; LN:6573 GOSUB ClassOp1
call ClassOp1
; LN:6574 RETURN
ret
ClassOp1:
; LN:6577 GOSUB ClrDatTyp
call ClrDatTyp
; LN:6578 TSymName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __MovStr
; LN:6579 TDataType=SymTemp.DataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:6580 TDataMod=SymTemp.DataMod
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataMod],ax
; LN:6581 TDetail=SymTemp.Detail
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDetail],eax
; LN:6582 TDataAddr=SymTemp.DataAddr
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataAddr],eax
; LN:6583 TDataSize=SymTemp.DataSize
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TDataSize],eax
; LN:6584 GOSUB GetDtaTyp 
call GetDtaTyp
; LN:6585 DMData=LAND(DataBit,TDataMod)
mov eax,128
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMData],al
; LN:6586 DMTemp=LAND(TempBit,TDataMod)
mov eax,64
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMTemp],al
; LN:6587 DMVector=LAND(VectorBit,TDataMod)
mov eax,32
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMVector],al
; LN:6588 DMMember=LAND(MemberBit,TDataMod)
mov eax,16
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMMember],al
; LN:6589 DMMulti=LAND(MultiBit,TDataMod)
mov eax,8
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMMulti],al
; LN:6590 DMConst=LAND(ConstBit,TDataMod)
mov eax,4
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMConst],al
; LN:6591 DMAddr=LAND(PointerBit,TDataMod)
mov eax,2
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [DMAddr],al
; LN:6592 IF LAND(ArrayBit,TDataMod)=ArrayBit THEN
mov eax,1
xor edx,edx
mov dx, word [TDataMod]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
je _Lbl1098
; LN:6593 DMArray=$ff
mov byte [DMArray],255
; LN:6594 OpClass=ARRClass
mov byte [OpClass],3
; LN:6595 IF DMMulti<>0 THEN
cmp [DMMulti],0
je _Lbl1099
; LN:6596 'MultiNdx=TMultiPtr
; LN:6597 'SubCtr=SymTable(MultiNdx).DataMod
; LN:6598 'SubValue(1)=SymTable(MultiNdx).Detail
; LN:6599 'SubValue(2)=SymTable(MultiNdx).DataAddr
; LN:6600 'SubValue(3)=SymTable(MultiNdx).DataSize
; LN:6601 ELSE
jmp _Lbl1100
_Lbl1099:
; LN:6602 SubCtr=1
mov byte [SubCtr],1
; LN:6603 ENDIF
_Lbl1100:
; LN:6604 RETURN
ret
; LN:6605 ENDIF
_Lbl1098:
; LN:6606 IF TDataType>=2 AND TDataType<=4 OR LAND(TDataMod,PointerBit)=PointerBit THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,2
cmp eax,edx
setge bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,4
cmp eax,edx
setle bl
and bh,bl
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl1101
; LN:6607 OpClass=INTClass
mov byte [OpClass],1
; LN:6608 RETURN
ret
; LN:6609 ENDIF
_Lbl1101:
; LN:6610 IF TDataType=FCN AND LAND(TDataSize,$00000004)=4 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [TDataSize]
mov edx,4
and eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,4
cmp eax,edx
sete bl
and bh,bl
je _Lbl1102
; LN:6611 OpClass=INTClass
mov byte [OpClass],1
; LN:6612 ENDIF
_Lbl1102:
; LN:6613 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:6614 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1104
; LN:6615 OpClass=BOOLClass
mov byte [OpClass],6
; LN:6616 CASE STRINGVAR
jmp _Lbl1103
_Lbl1104:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1105
; LN:6617 OpClass=STRClass
mov byte [OpClass],2
; LN:6618 CASE FLOATVAR
jmp _Lbl1103
_Lbl1105:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1106
; LN:6619 OpClass=FLTClass
mov byte [OpClass],5
; LN:6620 CASE COMPLEX
jmp _Lbl1103
_Lbl1106:
mov eax,14
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1107
; LN:6621 OpClass=CPXClass
mov byte [OpClass],4
; LN:6622 CASE LABELPTR
jmp _Lbl1103
_Lbl1107:
mov eax,16
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1108
; LN:6623 OpClass=LBLClass
mov byte [OpClass],9
; LN:6624 CASE ELSE
jmp _Lbl1103
_Lbl1108:
; LN:6625 OpClass=0
mov byte [OpClass],0
; LN:6626 END SELECT
jmp _Lbl1103
_Lbl1109:
_Lbl1103:
; LN:6627 RETURN
ret
Expr:
; LN:6630 GOSUB GetExp
call GetExp
; LN:6631 ErrRet
; LN:6631 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1110
; LN:6631 RETURN
ret
; LN:6631 ENDIF
_Lbl1110:
; LN:6632 GOSUB ProcExp
call ProcExp
; LN:6633 ErrRet
; LN:6633 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1111
; LN:6633 RETURN
ret
; LN:6633 ENDIF
_Lbl1111:
; LN:6634 GOSUB ClassOp
call ClassOp
; LN:6635 RETURN
ret
TokenSym:
; LN:6638 GOSUB NexToken
call NexToken
; LN:6639 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl1112
; LN:6640 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:6641 RETURN
ret
; LN:6642 ENDIF
_Lbl1112:
; LN:6643 GOSUB TokenSym1
call TokenSym1
; LN:6644 RETURN
ret
TokenSym1:
; LN:6647 GOSUB GtRootSym
call GtRootSym
; LN:6648 GOSUB ValidSym
call ValidSym
; LN:6649 IF SymbolOK=0 THEN
cmp [SymbolOK],0
jne _Lbl1113
; LN:6650 ErrNo=ErrIVSNam
mov dword [ErrNo],2
; LN:6651 RETURN
ret
; LN:6652 ENDIF
_Lbl1113:
; LN:6653 SymTemp.SymName=SymbolSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,SymbolSaf
call __MovStr
; LN:6654 GOSUB SymSrch
call SymSrch
; LN:6655 RETURN
ret
ClrSym:
; LN:6658 SymTemp.Detail=0
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6659 SymTemp.DataAddr=0
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6660 SymTemp.DataSize=0
mov esi,SymTemp+40
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6661 SymTemp.ArrayDim1=0
mov esi,SymTemp+44
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6662 SymTemp.ArrayDim2=0
mov esi,SymTemp+48
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6663 SymTemp.ArrayDim3=0
mov esi,SymTemp+52
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:6664 SymTemp.ArrayDims=0
mov esi,SymTemp+56
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:6665 SymTemp.Misc=0
mov esi,SymTemp+57
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:6666 RETURN
ret
CmdLine:
CmdLineLp:
; LN:6670 ErrNo=0
mov dword [ErrNo],0
; LN:6671 TempStr=NextArg
mov dword edi,TempStr
call __MovArg
; LN:6672 IF LEN(TempStr)=0 THEN
mov esi,TempStr
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl1114
; LN:6673 RETURN
ret
; LN:6674 ENDIF
_Lbl1114:
; LN:6675 IF LEFT$(TempStr,1)="-" THEN
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst943
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl1115
; LN:6676 OptNdx=1
mov dword [OptNdx],1
Option:
; LN:6678 GOSUB ParseOpt
call ParseOpt
; LN:6679 IF LEN(Opt)=0 THEN CmdLineLp
mov esi,Opt
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl1116
jmp CmdLineLp
_Lbl1116:
; LN:6680 SELECT CASE Opt
mov edi,[Opt]
mov [_SwitchStr],edi
mov edi,[Opt+4]
mov [_SwitchStr+4],edi
mov edi,[Opt+8]
mov [_SwitchStr+8],edi
; LN:6681 CASE "1"
mov esi,_StrConst944
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1118
; LN:6682 ExpFlag=$ff
mov byte [ExpFlag],255
; LN:6683 CASE "a"
jmp _Lbl1117
_Lbl1118:
mov esi,_StrConst945
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1119
; LN:6684 AsmOutFlag=$ff
mov byte [AsmOutFlag],255
; LN:6685 CASE "h"
jmp _Lbl1117
_Lbl1119:
mov esi,_StrConst946
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1120
; LN:6686 HaltFlag=$ff
mov byte [HaltFlag],255
; LN:6687 CASE "g"
jmp _Lbl1117
_Lbl1120:
mov esi,_StrConst947
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1121
; LN:6688 GUIFlag=$ff
mov byte [GUIFlag],255
; LN:6689 CASE "d"
jmp _Lbl1117
_Lbl1121:
mov esi,_StrConst948
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1122
; LN:6690 DLLFlag=$ff
mov byte [DLLFlag],255
; LN:6691 CASE "e"
jmp _Lbl1117
_Lbl1122:
mov esi,_StrConst949
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1123
; LN:6692 NoGen=$ff
mov byte [NoGen],255
; LN:6693 CASE "s"
jmp _Lbl1117
_Lbl1123:
mov esi,_StrConst950
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1124
; LN:6694 DumpSyms=$ff
mov byte [DumpSyms],255
; LN:6695 CASE "u"
jmp _Lbl1117
_Lbl1124:
mov esi,_StrConst951
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1125
; LN:6696 UDump=$ff
mov byte [UDump],255
; LN:6697 CASE ELSE
jmp _Lbl1117
_Lbl1125:
; LN:6698 PRINT "Unknown option "';TempStr
mov esi,_StrConst952
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
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
jne _OELbl136
invoke GetLastError
mov [ERR],eax
jmp [_ErrVec]
_OELbl136:
invoke WriteConsole,[_OutHandle],[_CRLF],2,XferCount,NULL
mov [POS],0
; LN:6699 END
xor eax,eax
invoke ExitProcess, eax
; LN:6700 END SELECT
jmp _Lbl1117
_Lbl1126:
_Lbl1117:
; LN:6701 GOTO Option
jmp Option
; LN:6702 ELSE
jmp _Lbl1127
_Lbl1115:
; LN:6703 REM SET Directive
; LN:6704 SrcNdx=0
mov dword [SrcNdx],0
; LN:6705 SrcLine=TempStr
mov edi,SrcLine
mov esi,TempStr
call __MovStr
; LN:6706 SetMask=$80'  simulate FIX
mov byte [SetMask],128
; LN:6707 GOSUB SETDx1
call SETDx1
; LN:6708 ENDIF
_Lbl1127:
; LN:6709 GOTO CmdLineLp
jmp CmdLineLp
; LN:6710 RETURN' Sbtrn delimiter only
ret
ParseOpt:
; LN:6713 INC OptNdx
inc [OptNdx]
; LN:6714 Opt=MID$(TempStr,OptNdx,1)
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [OptNdx]
mov edx,1
call __MidStr
mov edi,Opt
mov esi,_TmpVec1
call __MovStr
; LN:6715 RETURN
ret
CallErr:
; LN:6718 IF StatFlag=$ff THEN
cmp [StatFlag],255
jne _Lbl1128
; LN:6719 RETURN
ret
; LN:6720 ENDIF
_Lbl1128:
; LN:6721 INC OELabelNum
inc [OELabelNum]
; LN:6722 OutBuf="cmp eax,-1"
mov edi,[OutBuf]
mov esi,_StrConst953
call __SetStrConst
; LN:6723 GOSUB OutCode
call OutCode
; LN:6724 OutBuf="jg _OELbl"+STR$(OELabelNum)
mov eax, dword [OELabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst954
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6725 GOSUB OutCode
call OutCode
; LN:6726 OutBuf="invoke GetLastError"
mov edi,[OutBuf]
mov esi,_StrConst955
call __SetStrConst
; LN:6727 GOSUB OutCode
call OutCode
; LN:6728 OutBuf="mov [ERR],eax"
mov edi,[OutBuf]
mov esi,_StrConst956
call __SetStrConst
; LN:6729 GOSUB OutCode
call OutCode
; LN:6730 OutBuf="jmp [_ErrVec]"
mov edi,[OutBuf]
mov esi,_StrConst957
call __SetStrConst
; LN:6731 GOSUB OutCode
call OutCode
; LN:6732 OutBuf="_OELbl"+STR$(OELabelNum)+":"
mov eax, dword [OELabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst958
mov [_TmpVec2],esi
mov [_TmpVec2+4],7
mov [_TmpVec2+8],0
mov esi,_StrConst959
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6733 GOSUB OutCode
call OutCode
; LN:6734 RETURN
ret
CallErrZ:
; LN:6737 IF StatFlag=$ff THEN
cmp [StatFlag],255
jne _Lbl1129
; LN:6738 RETURN
ret
; LN:6739 ENDIF
_Lbl1129:
; LN:6740 INC OELabelNum
inc [OELabelNum]
; LN:6741 OutBuf="cmp eax,0"
mov edi,[OutBuf]
mov esi,_StrConst960
call __SetStrConst
; LN:6742 GOSUB OutCode
call OutCode
; LN:6743 OutBuf="jne _OELbl"+STR$(OELabelNum)
mov eax, dword [OELabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst961
mov [_TmpVec2],esi
mov [_TmpVec2+4],11
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6744 GOSUB OutCode
call OutCode
; LN:6745 OutBuf="invoke GetLastError"
mov edi,[OutBuf]
mov esi,_StrConst962
call __SetStrConst
; LN:6746 GOSUB OutCode
call OutCode
; LN:6747 OutBuf="mov [ERR],eax"
mov edi,[OutBuf]
mov esi,_StrConst963
call __SetStrConst
; LN:6748 GOSUB OutCode
call OutCode
; LN:6749 OutBuf="jmp [_ErrVec]"
mov edi,[OutBuf]
mov esi,_StrConst964
call __SetStrConst
; LN:6750 GOSUB OutCode
call OutCode
; LN:6751 OutBuf="_OELbl"+STR$(OELabelNum)+":"
mov eax, dword [OELabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst965
mov [_TmpVec2],esi
mov [_TmpVec2+4],7
mov [_TmpVec2+8],0
mov esi,_StrConst966
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:6752 GOSUB OutCode
call OutCode
; LN:6753 RETURN
ret
GetAccMod:
; LN:6756 GOSUB NexToken
call NexToken
; LN:6757 IF TokenBuf="dir" THEN
mov esi,_StrConst967
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1130
; LN:6758 DirFlag=$ff
mov byte [DirFlag],255
; LN:6759 GOSUB NexToken
call NexToken
; LN:6760 IF TokenBuf="+" THEN
mov esi,_StrConst968
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1131
; LN:6761 GOSUB NexToken'  eat optional "+"
call NexToken
; LN:6762 ENDIF
_Lbl1131:
; LN:6763 ELSE
jmp _Lbl1132
_Lbl1130:
; LN:6764 DirFlag=0
mov byte [DirFlag],0
; LN:6765 ENDIF
_Lbl1132:
; LN:6766 IF CrOpFlag=$ff THEN
cmp [CrOpFlag],255
jne _Lbl1133
; LN:6767 AccMode="A_WRITE|A_CREAT|A_EXCL"
mov edi,[AccMode]
mov esi,_StrConst969
call __SetStrConst
; LN:6768 ENDIF
_Lbl1133:
; LN:6769 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl1134
; LN:6770 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:6771 CASE "update"
mov esi,_StrConst970
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1136
; LN:6772 IF CrOpFlag=$ff THEN
cmp [CrOpFlag],255
jne _Lbl1137
; LN:6773 'CreatMode="P_WRITE|P_READ"
; LN:6774 ELSE
jmp _Lbl1138
_Lbl1137:
; LN:6775 AccMode="A_UPDATE"
mov edi,[AccMode]
mov esi,_StrConst971
call __SetStrConst
; LN:6776 ENDIF
_Lbl1138:
; LN:6777 CASE "read"
jmp _Lbl1135
_Lbl1136:
mov esi,_StrConst972
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1139
; LN:6778 IF CrOpFlag=$ff THEN
cmp [CrOpFlag],255
jne _Lbl1140
; LN:6779 CreatMode="P_READ"
mov edi,[CreatMode]
mov esi,_StrConst973
call __SetStrConst
; LN:6780 ELSE
jmp _Lbl1141
_Lbl1140:
; LN:6781 AccMode="A_READ"
mov edi,[AccMode]
mov esi,_StrConst974
call __SetStrConst
; LN:6782 ENDIF
_Lbl1141:
; LN:6783 CASE "write"
jmp _Lbl1135
_Lbl1139:
mov esi,_StrConst975
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1142
; LN:6784 IF CrOpFlag=$ff THEN
cmp [CrOpFlag],255
jne _Lbl1143
; LN:6785 CreatMode="P_WRITE|P_READ"
mov edi,[CreatMode]
mov esi,_StrConst976
call __SetStrConst
; LN:6786 ELSE
jmp _Lbl1144
_Lbl1143:
; LN:6787 AccMode="A_WRITE"
mov edi,[AccMode]
mov esi,_StrConst977
call __SetStrConst
; LN:6788 ENDIF
_Lbl1144:
; LN:6789 END SELECT
jmp _Lbl1135
_Lbl1142:
_Lbl1135:
; LN:6790 ELSE
jmp _Lbl1145
_Lbl1134:
AccModErr:
; LN:6792 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:6793 RETURN
ret
; LN:6794 ENDIF
_Lbl1145:
; LN:6795 GOSUB NexToken
call NexToken
; LN:6796 IF TokenLen<>0 THEN' Check this block of code
cmp [TokenLen],0
je _Lbl1146
; LN:6797 IF TokenBuf="+" THEN
mov esi,_StrConst978
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1147
; LN:6798 GOSUB NexToken'  eat optional "+"
call NexToken
; LN:6799 IF TokenBuf="dir" THEN
mov esi,_StrConst979
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1148
; LN:6800 DirFlag=$ff
mov byte [DirFlag],255
; LN:6801 ELSE
jmp _Lbl1149
_Lbl1148:
; LN:6802 IF TokenBuf="binary" THEN
mov esi,_StrConst980
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1150
; LN:6803 AccMode=AccMode+"|A_BINARY"
mov edi,[AccMode]
mov [_TmpVec1],edi
mov edi,[AccMode+4]
mov [_TmpVec1+4],edi
mov edi,[AccMode+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst981
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,AccMode
mov esi,_TmpVec1
call __MovStr
; LN:6804 ELSE
jmp _Lbl1151
_Lbl1150:
; LN:6805 IF TokenBuf="text" THEN
mov esi,_StrConst982
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1152
; LN:6806 'AccMode=AccMode+"|A_TEXT"
; LN:6807 ELSE
jmp _Lbl1153
_Lbl1152:
; LN:6808 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:6809 ENDIF
_Lbl1153:
; LN:6810 ENDIF
_Lbl1151:
; LN:6811 ENDIF
_Lbl1149:
; LN:6812 ENDIF
_Lbl1147:
; LN:6813 ENDIF
_Lbl1146:
; LN:6814 RETURN
ret
GetOpSize:
; LN:6817 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:6818 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1155
; LN:6819 TempInt=1
mov dword [TempInt],1
; LN:6820 CASE BYTEVAR
jmp _Lbl1154
_Lbl1155:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1156
; LN:6821 TempInt=1
mov dword [TempInt],1
; LN:6822 CASE WORDVAR
jmp _Lbl1154
_Lbl1156:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1157
; LN:6823 TempInt=2
mov dword [TempInt],2
; LN:6824 CASE LONGVAR
jmp _Lbl1154
_Lbl1157:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1158
; LN:6825 TempInt=4
mov dword [TempInt],4
; LN:6826 CASE LABELPTR
jmp _Lbl1154
_Lbl1158:
mov eax,16
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1159
; LN:6827 TempInt=4
mov dword [TempInt],4
; LN:6828 CASE FLOATVAR
jmp _Lbl1154
_Lbl1159:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1160
; LN:6829 TempInt=8
mov dword [TempInt],8
; LN:6830 CASE COMPLEX
jmp _Lbl1154
_Lbl1160:
mov eax,14
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1161
; LN:6831 TempInt=SymTable(SymTable(SymNdx).Detail).DataSize
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+40
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov dword [TempInt],eax
; LN:6832 CASE STRINGVAR
jmp _Lbl1154
_Lbl1161:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1162
; LN:6833 TempInt=(SymTable(SymNdx).Detail)
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TempInt],eax
; LN:6834 END SELECT
jmp _Lbl1154
_Lbl1162:
_Lbl1154:
; LN:6835 IF LAND(TDataMod,PointerBit)=PointerBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl1163
; LN:6836 TempInt=4
mov dword [TempInt],4
; LN:6837 ENDIF
_Lbl1163:
; LN:6838 RETURN
ret
DevChk:
; LN:6841 GOSUB NexToken
call NexToken
; LN:6842 IF TokenBuf="#" THEN
mov esi,_StrConst983
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1164
; LN:6843 DevFlag=$ff
mov byte [DevFlag],255
; LN:6844 ELSE
jmp _Lbl1165
_Lbl1164:
; LN:6845 GOSUB UnDoToken
call UnDoToken
; LN:6846 ENDIF
_Lbl1165:
; LN:6847 RETURN
ret
GetPthNum:
; LN:6850 GOSUB NexToken
call NexToken
; LN:6851 GOSUB GetPthNum1
call GetPthNum1
; LN:6852 RETURN
ret
GetPthNum1:
; LN:6855 GOSUB GetExp
call GetExp
; LN:6856 ErrRet
; LN:6856 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1166
; LN:6856 RETURN
ret
; LN:6856 ENDIF
_Lbl1166:
; LN:6857 GOSUB ProcExp
call ProcExp
; LN:6858 ErrRet
; LN:6858 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1167
; LN:6858 RETURN
ret
; LN:6858 ENDIF
_Lbl1167:
; LN:6859 GOSUB GetPthNum2
call GetPthNum2
; LN:6860 RETURN
ret
GetPthNum2:
; LN:6863 GOSUB ClassOp
call ClassOp
; LN:6864 IF TDataType<>LONGVAR THEN
cmp [TDataType],4
je _Lbl1168
; LN:6865 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:6866 RETURN
ret
; LN:6867 ENDIF
_Lbl1168:
; LN:6868 IF Target=0 THEN
cmp [Target],0
jne _Lbl1169
; LN:6869 IF TSymName<>"~" THEN
mov esi,_StrConst984
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1170
; LN:6870 D0Loaded=0
mov byte [D0Loaded],0
; LN:6871 GOSUB LoadReg
call LoadReg
; LN:6872 ErrRet
; LN:6872 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1171
; LN:6872 RETURN
ret
; LN:6872 ENDIF
_Lbl1171:
; LN:6873 ENDIF
_Lbl1170:
; LN:6874 OutBuf="mov [_IOPthNum],eax"
mov edi,[OutBuf]
mov esi,_StrConst985
call __SetStrConst
; LN:6875 GOSUB OutCodeData
call OutCodeData
; LN:6876 ELSE
jmp _Lbl1172
_Lbl1169:
; LN:6877 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl1173
; LN:6878 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6879 RETURN
ret
; LN:6880 ENDIF
_Lbl1173:
; LN:6881 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1174
; LN:6882 PathIsVector=0
mov byte [PathIsVector],0
; LN:6883 PathVar=TSymName
mov edi,PathVar
mov esi,TSymName
call __MovStr
; LN:6884 ELSE
jmp _Lbl1175
_Lbl1174:
; LN:6885 PathIsVector=$ff
mov byte [PathIsVector],255
; LN:6886 PathVar=TSymName
mov edi,PathVar
mov esi,TSymName
call __MovStr
; LN:6887 ENDIF
_Lbl1175:
; LN:6888 ENDIF
_Lbl1172:
; LN:6889 ' The following code makes the "," following the device name
; LN:6890 ' acceptable but not mandatory
; LN:6891 IF FileStat=0 AND KeyNdx<>23 THEN' Not fcn or close
xor bh,bh
xor eax,eax
mov al, byte [FileStat]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov eax, dword [KeyNdx]
mov edx,23
cmp eax,edx
setne bl
and bh,bl
je _Lbl1176
; LN:6892 GOSUB NexToken
call NexToken
; LN:6893 IF TokenBuf<>"," THEN
mov esi,_StrConst986
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1177
; LN:6894 GOSUB UnDoToken
call UnDoToken
; LN:6895 ENDIF
_Lbl1177:
; LN:6896 ENDIF
_Lbl1176:
; LN:6897 RETURN
ret
GetPthNam:
; LN:6900 GOSUB Expr
call Expr
; LN:6901 ErrRet
; LN:6901 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1178
; LN:6901 RETURN
ret
; LN:6901 ENDIF
_Lbl1178:
; LN:6902 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1179
; LN:6903 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:6904 RETURN
ret
; LN:6905 ENDIF
_Lbl1179:
; LN:6906 OutBuf="mov edi,_IOBuffer"
mov edi,[OutBuf]
mov esi,_StrConst987
call __SetStrConst
; LN:6907 GOSUB OutCodeData
call OutCodeData
; LN:6908 OutBuf="mov esi,"+TSymName
mov esi,_StrConst988
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:6909 GOSUB OutCodeData
call OutCodeData
; LN:6910 UseMovStr=TRUE
mov byte [UseMovStr],1
; LN:6911 OutBuf="call __MovStr"
mov edi,[OutBuf]
mov esi,_StrConst989
call __SetStrConst
; LN:6912 GOSUB OutCodeData
call OutCodeData
; LN:6913 RETURN
ret
BufRW:
; LN:6916 BufRWFlg=$ff
mov byte [BufRWFlg],255
; LN:6917 DiskIO=$ff
mov byte [DiskIO],255
; LN:6918 GOSUB GetPthNum
call GetPthNum
; LN:6919 ErrRet
; LN:6919 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1180
; LN:6919 RETURN
ret
; LN:6919 ENDIF
_Lbl1180:
; LN:6920 GOSUB GetIntOp' Get Address
call GetIntOp
; LN:6921 ErrRet
; LN:6921 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1181
; LN:6921 RETURN
ret
; LN:6921 ENDIF
_Lbl1181:
; LN:6922 OutBuf="mov [_XferAddr],eax"
mov edi,[OutBuf]
mov esi,_StrConst990
call __SetStrConst
; LN:6923 GOSUB OutCodeData
call OutCodeData
; LN:6924 CommaRet
; LN:6924 GOSUB GetComma
call GetComma
; LN:6924 ErrRet
; LN:6924 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1182
; LN:6924 RETURN
ret
; LN:6924 ENDIF
_Lbl1182:
; LN:6925 GOSUB GetIntOp' Get # of bytes
call GetIntOp
; LN:6926 ErrRet
; LN:6926 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1183
; LN:6926 RETURN
ret
; LN:6926 ENDIF
_Lbl1183:
; LN:6927 OutBuf="mov [XferCount],eax"
mov edi,[OutBuf]
mov esi,_StrConst991
call __SetStrConst
; LN:6928 GOSUB OutCodeData
call OutCodeData
; LN:6929 RETURN
ret
GetPut:
; LN:6932 DiskIO=$ff
mov byte [DiskIO],255
; LN:6933 GOSUB GetPthNum
call GetPthNum
; LN:6934 ErrRet
; LN:6934 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1184
; LN:6934 RETURN
ret
; LN:6934 ENDIF
_Lbl1184:
; LN:6935 GOSUB Expr
call Expr
; LN:6936 ErrRet
; LN:6936 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1185
; LN:6936 RETURN
ret
; LN:6936 ENDIF
_Lbl1185:
; LN:6937 IF DMConst<>0 THEN
cmp [DMConst],0
je _Lbl1186
; LN:6938 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:6939 RETURN
ret
; LN:6940 ENDIF
_Lbl1186:
; LN:6941 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1187
; LN:6942 GOSUB GetBase
call GetBase
; LN:6943 ENDIF
_Lbl1187:
; LN:6944 OutBuf="mov [_XferAddr],esi"
mov edi,[OutBuf]
mov esi,_StrConst992
call __SetStrConst
; LN:6945 GOSUB OutCodeData
call OutCodeData
; LN:6946 OutBuf="mov [XferCount],"+STR$(SymTemp.DataSize)
mov esi,SymTemp+40
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
mov esi,_StrConst993
mov [_TmpVec3],esi
mov [_TmpVec3+4],17
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:6947 GOSUB OutCodeData
call OutCodeData
; LN:6948 RETURN
ret
ReadWrite:
; LN:6951 DiskIO=$ff
mov byte [DiskIO],255
; LN:6952 GOSUB GetPthNum
call GetPthNum
; LN:6953 ErrRet
; LN:6953 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1188
; LN:6953 RETURN
ret
; LN:6953 ENDIF
_Lbl1188:
; LN:6954 GOSUB Expr
call Expr
; LN:6955 ErrRet
; LN:6955 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1189
; LN:6955 RETURN
ret
; LN:6955 ENDIF
_Lbl1189:
; LN:6956 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1190
; LN:6957 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:6958 ENDIF
_Lbl1190:
; LN:6959 OutBuf="mov [_XferAddr],esi"
mov edi,[OutBuf]
mov esi,_StrConst994
call __SetStrConst
; LN:6960 GOSUB OutCodeData
call OutCodeData
; LN:6961 OutBuf="mov [_ByteCounter],"+STR$(SymTemp.Detail)
mov esi,SymTemp+32
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
mov esi,_StrConst995
mov [_TmpVec3],esi
mov [_TmpVec3+4],20
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:6962 GOSUB OutCodeData
call OutCodeData
; LN:6963 RETURN
ret
GetRegPrm:
; LN:6966 GOSUB GetSymTempExpNdx
call GetSymTempExpNdx
; LN:6967 GOSUB GetRP1
call GetRP1
; LN:6968 RETURN
ret
GetRP1:
; LN:6971 TDataType=SymTemp.DataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:6972 TDataMod=SymTemp.DataMod
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataMod],ax
; LN:6973 IF LAND(SymTemp.DataMod,PointerBit)<>PointerBit THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
setne bl
or bh,bl
je _Lbl1191
; LN:6974 IF TDataType<1 OR TDataType>5 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,1
cmp eax,edx
setl bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,5
cmp eax,edx
setg bl
or bh,bl
je _Lbl1192
; LN:6975 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:6976 RETURN
ret
; LN:6977 ENDIF
_Lbl1192:
; LN:6978 ENDIF
_Lbl1191:
; LN:6979 GOSUB GetDtaTyp
call GetDtaTyp
; LN:6980 IF FloatFlag=0 THEN
cmp [FloatFlag],0
jne _Lbl1193
; LN:6981 Reg0Name="eax"
mov edi,[Reg0Name]
mov esi,_StrConst996
call __SetStrConst
; LN:6982 Reg1Name="edx"
mov edi,[Reg1Name]
mov esi,_StrConst997
call __SetStrConst
; LN:6983 ELSE
jmp _Lbl1194
_Lbl1193:
; LN:6984 Reg0Name="eaxf"
mov edi,[Reg0Name]
mov esi,_StrConst998
call __SetStrConst
; LN:6985 Reg1Name="edxf"
mov edi,[Reg1Name]
mov esi,_StrConst999
call __SetStrConst
; LN:6986 ENDIF
_Lbl1194:
; LN:6987 IF D0Loaded=0 THEN
cmp [D0Loaded],0
jne _Lbl1195
; LN:6988 LdRegName=Reg0Name
mov edi,LdRegName
mov esi,Reg0Name
call __MovStr
; LN:6989 ELSE
jmp _Lbl1196
_Lbl1195:
; LN:6990 LdRegName=Reg1Name
mov edi,LdRegName
mov esi,Reg1Name
call __MovStr
; LN:6991 ENDIF
_Lbl1196:
; LN:6992 RETURN
ret
LoadReg:
; LN:6995 IF Promote=$ff OR Demote=$ff THEN
xor bh,bh
xor eax,eax
mov al, byte [Promote]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Demote]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
je _Lbl1197
; LN:6996 GOSUB SymSrch
call SymSrch
; LN:6997 GOSUB GetSymTemp
call GetSymTemp
; LN:6998 GOSUB GetRP1
call GetRP1
; LN:6999 ELSE
jmp _Lbl1198
_Lbl1197:
; LN:7000 GOSUB GetRegPrm
call GetRegPrm
; LN:7001 ENDIF
_Lbl1198:
; LN:7002 ErrRet
; LN:7002 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1199
; LN:7002 RETURN
ret
; LN:7002 ENDIF
_Lbl1199:
; LN:7003 TDataType=SymTemp.DataType
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:7004 IF D0Loaded=0 THEN
cmp [D0Loaded],0
jne _Lbl1200
; LN:7005 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:7006 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1202
; LN:7007 LdRegName="al"
mov edi,[LdRegName]
mov esi,_StrConst1000
call __SetStrConst
; LN:7008 CASE BYTEVAR
jmp _Lbl1201
_Lbl1202:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1203
; LN:7009 LdRegName="al"
mov edi,[LdRegName]
mov esi,_StrConst1001
call __SetStrConst
; LN:7010 CASE WORDVAR
jmp _Lbl1201
_Lbl1203:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1204
; LN:7011 LdRegName="ax"
mov edi,[LdRegName]
mov esi,_StrConst1002
call __SetStrConst
; LN:7012 CASE LONGVAR
jmp _Lbl1201
_Lbl1204:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1205
; LN:7013 LdRegName="eax"
mov edi,[LdRegName]
mov esi,_StrConst1003
call __SetStrConst
; LN:7014 END SELECT	
jmp _Lbl1201
_Lbl1205:
_Lbl1201:
; LN:7015 ELSE
jmp _Lbl1206
_Lbl1200:
; LN:7016 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:7017 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1208
; LN:7018 LdRegName="dl"
mov edi,[LdRegName]
mov esi,_StrConst1004
call __SetStrConst
; LN:7019 CASE BYTEVAR
jmp _Lbl1207
_Lbl1208:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1209
; LN:7020 LdRegName="dl"
mov edi,[LdRegName]
mov esi,_StrConst1005
call __SetStrConst
; LN:7021 CASE WORDVAR
jmp _Lbl1207
_Lbl1209:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1210
; LN:7022 LdRegName="dx"
mov edi,[LdRegName]
mov esi,_StrConst1006
call __SetStrConst
; LN:7023 CASE LONGVAR
jmp _Lbl1207
_Lbl1210:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1211
; LN:7024 LdRegName="edx"
mov edi,[LdRegName]
mov esi,_StrConst1007
call __SetStrConst
; LN:7025 END SELECT
jmp _Lbl1207
_Lbl1211:
_Lbl1207:
; LN:7026 ENDIF
_Lbl1206:
; LN:7027 IF LAND(ConstBit,SymTemp.DataMod)=ConstBit THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,4
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
je _Lbl1212
; LN:7028 OutBuf="mov "+LdRegName+","+STR$(SymTemp.Detail)
mov esi,SymTemp+32
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
mov esi,_StrConst1008
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov edi,[LdRegName]
mov [_TmpVec4],edi
mov edi,[LdRegName+4]
mov [_TmpVec4+4],edi
mov edi,[LdRegName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1009
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec2
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:7029 ELSE
jmp _Lbl1213
_Lbl1212:
; LN:7030 IF LAND(VectorBit,SymTemp.DataMod)=0 THEN
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,32
mov edi,[_TmpVec1]
xor edx,edx
mov dx, word [edi]
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl1214
; LN:7031 GOSUB ClrDataRegs
call ClrDataRegs
; LN:7032 OutBuf="mov "+LdRegName+","+_DataType+"["+SymTemp.SymName+"]"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1010
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov edi,[LdRegName]
mov [_TmpVec3],edi
mov edi,[LdRegName+4]
mov [_TmpVec3+4],edi
mov edi,[LdRegName+8]
mov [_TmpVec3+8],edi
mov esi,_StrConst1011
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov edi,[_DataType]
mov [_TmpVec5],edi
mov edi,[_DataType+4]
mov [_TmpVec5+4],edi
mov edi,[_DataType+8]
mov [_TmpVec5+8],edi
mov esi,_StrConst1012
mov [_TmpVec6],esi
mov [_TmpVec6+4],2
mov [_TmpVec6+8],0
mov esi,_StrConst1013
mov [_TmpVec7],esi
mov [_TmpVec7+4],2
mov [_TmpVec7+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov esi,_TmpVec1
mov [_TmpVec6+8],esi
mov esi,_TmpVec7
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7033 ELSE
jmp _Lbl1215
_Lbl1214:
; LN:7034 OutBuf="mov edi,["+SymTemp.SymName+"]"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1014
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_StrConst1015
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7035 GOSUB OutCodeData
call OutCodeData
; LN:7036 GOSUB ClrDataRegs
call ClrDataRegs
; LN:7037 OutBuf="mov "+LdRegName+","+_DataType+"[edi]"
mov esi,_StrConst1016
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[LdRegName]
mov [_TmpVec2],edi
mov edi,[LdRegName+4]
mov [_TmpVec2+4],edi
mov edi,[LdRegName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1017
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[_DataType]
mov [_TmpVec4],edi
mov edi,[_DataType+4]
mov [_TmpVec4+4],edi
mov edi,[_DataType+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1018
mov [_TmpVec5],esi
mov [_TmpVec5+4],6
mov [_TmpVec5+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7038 ENDIF
_Lbl1215:
; LN:7039 ENDIF
_Lbl1213:
; LN:7040 D0Loaded=$ff
mov byte [D0Loaded],255
; LN:7041 GOSUB OutCodeData
call OutCodeData
; LN:7042 RETURN
ret
StoreD0:
; LN:7045 SymTemp.SymName=Op1Name
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,Op1Name
call __MovStr
; LN:7046 GOSUB SymSrch
call SymSrch
; LN:7047 TSymName=SymTable(SymNdx).SymName
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TSymName
mov esi,_TmpVec1
call __MovStr
; LN:7048 TDataType=SymTable(SymNdx).DataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataType],ax
; LN:7049 TDataMod=SymTable(SymNdx).DataMod
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov word [TDataMod],ax
; LN:7050 DMConst=0
mov byte [DMConst],0
; LN:7051 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:7052 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1217
; LN:7053 Reg0Name="al"
mov edi,[Reg0Name]
mov esi,_StrConst1019
call __SetStrConst
; LN:7054 OpSizeStr=" byte "
mov edi,[OpSizeStr]
mov esi,_StrConst1020
call __SetStrConst
; LN:7055 CASE BYTEVAR
jmp _Lbl1216
_Lbl1217:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1218
; LN:7056 Reg0Name="al"
mov edi,[Reg0Name]
mov esi,_StrConst1021
call __SetStrConst
; LN:7057 OpSizeStr=" byte "
mov edi,[OpSizeStr]
mov esi,_StrConst1022
call __SetStrConst
; LN:7058 CASE WORDVAR
jmp _Lbl1216
_Lbl1218:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1219
; LN:7059 Reg0Name="ax"
mov edi,[Reg0Name]
mov esi,_StrConst1023
call __SetStrConst
; LN:7060 OpSizeStr=" word "
mov edi,[OpSizeStr]
mov esi,_StrConst1024
call __SetStrConst
; LN:7061 CASE LONGVAR
jmp _Lbl1216
_Lbl1219:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1220
; LN:7062 Reg0Name="eax"
mov edi,[Reg0Name]
mov esi,_StrConst1025
call __SetStrConst
; LN:7063 OpSizeStr=" dword "
mov edi,[OpSizeStr]
mov esi,_StrConst1026
call __SetStrConst
; LN:7064 CASE FLOATVAR
jmp _Lbl1216
_Lbl1220:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1221
; LN:7065 Reg0Name="floatreg"
mov edi,[Reg0Name]
mov esi,_StrConst1027
call __SetStrConst
; LN:7066 OpSizeStr=" qword "
mov edi,[OpSizeStr]
mov esi,_StrConst1028
call __SetStrConst
; LN:7067 END SELECT
jmp _Lbl1216
_Lbl1221:
_Lbl1216:
; LN:7068 IF LAND(TDataMod,PointerBit)<>0 THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1222
; LN:7069 Reg0Name="eax"
mov edi,[Reg0Name]
mov esi,_StrConst1029
call __SetStrConst
; LN:7070 OpSizeStr=" dword "
mov edi,[OpSizeStr]
mov esi,_StrConst1030
call __SetStrConst
; LN:7071 ENDIF
_Lbl1222:
; LN:7072 IF LAND(TDataMod,VectorBit)=0 THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,32
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl1223
; LN:7073 OutBuf="mov"+OpSizeStr+"["+TSymName+"],"+Reg0Name
mov esi,_StrConst1031
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[OpSizeStr]
mov [_TmpVec2],edi
mov edi,[OpSizeStr+4]
mov [_TmpVec2+4],edi
mov edi,[OpSizeStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1032
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1033
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov edi,[Reg0Name]
mov [_TmpVec6],edi
mov edi,[Reg0Name+4]
mov [_TmpVec6+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec6+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7074 ELSE
jmp _Lbl1224
_Lbl1223:
; LN:7075 IF LAND(TDataMod,PointerBit)<>0 THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1225
; LN:7076 Reg0Name="eax"
mov edi,[Reg0Name]
mov esi,_StrConst1034
call __SetStrConst
; LN:7077 OutBuf="mov esi,"+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1035
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7078 GOSUB OutCodeData
call OutCodeData
; LN:7079 ELSE
jmp _Lbl1226
_Lbl1225:
; LN:7080 OutBuf="mov esi,["+SymTemp.SymName+"]"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1036
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_StrConst1037
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7081 GOSUB OutCodeData
call OutCodeData
; LN:7082 ENDIF
_Lbl1226:
; LN:7083 OutBuf="mov"+OpSizeStr+"[esi],"+Reg0Name
mov esi,_StrConst1038
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,[OpSizeStr]
mov [_TmpVec2],edi
mov edi,[OpSizeStr+4]
mov [_TmpVec2+4],edi
mov edi,[OpSizeStr+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1039
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov edi,[Reg0Name]
mov [_TmpVec4],edi
mov edi,[Reg0Name+4]
mov [_TmpVec4+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7084 ENDIF
_Lbl1224:
; LN:7085 GOSUB OutCodeData
call OutCodeData
; LN:7086 RETURN
ret
GetIntTmp:
; LN:7089 OpClass=INTClass
mov byte [OpClass],1
; LN:7090 GOSUB GetTmp
call GetTmp
; LN:7091 RETURN
ret
GetTmp:
; LN:7094 IF TmpUse=NumTemps THEN
cmp [TmpUse],15
jne _Lbl1227
; LN:7095 ErrNo=ErrTmpUse
mov dword [ErrNo],26
; LN:7096 RETURN
ret
; LN:7097 ENDIF
_Lbl1227:
; LN:7098 INC TmpUse
inc [TmpUse]
; LN:7099 IF TmpUse>TmpMax THEN
xor bh,bh
mov eax, dword [TmpUse]
xor edx,edx
mov dl, byte [TmpMax]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1228
; LN:7100 TmpMax=TmpUse
mov eax, dword [TmpUse]
mov [TmpMax],al
; LN:7101 GOSUB VarBlank
call VarBlank
; LN:7102 Comment="Temporary Variable"
mov edi,[Comment]
mov esi,_StrConst1040
call __SetStrConst
; LN:7103 GOSUB BldComment
call BldComment
; LN:7104 GOSUB OutDim
call OutDim
; LN:7105 OutBuf="_Tmp"+STR$(TmpUse)+" rd 1"
mov eax, dword [TmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1041
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst1042
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7106 GOSUB OutDim
call OutDim
; LN:7107 GOSUB VarBlank
call VarBlank
; LN:7108 ENDIF
_Lbl1228:
; LN:7109 SymTemp.SymName="_Tmp"+STR$(TmpUse)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [TmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1043
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec3
call __MovStr
; LN:7110 GOSUB SymSrch
call SymSrch
; LN:7111 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1229
; LN:7112 SymTable(SymNdx).DataType=LONGVAR
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7113 ELSE
jmp _Lbl1230
_Lbl1229:
; LN:7114 SymTable(SymNdx).DataType=TDataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov ax, word [TDataType]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7115 ENDIF
_Lbl1230:
; LN:7116 SymTable(SymNdx).DataSize=TDataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TDataSize]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7117 RETURN
ret
GetFltTmp:
; LN:7120 IF FTmpUse=NumTemps THEN
cmp [FTmpUse],15
jne _Lbl1231
; LN:7121 ErrNo=ErrTmpUse
mov dword [ErrNo],26
; LN:7122 RETURN
ret
; LN:7123 ENDIF
_Lbl1231:
; LN:7124 INC FTmpUse
inc [FTmpUse]
; LN:7125 IF FTmpUse>FTmpMax THEN
xor bh,bh
mov eax, dword [FTmpUse]
xor edx,edx
mov dl, byte [FTmpMax]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1232
; LN:7126 FTmpMax=FTmpUse
mov eax, dword [FTmpUse]
mov [FTmpMax],al
; LN:7127 GOSUB VarBlank
call VarBlank
; LN:7128 Comment="Temporary Floating Point Variable"
mov edi,[Comment]
mov esi,_StrConst1044
call __SetStrConst
; LN:7129 GOSUB BldComment
call BldComment
; LN:7130 GOSUB OutDim
call OutDim
; LN:7131 OutBuf=";static double _FTmp"+STR$(FTmpUse)+";"
mov eax, dword [FTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1045
mov [_TmpVec2],esi
mov [_TmpVec2+4],21
mov [_TmpVec2+8],0
mov esi,_StrConst1046
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7132 GOSUB OutDim
call OutDim
; LN:7133 GOSUB VarBlank
call VarBlank
; LN:7134 ENDIF
_Lbl1232:
; LN:7135 SymTemp.SymName="_FTmp"+STR$(FTmpUse)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [FTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1047
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec3
call __MovStr
; LN:7136 GOSUB SymSrch
call SymSrch
; LN:7137 RETURN
ret
GetStrVec:
; LN:7140 INC StrTmpUse
inc [StrTmpUse]
; LN:7141 IF StrTmpUse>StrTmpMax THEN
xor bh,bh
mov eax, dword [StrTmpUse]
xor edx,edx
mov dl, byte [StrTmpMax]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1233
; LN:7142 StrTmpMax=StrTmpUse
mov eax, dword [StrTmpUse]
mov [StrTmpMax],al
; LN:7143 GOSUB VarBlank
call VarBlank
; LN:7144 Comment="Temporary String Variable"
mov edi,[Comment]
mov esi,_StrConst1048
call __SetStrConst
; LN:7145 GOSUB BldComment
call BldComment
; LN:7146 GOSUB OutDim
call OutDim
; LN:7147 OutBuf="_StrTmp"+STR$(StrTmpUse)+" rb 32"
mov eax, dword [StrTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1049
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov esi,_StrConst1050
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7148 GOSUB OutDim
call OutDim
; LN:7149 GOSUB VarBlank
call VarBlank
; LN:7150 ENDIF
_Lbl1233:
; LN:7151 GOSUB ReqTmpVec
call ReqTmpVec
; LN:7152 ErrRet
; LN:7152 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1234
; LN:7152 RETURN
ret
; LN:7152 ENDIF
_Lbl1234:
; LN:7153 SymTable(SymNdx).DataMod=TmpVec
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,96
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7154 SymTable(SymNdx).DataType=STRINGVAR
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7155 SymTable(SymNdx).Detail=32
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,32
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7156 TempInt=32
mov dword [TempInt],32
; LN:7157 SymTable(SymNdx).DataAddr=0
mov esi,SymTable-(1*60)+36
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7158 SymTable(SymNdx).DataSize=32
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,32
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7159 OutBuf="mov esi,_StrTmp"+STR$(StrTmpUse)
mov eax, dword [StrTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1051
mov [_TmpVec2],esi
mov [_TmpVec2+4],16
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7160 GOSUB OutCodeData
call OutCodeData
; LN:7161 GOSUB SetStrVec
call SetStrVec
; LN:7162 RETURN
ret
GetChrVec:
; LN:7165 INC ChrTmpUse
inc [ChrTmpUse]
; LN:7166 IF ChrTmpUse>ChrTmpMax THEN
xor bh,bh
mov eax, dword [ChrTmpUse]
xor edx,edx
mov dl, byte [ChrTmpMax]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1235
; LN:7167 ChrTmpMax=ChrTmpUse
mov eax, dword [ChrTmpUse]
mov [ChrTmpMax],al
; LN:7168 GOSUB VarBlank
call VarBlank
; LN:7169 Comment="Temporary Character Variable"
mov edi,[Comment]
mov esi,_StrConst1052
call __SetStrConst
; LN:7170 GOSUB BldComment
call BldComment
; LN:7171 GOSUB OutDim
call OutDim
; LN:7172 OutBuf="_ChrTmp"+STR$(ChrTmpUse)+" rb 1"
mov eax, dword [ChrTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1053
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov esi,_StrConst1054
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7173 GOSUB OutDim
call OutDim
; LN:7174 GOSUB VarBlank
call VarBlank
; LN:7175 ENDIF
_Lbl1235:
; LN:7176 GOSUB ReqTmpVec
call ReqTmpVec
; LN:7177 ErrRet
; LN:7177 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1236
; LN:7177 RETURN
ret
; LN:7177 ENDIF
_Lbl1236:
; LN:7178 SymTable(SymNdx).DataMod=TmpVec
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,96
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7179 SymTable(SymNdx).DataType=STRINGVAR
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7180 SymTable(SymNdx).Detail=1
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7181 TempInt=1
mov dword [TempInt],1
; LN:7182 SymTable(SymNdx).DataAddr=0
mov esi,SymTable-(1*60)+36
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7183 SymTable(SymNdx).DataSize=1
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7184 OutBuf="mov esi,_ChrTmp"+STR$(ChrTmpUse)
mov eax, dword [ChrTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1055
mov [_TmpVec2],esi
mov [_TmpVec2+4],16
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7185 GOSUB OutCodeData
call OutCodeData
; LN:7186 GOSUB SetStrVec
call SetStrVec
; LN:7187 RETURN
ret
SetStrVec:
; LN:7190 OutBuf="mov ["+SymTemp.SymName+"],esi"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1056
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1057
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7191 GOSUB OutCodeData
call OutCodeData
; LN:7192 OutBuf="mov ["+SymTemp.SymName+"+4],"+STR$(TempInt)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1058
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_StrConst1059
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:7193 GOSUB OutCodeData
call OutCodeData
; LN:7194 OutBuf="mov ["+SymTemp.SymName+"+8],0"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1060
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1061
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7195 GOSUB OutCodeData
call OutCodeData
; LN:7196 RETURN
ret
ReqTmpVec:
; LN:7199 IF TmpVecUse=NumTemps THEN
cmp [TmpVecUse],15
jne _Lbl1237
; LN:7200 ErrNo=ErrTmpUse
mov dword [ErrNo],26
; LN:7201 RETURN
ret
; LN:7202 ENDIF
_Lbl1237:
; LN:7203 INC TmpVecUse
inc [TmpVecUse]
; LN:7204 IF TmpVecUse>TmpVecMax THEN
xor bh,bh
mov eax, dword [TmpVecUse]
xor edx,edx
mov dl, byte [TmpVecMax]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1238
; LN:7205 TmpVecMax=TmpVecUse
mov eax, dword [TmpVecUse]
mov [TmpVecMax],al
; LN:7206 GOSUB MakTmpVec
call MakTmpVec
; LN:7207 ENDIF
_Lbl1238:
; LN:7208 SymTemp.SymName="_TmpVec"+STR$(TmpVecUse)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [TmpVecUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1062
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec3
call __MovStr
; LN:7209 GOSUB SymSrch
call SymSrch
; LN:7210 SymNdxSaf=SymNdx
mov eax, dword [SymNdx]
mov [SymNdxSaf],eax
; LN:7211 RETURN
ret
GetTmpVec:
; LN:7214 GOSUB ReqTmpVec
call ReqTmpVec
; LN:7215 ErrRet
; LN:7215 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1239
; LN:7215 RETURN
ret
; LN:7215 ENDIF
_Lbl1239:
; LN:7216 SymTable(SymNdx).DataMod=TmpVec
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,96
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7217 SymTable(SymNdx).DataMod=LOR(TDataMod,SymTable(SymNdx).DataMod)
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+30
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
xor eax,eax
mov ax, word [TDataMod]
mov edi,[_TmpVec2]
xor edx,edx
mov dx, word [edi]
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7218 SymTable(SymNdx).DataType=TDataType
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov ax, word [TDataType]
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:7219 SymTable(SymNdx).Detail=TDetail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TDetail]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7220 SymTable(SymNdx).DataAddr=TDataAddr
mov esi,SymTable-(1*60)+36
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TDataAddr]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7221 SymTable(SymNdx).DataSize=TDataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [TDataSize]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7222 RETURN
ret
MakTmpVec:
; LN:7225 GOSUB VarBlank
call VarBlank
; LN:7226 Comment="Temporary Vector"
mov edi,[Comment]
mov esi,_StrConst1063
call __SetStrConst
; LN:7227 GOSUB BldComment
call BldComment
; LN:7228 GOSUB OutDim
call OutDim
; LN:7229 OutBuf="_TmpVec"+STR$(TmpVecUse)+" rd 3"
mov eax, dword [TmpVecUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1064
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov esi,_StrConst1065
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7230 GOSUB OutDim
call OutDim
; LN:7231 RETURN
ret
SetTmpVec:
; LN:7234 GOSUB GetTmpVec
call GetTmpVec
; LN:7235 ErrRet
; LN:7235 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1240
; LN:7235 RETURN
ret
; LN:7235 ENDIF
_Lbl1240:
; LN:7236 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7237 OutBuf="mov edi,["+TSymName+"]"
mov esi,_StrConst1066
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1067
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7238 GOSUB OutCodeData
call OutCodeData
; LN:7239 IF SymTemp.DataType=COMPLEX THEN
mov esi,SymTemp+28
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,14
cmp eax,edx
sete bl
or bh,bl
je _Lbl1241
; LN:7240 OutBuf="add edi,"+STR$(SymTable(ExpTable(ExpNdx+2)).DataAddr)
mov eax, dword [ExpNdx]
mov edx,2
add eax,edx
mov [_Tmp1],eax
mov esi,ExpTable-(1*4)
mov eax, dword [_Tmp1]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+36
mov edi,[_TmpVec1]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec3],esi
mov [_TmpVec3+4],32
mov [_TmpVec3+8],0
mov edi,_TmpVec3
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1068
mov [_TmpVec4],esi
mov [_TmpVec4+4],9
mov [_TmpVec4+8],0
mov esi,_TmpVec3
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec4
call __MovStr
; LN:7241 GOSUB OutCodeData
call OutCodeData
; LN:7242 ENDIF
_Lbl1241:
; LN:7243 OutBuf="mov ["+SymTable(SymNdx).SymName+"],edi"
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1069
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1070
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7244 GOSUB OutCodeData
call OutCodeData
; LN:7245 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1242
; LN:7246 RETURN
ret
; LN:7247 ENDIF
_Lbl1242:
; LN:7248 OutBuf="mov edi,["+TSymName+"+4]"
mov esi,_StrConst1071
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1072
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7249 GOSUB OutCodeData
call OutCodeData
; LN:7250 OutBuf="mov ["+SymTable(SymNdx).SymName+"+4],edi"
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1073
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1074
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7251 GOSUB OutCodeData
call OutCodeData
; LN:7252 OutBuf="mov edi,["+TSymName+"+8]"
mov esi,_StrConst1075
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1076
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7253 GOSUB OutCodeData
call OutCodeData
; LN:7254 OutBuf="mov ["+SymTable(SymNdx).SymName+"+8],edi"
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1077
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1078
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7255 GOSUB OutCodeData
call OutCodeData
; LN:7256 GOSUB ClassOp
call ClassOp
; LN:7257 RETURN
ret
Vectorize:
; LN:7260 GOSUB GetTmpVec
call GetTmpVec
; LN:7261 ErrRet
; LN:7261 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1243
; LN:7261 RETURN
ret
; LN:7261 ENDIF
_Lbl1243:
; LN:7262 GOSUB GetBase
call GetBase
; LN:7263 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7264 OutBuf="mov ["+SymTemp.SymName+"],esi"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1079
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1080
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7265 GOSUB OutCodeData
call OutCodeData
; LN:7266 RETURN
ret
GetLopVec:
; LN:7269 LopVarNdx=0
mov dword [LopVarNdx],0
GetLV1:
; LN:7271 INC LopVarNdx
inc [LopVarNdx]
; LN:7272 IF LopVarNdx=41 THEN
cmp [LopVarNdx],41
jne _Lbl1244
; LN:7273 ErrNo=ErrTmpUse
mov dword [ErrNo],26
; LN:7274 RETURN
ret
; LN:7275 ENDIF
_Lbl1244:
; LN:7276 IF LoopVars(LopVarNdx)=ConStk(ConStkPtr).LoopName THEN GetLV2
mov esi,LoopVars-(1*28)
mov eax, dword [LopVarNdx]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
or bh,bl
je _Lbl1245
jmp GetLV2
_Lbl1245:
; LN:7277 IF LoopVars(LopVarNdx)<>"%" THEN GetLV1
mov esi,LoopVars-(1*28)
mov eax, dword [LopVarNdx]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1081
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1246
jmp GetLV1
_Lbl1246:
; LN:7278 LoopVars(LopVarNdx)=ConStk(ConStkPtr).LoopName
mov esi,LoopVars-(1*28)
mov eax, dword [LopVarNdx]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,ConStk-(1*73)+8
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:7279 GOSUB VarBlank
call VarBlank
; LN:7280 Comment="For Loop Vector"
mov edi,[Comment]
mov esi,_StrConst1082
call __SetStrConst
; LN:7281 GOSUB BldComment
call BldComment
; LN:7282 GOSUB OutDim
call OutDim
; LN:7283 OutBuf="_LopVec"+STR$(LopVarNdx)+" rd 2"
mov eax, dword [LopVarNdx]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1083
mov [_TmpVec2],esi
mov [_TmpVec2+4],8
mov [_TmpVec2+8],0
mov esi,_StrConst1084
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7284 GOSUB OutDim
call OutDim
; LN:7285 GOSUB VarBlank
call VarBlank
GetLV2:
; LN:7287 RETURN
ret
DoAnd:
; LN:7290 IF TDataType=FLOATVAR THEN
cmp [TDataType],5
jne _Lbl1247
; LN:7291 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:7292 ENDIF
_Lbl1247:
; LN:7293 OutBuf="and eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1085
call __SetStrConst
; LN:7294 GOSUB OutCodeData
call OutCodeData
; LN:7295 RETURN
ret
DoOr:
; LN:7298 IF TDataType=FLOATVAR THEN
cmp [TDataType],5
jne _Lbl1248
; LN:7299 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:7300 ENDIF
_Lbl1248:
; LN:7301 OutBuf="or eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1086
call __SetStrConst
; LN:7302 GOSUB OutCodeData
call OutCodeData
; LN:7303 RETURN
ret
DoAdd:
; LN:7306 OutBuf="add "+Reg0Name+","+Reg1Name
mov esi,_StrConst1087
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[Reg0Name]
mov [_TmpVec2],edi
mov edi,[Reg0Name+4]
mov [_TmpVec2+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1088
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[Reg1Name]
mov [_TmpVec4],edi
mov edi,[Reg1Name+4]
mov [_TmpVec4+4],edi
mov edi,[Reg1Name+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7307 GOSUB OutCodeData
call OutCodeData
; LN:7308 RETURN
ret
DoSub:
; LN:7311 OutBuf="sub "+Reg0Name+","+Reg1Name
mov esi,_StrConst1089
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[Reg0Name]
mov [_TmpVec2],edi
mov edi,[Reg0Name+4]
mov [_TmpVec2+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1090
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[Reg1Name]
mov [_TmpVec4],edi
mov edi,[Reg1Name+4]
mov [_TmpVec4+4],edi
mov edi,[Reg1Name+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7312 GOSUB OutCodeData
call OutCodeData
; LN:7313 RETURN
ret
DoMul:
; LN:7316 OutBuf="imul "+Reg1Name
mov esi,_StrConst1091
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[Reg1Name]
mov [_TmpVec2],edi
mov edi,[Reg1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Reg1Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7317 GOSUB OutCodeData
call OutCodeData
; LN:7318 RETURN
ret
DoDiv:
; LN:7321 ' The following is ONLY for integer divide
; LN:7322 OutBuf="mov ecx,edx"
mov edi,[OutBuf]
mov esi,_StrConst1092
call __SetStrConst
; LN:7323 GOSUB OutCodeData
call OutCodeData
; LN:7324 OutBuf="xor edx,edx"
mov edi,[OutBuf]
mov esi,_StrConst1093
call __SetStrConst
; LN:7325 GOSUB OutCodeData
call OutCodeData
; LN:7326 OutBuf="idiv ecx"
mov edi,[OutBuf]
mov esi,_StrConst1094
call __SetStrConst
; LN:7327 GOSUB OutCodeData
call OutCodeData
; LN:7328 RETURN
ret
CmpNum:
; LN:7331 D0Loaded=0
mov byte [D0Loaded],0
; LN:7332 Promote=$ff
mov byte [Promote],255
; LN:7333 SymTemp.SymName=Op1Name
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,Op1Name
call __MovStr
; LN:7334 GOSUB LoadReg
call LoadReg
; LN:7335 SymTemp.SymName=Op2Name
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,Op2Name
call __MovStr
; LN:7336 GOSUB LoadReg
call LoadReg
; LN:7337 IF TDataType=BOOLVAR THEN
cmp [TDataType],1
jne _Lbl1249
; LN:7338 OutBuf="cmp al,dl"
mov edi,[OutBuf]
mov esi,_StrConst1095
call __SetStrConst
; LN:7339 ELSE
jmp _Lbl1250
_Lbl1249:
; LN:7340 OutBuf="cmp "+Reg0Name+","+Reg1Name
mov esi,_StrConst1096
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[Reg0Name]
mov [_TmpVec2],edi
mov edi,[Reg0Name+4]
mov [_TmpVec2+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1097
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[Reg1Name]
mov [_TmpVec4],edi
mov edi,[Reg1Name+4]
mov [_TmpVec4+4],edi
mov edi,[Reg1Name+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7341 ENDIF
_Lbl1250:
; LN:7342 GOSUB OutCodeData
call OutCodeData
; LN:7343 OutBuf=SymType+"bl"
mov edi,[SymType]
mov [_TmpVec1],edi
mov edi,[SymType+4]
mov [_TmpVec1+4],edi
mov edi,[SymType+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst1098
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7344 GOSUB OutCodeData
call OutCodeData
; LN:7345 RETURN
ret
CmpString:
; LN:7348 OutBuf="mov edi,"+Op1Name
mov esi,_StrConst1099
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op1Name]
mov [_TmpVec2],edi
mov edi,[Op1Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op1Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7349 GOSUB OutCodeData
call OutCodeData
; LN:7350 OutBuf="mov esi,"+Op2Name
mov esi,_StrConst1100
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[Op2Name]
mov [_TmpVec2],edi
mov edi,[Op2Name+4]
mov [_TmpVec2+4],edi
mov edi,[Op2Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7351 GOSUB OutCodeData
call OutCodeData
; LN:7352 UseCmpStr=TRUE
mov byte [UseCmpStr],1
; LN:7353 OutBuf="call __CmpStr"
mov edi,[OutBuf]
mov esi,_StrConst1101
call __SetStrConst
; LN:7354 GOSUB OutCodeData
call OutCodeData
; LN:7355 OutBuf=SymType+"bl"
mov edi,[SymType]
mov [_TmpVec1],edi
mov edi,[SymType+4]
mov [_TmpVec1+4],edi
mov edi,[SymType+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst1102
mov [_TmpVec2],esi
mov [_TmpVec2+4],3
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:7356 GOSUB OutCodeData
call OutCodeData
; LN:7357 RETURN
ret
NexToken:
; LN:7360 ExpEnd=0
mov byte [ExpEnd],0
; LN:7361 TokenLen=0
mov byte [TokenLen],0
; LN:7362 TokenType=0
mov byte [TokenType],0
; LN:7363 QuoteFlg=0
mov byte [QuoteFlg],0
; LN:7364 NextByte=""
mov [NextByte+12],0
; LN:7365 TokenBuf=""
mov [TokenBuf+12],0
; LN:7366 TokenSaf=""
mov [TokenSaf+12],0
NexToken1:
; LN:7368 INC SrcNdx
inc [SrcNdx]
; LN:7369 IF SrcNdx>LEN(SrcLine) THEN NexToken5
mov esi,SrcLine
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [SrcNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1251
jmp NexToken5
_Lbl1251:
; LN:7370 TempByte=MID$(SrcLine,SrcNdx,1)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [SrcNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7371 NextByte=MID$(SrcLine,SrcNdx+1,1)
mov eax, dword [SrcNdx]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp1]
mov edx,1
call __MidStr
mov edi,NextByte
mov esi,_TmpVec1
call __MovStr
; LN:7372 AsciiByte=ASC(TempByte)
mov esi,[TempByte]
mov al, byte [esi]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:7373 IF AsciiByte=OBQUOTE AND EscSeq=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
mov edx,34
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [EscSeq]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1252
; LN:7374 IF QuoteFlg=0 AND TokenLen<>0 THEN NexToken5
xor bh,bh
xor eax,eax
mov al, byte [QuoteFlg]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [TokenLen]
mov edx,0
cmp eax,edx
setne bl
and bh,bl
je _Lbl1253
jmp NexToken5
_Lbl1253:
; LN:7375 GOSUB NexToken3
call NexToken3
; LN:7376 IF QuoteFlg=1 THEN
cmp [QuoteFlg],1
jne _Lbl1254
; LN:7377 TokenType=TTypQuote
mov byte [TokenType],4
; LN:7378 GOTO NexToken6
jmp NexToken6
; LN:7379 ELSE
jmp _Lbl1255
_Lbl1254:
; LN:7380 QuoteFlg=1
mov byte [QuoteFlg],1
; LN:7381 EscSeq=0
mov byte [EscSeq],0
; LN:7382 GOTO NexToken1
jmp NexToken1
; LN:7383 ENDIF
_Lbl1255:
; LN:7384 ENDIF
_Lbl1252:
; LN:7385 IF QuoteFlg=1 THEN
cmp [QuoteFlg],1
jne _Lbl1256
; LN:7386 IF EscSeq=$ff THEN
cmp [EscSeq],255
jne _Lbl1257
; LN:7387 EscSeq=0
mov byte [EscSeq],0
; LN:7388 ELSE
jmp _Lbl1258
_Lbl1257:
; LN:7389 IF AsciiByte=$5c THEN
cmp [AsciiByte],92
jne _Lbl1259
; LN:7390 EscSeq=$ff
mov byte [EscSeq],255
; LN:7391 ENDIF
_Lbl1259:
; LN:7392 ENDIF
_Lbl1258:
; LN:7393 GOSUB NexToken3
call NexToken3
; LN:7394 GOTO NexToken1
jmp NexToken1
; LN:7395 ENDIF
_Lbl1256:
; LN:7396 IF TempByte="." THEN
mov esi,_StrConst1103
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1260
; LN:7397 IF TokenType=TTypInt THEN
cmp [TokenType],6
jne _Lbl1261
; LN:7398 TokenType=TTypFloat
mov byte [TokenType],10
; LN:7399 GOSUB NexToken3
call NexToken3
; LN:7400 GOTO NexToken1
jmp NexToken1
; LN:7401 ENDIF
_Lbl1261:
; LN:7402 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl1262
; LN:7403 IF NextByte>="0" AND NextByte<="9" THEN
mov esi,_StrConst1104
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1105
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1263
; LN:7404 TokenType=TTypFloat
mov byte [TokenType],10
; LN:7405 GOSUB NexToken3
call NexToken3
; LN:7406 GOTO NexToken1
jmp NexToken1
; LN:7407 ENDIF
_Lbl1263:
; LN:7408 ENDIF
_Lbl1262:
; LN:7409 ENDIF
_Lbl1260:
; LN:7410 IF TempByte="'" OR TempByte=";" THEN NexToken5' Remark
mov esi,_StrConst1106
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1107
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1264
jmp NexToken5
_Lbl1264:
; LN:7411 IF TempByte="<" OR TempByte=">" OR TempByte="=" THEN
mov esi,_StrConst1108
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1109
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1110
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1265
; LN:7412 IF TokenLen<>0 THEN NexToken5
cmp [TokenLen],0
jne NexToken5
; LN:7413 TokenType=TTypRelOp
mov byte [TokenType],1
; LN:7414 GOSUB NexToken3
call NexToken3
; LN:7415 IF TempByte="=" THEN
mov esi,_StrConst1111
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1267
; LN:7416 GOTO NexToken6
jmp NexToken6
; LN:7417 ENDIF
_Lbl1267:
; LN:7418 IF NextByte=">" OR NextByte="=" THEN
mov esi,_StrConst1112
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1113
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1268
; LN:7419 INC SrcNdx
inc [SrcNdx]
; LN:7420 TempByte=MID$(SrcLine,SrcNdx,1)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [SrcNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7421 GOSUB NexToken3
call NexToken3
; LN:7422 ENDIF
_Lbl1268:
; LN:7423 GOTO NexToken6
jmp NexToken6
; LN:7424 ENDIF
_Lbl1265:
; LN:7425 IF AsciiByte=$20 OR AsciiByte=$09 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
mov edx,32
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [AsciiByte]
mov edx,9
cmp eax,edx
sete bl
or bh,bl
je _Lbl1269
; LN:7426 IF TokenLen<>0 THEN
cmp [TokenLen],0
je _Lbl1270
; LN:7427 DEC SrcNdx
dec [SrcNdx]
; LN:7428 NextByte=" "
mov esi,_StrConst1114
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __MovStr
; LN:7429 ExpEnd=$ff
mov byte [ExpEnd],255
; LN:7430 GOTO NexTokDone
jmp NexTokDone
; LN:7431 ENDIF
_Lbl1270:
; LN:7432 GOTO NexToken1
jmp NexToken1
; LN:7433 ENDIF
_Lbl1269:
; LN:7434 IF DimFlag=0 THEN
cmp [DimFlag],0
jne _Lbl1271
; LN:7435 IF TempByte="(" OR TempByte=")" THEN
mov esi,_StrConst1115
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1116
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1272
; LN:7436 IF TokenLen<>0 THEN NexToken5
cmp [TokenLen],0
jne NexToken5
; LN:7437 GOSUB NexToken3
call NexToken3
; LN:7438 TokenType=TTypParen
mov byte [TokenType],8
; LN:7439 GOTO NexToken6
jmp NexToken6
; LN:7440 ENDIF
_Lbl1272:
; LN:7441 ENDIF
_Lbl1271:
; LN:7442 IF DimFlag=0 OR TempByte<>"," THEN'  special cond for multi-dim array
xor bh,bh
xor eax,eax
mov al, byte [DimFlag]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst1117
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1274
; LN:7443 IF TempByte="," OR TempByte=";" OR TempByte=":" OR TempByte="." THEN
mov esi,_StrConst1118
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1119
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1120
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1121
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1275
; LN:7444 IF TokenLen<>0 THEN NexToken5
cmp [TokenLen],0
jne NexToken5
; LN:7445 GOSUB NexToken3
call NexToken3
; LN:7446 TokenType=TTypPunct
mov byte [TokenType],2
; LN:7447 GOTO NexToken6
jmp NexToken6
; LN:7448 ENDIF
_Lbl1275:
; LN:7449 ENDIF
_Lbl1274:
; LN:7450 IF TempByte="+" OR TempByte="-" OR TempByte="*" OR TempByte="/"  OR TempByte="&" OR TempByte="|" THEN
mov esi,_StrConst1122
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1123
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1124
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1125
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1126
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1127
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1277
; LN:7451 IF TokenLen<>0 THEN NexToken5
cmp [TokenLen],0
jne NexToken5
; LN:7452 GOSUB NexToken3
call NexToken3
; LN:7453 TokenType=TTypMath
mov byte [TokenType],3
; LN:7454 GOTO NexToken6
jmp NexToken6
; LN:7455 ENDIF
_Lbl1277:
; LN:7456 IF DimFlag=$ff THEN NexToken2
cmp [DimFlag],255
je NexToken2
; LN:7457 IF TempByte="$" OR TempByte="_" OR TempByte="@" THEN NexToken2
mov esi,_StrConst1128
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1129
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1130
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1280
jmp NexToken2
_Lbl1280:
; LN:7458 IF TempByte>="0" AND TempByte<="9" THEN NexToken2
mov esi,_StrConst1131
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1132
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1281
jmp NexToken2
_Lbl1281:
; LN:7459 IF TempByte>="A" AND TempByte<="Z" THEN NexToken2
mov esi,_StrConst1133
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1134
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1282
jmp NexToken2
_Lbl1282:
; LN:7460 IF TempByte>="a" AND TempByte<="z" THEN NexToken2
mov esi,_StrConst1135
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1136
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1283
jmp NexToken2
_Lbl1283:
; LN:7461 IF TokenLen<>0 THEN NexToken5
cmp [TokenLen],0
jne NexToken5
; LN:7462 GOSUB NexToken3
call NexToken3
; LN:7463 TokenType=TTypMisc
mov byte [TokenType],9
; LN:7464 GOTO NexToken6
jmp NexToken6
NexToken2:
; LN:7466 GOSUB NexToken3
call NexToken3
; LN:7467 GOTO NexToken1
jmp NexToken1
NexToken5:
; LN:7469 DEC SrcNdx
dec [SrcNdx]
; LN:7470 NextByte=MID$(SrcLine,SrcNdx+1,1)
mov eax, dword [SrcNdx]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp1]
mov edx,1
call __MidStr
mov edi,NextByte
mov esi,_TmpVec1
call __MovStr
NexToken6:
; LN:7472 IF NextByte=" " OR ASC(NextByte)=9 OR NextByte=":" OR NextByte=";" THEN
mov esi,_StrConst1137
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,[NextByte]
mov al, byte [esi]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,9
cmp eax,edx
sete bl
or bh,bl
mov esi,_StrConst1138
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1139
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1285
; LN:7473 ExpEnd=$ff
mov byte [ExpEnd],255
; LN:7474 ENDIF
_Lbl1285:
; LN:7475 IF NextByte="<" OR NextByte=">" OR NextByte="=" OR NextByte="" OR NextByte="'" THEN
mov esi,_StrConst1140
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1141
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1142
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov edi,NextByte
mov esi,_NullStr
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1143
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1286
; LN:7476 ExpEnd=$ff
mov byte [ExpEnd],255
; LN:7477 ENDIF
_Lbl1286:
NexTokDone:
; LN:7479 IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="h" THEN' Intel hex->Motorola
xor bh,bh
xor eax,eax
mov al, byte [TokenType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
call __RightStr
mov esi,_StrConst1144
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
and bh,bl
je _Lbl1287
; LN:7480 IF LEFT$(TokenBuf,1)<>"0" THEN
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1145
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1288
; LN:7481 TokenSaf="$"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp2]
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1146
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7482 ELSE
jmp _Lbl1289
_Lbl1288:
; LN:7483 TokenSaf="$"+MID$(TokenBuf,2,LEN(TokenBuf)-2)' removes leading 0
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov esi,_StrConst1147
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7484 ENDIF
_Lbl1289:
; LN:7485 TokenBuf=TokenSaf
mov edi,TokenBuf
mov esi,TokenSaf
call __MovStr
; LN:7486 TokenType=TTypHex
mov byte [TokenType],7
; LN:7487 ENDIF
_Lbl1287:
; LN:7488 IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="o" THEN' Intel hex->Motorola
xor bh,bh
xor eax,eax
mov al, byte [TokenType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
call __RightStr
mov esi,_StrConst1148
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
and bh,bl
je _Lbl1290
; LN:7489 IF LEFT$(TokenBuf,1)<>"0" THEN
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1149
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1291
; LN:7490 TokenSaf="%"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp2]
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1150
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7491 ELSE
jmp _Lbl1292
_Lbl1291:
; LN:7492 TokenSaf="%"+MID$(TokenBuf,2,LEN(TokenBuf)-2)' removes leading 0
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov esi,_StrConst1151
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7493 ENDIF
_Lbl1292:
; LN:7494 TokenBuf=TokenSaf
mov edi,TokenBuf
mov esi,TokenSaf
call __MovStr
; LN:7495 TokenType=TTypOct
mov byte [TokenType],11
; LN:7496 ENDIF
_Lbl1290:
; LN:7497 IF TokenType=TTypInt AND RIGHT$(TokenBuf,1)="b" THEN' Intel hex->Motorola
xor bh,bh
xor eax,eax
mov al, byte [TokenType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
call __RightStr
mov esi,_StrConst1152
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
and bh,bl
je _Lbl1293
; LN:7498 IF LEFT$(TokenBuf,1)<>"0" THEN
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1153
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1294
; LN:7499 TokenSaf="&"+LEFT$(TokenBuf,LEN(TokenBuf)-1)
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,1
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [_Tmp2]
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1154
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7500 ELSE
jmp _Lbl1295
_Lbl1294:
; LN:7501 TokenSaf="&"+MID$(TokenBuf,2,LEN(TokenBuf)-2)' removes leading 0
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx, dword [_Tmp2]
call __MidStr
mov esi,_StrConst1155
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7502 ENDIF
_Lbl1295:
; LN:7503 TokenBuf=TokenSaf
mov edi,TokenBuf
mov esi,TokenSaf
call __MovStr
; LN:7504 TokenType=TTypBin
mov byte [TokenType],12
; LN:7505 ENDIF
_Lbl1293:
; LN:7506 IF TokenType=TTypInt AND MID$(TokenBuf,2,1)="x" THEN' C hex->Motorala
xor bh,bh
xor eax,eax
mov al, byte [TokenType]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,2
mov edx,1
call __MidStr
mov esi,_StrConst1156
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
sete bl
and bh,bl
je _Lbl1296
; LN:7507 TokenSaf="$"+MID$(TokenBuf,3,LEN(TokenBuf)-2)
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov edx,2
sub eax,edx
mov [_Tmp2],eax
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,3
mov edx, dword [_Tmp2]
call __MidStr
mov esi,_StrConst1157
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,TokenSaf
mov esi,_TmpVec2
call __MovStr
; LN:7508 TokenBuf=TokenSaf
mov edi,TokenBuf
mov esi,TokenSaf
call __MovStr
; LN:7509 TokenType=TTypHex
mov byte [TokenType],7
; LN:7510 ENDIF
_Lbl1296:
; LN:7511 RETURN
ret
NexToken3:
; LN:7514 INC TokenLen
inc [TokenLen]
; LN:7515 TokenSaf=TokenSaf+TempByte
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov edi,[TempByte]
mov [_TmpVec2],edi
mov edi,[TempByte+4]
mov [_TmpVec2+4],edi
mov edi,[TempByte+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TokenSaf
mov esi,_TmpVec1
call __MovStr
; LN:7516 IF TempByte>="A" AND TempByte<="Z" THEN
mov esi,_StrConst1158
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1159
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1297
; LN:7517 AsciiByte=LOR(AsciiByte,$20)
xor eax,eax
mov al, byte [AsciiByte]
mov edx,32
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:7518 TempByte=CHR$(AsciiByte)
xor eax,eax
mov al, byte [AsciiByte]
mov esi,_ChrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],1
mov [_TmpVec1+8],0
mov [_ChrTmp1],al
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7519 ENDIF
_Lbl1297:
; LN:7520 TokenBuf=TokenBuf+TempByte
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov edi,[TempByte]
mov [_TmpVec2],edi
mov edi,[TempByte+4]
mov [_TmpVec2+4],edi
mov edi,[TempByte+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TokenBuf
mov esi,_TmpVec1
call __MovStr
; LN:7521 IF TokenLen=1 THEN
cmp [TokenLen],1
jne _Lbl1298
; LN:7522 IF TokenBuf="$" THEN
mov esi,_StrConst1160
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1299
; LN:7523 TokenType=TTypHex
mov byte [TokenType],7
; LN:7524 ENDIF
_Lbl1299:
; LN:7525 IF TokenBuf>="0" AND TokenBuf<="9" THEN
mov esi,_StrConst1161
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1162
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1300
; LN:7526 TokenType=TTypInt
mov byte [TokenType],6
; LN:7527 ENDIF
_Lbl1300:
; LN:7528 IF TokenBuf>="a" AND TokenBuf<="z" OR TokenBuf="_" THEN
mov esi,_StrConst1163
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1164
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
mov esi,_StrConst1165
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1301
; LN:7529 TokenType=TTypSym
mov byte [TokenType],5
; LN:7530 ENDIF
_Lbl1301:
; LN:7531 ENDIF
_Lbl1298:
; LN:7532 RETURN
ret
UnDoToken:
; LN:7535 SrcNdx=SrcNdx-TokenLen
mov eax, dword [SrcNdx]
xor edx,edx
mov dl, byte [TokenLen]
sub eax,edx
mov dword [SrcNdx],eax
; LN:7536 NextByte=""
mov [NextByte+12],0
; LN:7537 RETURN
ret
MacToken:
; LN:7540 TokenLen=0
mov byte [TokenLen],0
; LN:7541 TokenSaf=""
mov [TokenSaf+12],0
MacToken1:
; LN:7543 INC SrcNdx
inc [SrcNdx]
; LN:7544 TempByte=MID$(SrcLine,SrcNdx,1)
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [SrcNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7545 AsciiByte=ASC(TempByte)
mov esi,[TempByte]
mov al, byte [esi]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:7546 IF AsciiByte=NewLine OR AsciiByte=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
xor edx,edx
mov dl, byte [NewLine]
cmp eax,edx
sete bl
or bh,bl
mov al, byte [AsciiByte]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
je _Lbl1302
; LN:7547 DEC SrcNdx
dec [SrcNdx]
; LN:7548 RETURN
ret
; LN:7549 ENDIF
_Lbl1302:
; LN:7550 IF AsciiByte=$2c THEN'  comma
cmp [AsciiByte],44
jne _Lbl1303
; LN:7551 IF TokenLen=0 THEN
cmp [TokenLen],0
jne _Lbl1304
; LN:7552 TokenSaf=TempByte
mov edi,TokenSaf
mov esi,TempByte
call __MovStr
; LN:7553 TokenLen=1
mov byte [TokenLen],1
; LN:7554 ELSE
jmp _Lbl1305
_Lbl1304:
; LN:7555 DEC SrcNdx
dec [SrcNdx]
; LN:7556 ENDIF
_Lbl1305:
; LN:7557 RETURN
ret
; LN:7558 ENDIF
_Lbl1303:
; LN:7559 TokenSaf=TokenSaf+TempByte
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov edi,[TempByte]
mov [_TmpVec2],edi
mov edi,[TempByte+4]
mov [_TmpVec2+4],edi
mov edi,[TempByte+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,TokenSaf
mov esi,_TmpVec1
call __MovStr
; LN:7560 INC TokenLen
inc [TokenLen]
; LN:7561 GOTO MacToken1
jmp MacToken1
ValidSym:
; LN:7564 SymbolOK=0
mov byte [SymbolOK],0
; LN:7565 IF LEN(RootSym)>28 THEN
mov esi,RootSym
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,28
cmp eax,edx
setg bl
or bh,bl
je _Lbl1306
; LN:7566 RETURN
ret
; LN:7567 ENDIF
_Lbl1306:
; LN:7568 IF LNFlag=0 THEN NotLineNum
cmp [LNFlag],0
je NotLineNum
; LN:7569 IF LEN(RootSym)>5 THEN NotLineNum
mov esi,RootSym
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,5
cmp eax,edx
setg bl
or bh,bl
je _Lbl1308
jmp NotLineNum
_Lbl1308:
; LN:7570 TempByte=MID$(RootSym,1,1)
mov edi,[RootSym]
mov [_TmpVec1],edi
mov edi,[RootSym+4]
mov [_TmpVec1+4],edi
mov edi,[RootSym+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7571 IF TempByte<"0" OR TempByte>"9" THEN NotLineNum
mov esi,_StrConst1166
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setl bl
or bh,bl
mov esi,_StrConst1167
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setg bl
or bh,bl
je _Lbl1309
jmp NotLineNum
_Lbl1309:
; LN:7572 LabNdx=1
mov dword [LabNdx],1
BldLineNumLbl:
; LN:7574 INC LabNdx
inc [LabNdx]
; LN:7575 IF LabNdx>LEN(RootSym) THEN
mov esi,RootSym
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [LabNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1310
; LN:7576 SymbolSaf="_LN"
mov edi,[SymbolSaf]
mov esi,_StrConst1168
call __SetStrConst
; LN:7577 SymbolSaf=SymbolSaf+RootSym
mov edi,[SymbolSaf]
mov [_TmpVec1],edi
mov edi,[SymbolSaf+4]
mov [_TmpVec1+4],edi
mov edi,[SymbolSaf+8]
mov [_TmpVec1+8],edi
mov edi,[RootSym]
mov [_TmpVec2],edi
mov edi,[RootSym+4]
mov [_TmpVec2+4],edi
mov edi,[RootSym+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,SymbolSaf
mov esi,_TmpVec1
call __MovStr
; LN:7578 SymbolOK=$ff
mov byte [SymbolOK],255
; LN:7579 RETURN
ret
; LN:7580 ENDIF
_Lbl1310:
; LN:7581 TempByte=MID$(RootSym,LabNdx,1)
mov edi,[RootSym]
mov [_TmpVec1],edi
mov edi,[RootSym+4]
mov [_TmpVec1+4],edi
mov edi,[RootSym+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [LabNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7582 IF TempByte<"0" OR TempByte>"9" THEN
mov esi,_StrConst1169
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setl bl
or bh,bl
mov esi,_StrConst1170
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setg bl
or bh,bl
je _Lbl1311
; LN:7583 RETURN
ret
; LN:7584 ENDIF
_Lbl1311:
; LN:7585 GOTO BldLineNumLbl
jmp BldLineNumLbl
NotLineNum:
; LN:7587 LabNdx=1
mov dword [LabNdx],1
; LN:7588 TempByte=MID$(RootSym,1,1)
mov edi,[RootSym]
mov [_TmpVec1],edi
mov edi,[RootSym+4]
mov [_TmpVec1+4],edi
mov edi,[RootSym+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7589 IF TempByte>="A" AND TempByte<="Z" THEN ValidSymLoop
mov esi,_StrConst1171
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1172
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1312
jmp ValidSymLoop
_Lbl1312:
; LN:7590 IF TempByte>="a" AND TempByte<="z" THEN ValidSymLoop
mov esi,_StrConst1173
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1174
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1313
jmp ValidSymLoop
_Lbl1313:
; LN:7591 IF TempByte="_" THEN ValidSymLoop
mov esi,_StrConst1175
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1314
jmp ValidSymLoop
_Lbl1314:
; LN:7592 RETURN
ret
ValidSymLoop:
; LN:7594 INC LabNdx
inc [LabNdx]
; LN:7595 IF LabNdx>LEN(RootSym) THEN
mov esi,RootSym
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [LabNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1315
; LN:7596 SymbolOK=$ff
mov byte [SymbolOK],255
; LN:7597 SymbolSaf=RootSym
mov edi,SymbolSaf
mov esi,RootSym
call __MovStr
; LN:7598 RETURN
ret
; LN:7599 ENDIF
_Lbl1315:
; LN:7600 TempByte=MID$(RootSym,LabNdx,1)
mov edi,[RootSym]
mov [_TmpVec1],edi
mov edi,[RootSym+4]
mov [_TmpVec1+4],edi
mov edi,[RootSym+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [LabNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7601 IF TempByte>="0" AND TempByte<="9" THEN ValidSymLoop
mov esi,_StrConst1176
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1177
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1316
jmp ValidSymLoop
_Lbl1316:
; LN:7602 IF TempByte>="A" AND TempByte<="Z" THEN ValidSymLoop
mov esi,_StrConst1178
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1179
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1317
jmp ValidSymLoop
_Lbl1317:
; LN:7603 IF TempByte>="a" AND TempByte<="z" THEN ValidSymLoop
mov esi,_StrConst1180
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1181
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1318
jmp ValidSymLoop
_Lbl1318:
; LN:7604 IF TempByte="_" THEN ValidSymLoop
mov esi,_StrConst1182
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1319
jmp ValidSymLoop
_Lbl1319:
; LN:7605 IF TempByte="$" AND LabNdx=LEN(RootSym) THEN ValidSymLoop
mov esi,_StrConst1183
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,RootSym
call __StrLen
mov [_Tmp1],eax
mov eax, dword [LabNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
sete bl
and bh,bl
je _Lbl1320
jmp ValidSymLoop
_Lbl1320:
; LN:7606 RETURN
ret
ValidInt:
; LN:7609 IntOK=0
mov byte [IntOK],0
; LN:7610 IF LEN(TokenBuf)>10 THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,10
cmp eax,edx
setg bl
or bh,bl
je _Lbl1321
; LN:7611 RETURN
ret
; LN:7612 ENDIF
_Lbl1321:
; LN:7613 ValidNdx=0
mov dword [ValidNdx],0
ValidIntLoop:
; LN:7615 INC ValidNdx
inc [ValidNdx]
; LN:7616 IF ValidNdx>LEN(TokenBuf) THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [ValidNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1322
; LN:7617 IntOK=$ff
mov byte [IntOK],255
; LN:7618 RETURN
ret
; LN:7619 ENDIF
_Lbl1322:
; LN:7620 TempByte=MID$(TokenBuf,ValidNdx,1)
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [ValidNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7621 IF TempByte>="0" AND TempByte<="9" THEN ValidIntLoop
mov esi,_StrConst1184
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1185
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1323
jmp ValidIntLoop
_Lbl1323:
; LN:7622 RETURN
ret
ValidHex:
; LN:7625 HexOK=0
mov byte [HexOK],0
; LN:7626 IF LEN(TokenBuf)>9 THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,9
cmp eax,edx
setg bl
or bh,bl
je _Lbl1324
; LN:7627 RETURN
ret
; LN:7628 ENDIF
_Lbl1324:
; LN:7629 ValidNdx=1
mov dword [ValidNdx],1
ValidHexLoop:
; LN:7631 INC ValidNdx
inc [ValidNdx]
; LN:7632 IF ValidNdx>LEN(TokenBuf) THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [ValidNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1325
; LN:7633 HexOK=$ff
mov byte [HexOK],255
; LN:7634 RETURN
ret
; LN:7635 ENDIF
_Lbl1325:
; LN:7636 TempByte=MID$(TokenBuf,ValidNdx,1)
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [ValidNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7637 IF TempByte>="0" AND TempByte<="9" THEN ValidHexLoop
mov esi,_StrConst1186
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1187
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1326
jmp ValidHexLoop
_Lbl1326:
; LN:7638 IF TempByte>="a" AND TempByte<="f" THEN ValidHexLoop
mov esi,_StrConst1188
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1189
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1327
jmp ValidHexLoop
_Lbl1327:
; LN:7639 RETURN
ret
ValidFlt:
; LN:7642 OneDot=0
mov byte [OneDot],0
; LN:7643 FloatOK=0
mov byte [FloatOK],0
; LN:7644 IF LEN(TokenBuf)>21 THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,21
cmp eax,edx
setg bl
or bh,bl
je _Lbl1328
; LN:7645 RETURN
ret
; LN:7646 ENDIF
_Lbl1328:
; LN:7647 ValidNdx=0
mov dword [ValidNdx],0
ValidFltLoop:
; LN:7649 INC ValidNdx
inc [ValidNdx]
; LN:7650 IF ValidNdx>LEN(TokenBuf) THEN
mov esi,TokenBuf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [ValidNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1329
; LN:7651 FloatOK=$ff
mov byte [FloatOK],255
; LN:7652 RETURN
ret
; LN:7653 ENDIF
_Lbl1329:
; LN:7654 TempByte=MID$(TokenBuf,ValidNdx,1)
mov edi,[TokenBuf]
mov [_TmpVec1],edi
mov edi,[TokenBuf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenBuf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [ValidNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7655 IF TempByte>="0" AND TempByte<="9" THEN ValidFltLoop
mov esi,_StrConst1190
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1191
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1330
jmp ValidFltLoop
_Lbl1330:
; LN:7656 IF TempByte="." THEN
mov esi,_StrConst1192
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1331
; LN:7657 IF OneDot=0 THEN
cmp [OneDot],0
jne _Lbl1332
; LN:7658 OneDot=$ff
mov byte [OneDot],255
; LN:7659 GOTO ValidFltLoop
jmp ValidFltLoop
; LN:7660 ENDIF
_Lbl1332:
; LN:7661 ENDIF
_Lbl1331:
; LN:7662 RETURN
ret
SymSrch:
; LN:7665 SymFull=0
mov byte [SymFull],0
; LN:7666 SymFound=0
mov byte [SymFound],0
; LN:7667 SymNdx=0
mov dword [SymNdx],0
; LN:7668 TempName=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TempName
mov esi,_TmpVec1
call __MovStr
; LN:7669 TempStr=TempName
mov edi,TempStr
mov esi,TempName
call __MovStr
; LN:7670 TempInt=CHKWORD(TempStr)
xor eax,eax
mov esi,[TempStr]
mov edx,[TempStr+4]
xor ecx,ecx
_Lbl1333:
mov cl, byte [esi]
or cl,cl
je _Lbl1334
inc esi
add eax,ecx
dec edx
jne _Lbl1333
_Lbl1334:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [TempInt],eax
SymSrch1:
; LN:7672 INC SymNdx
inc [SymNdx]
; LN:7673 IF SymNdx>LastSym THEN
xor bh,bh
mov eax, dword [SymNdx]
mov edx, dword [LastSym]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1335
; LN:7674 RETURN
ret
; LN:7675 ENDIF
_Lbl1335:
; LN:7676 IF SymNdx>SymTabSiz THEN
cmp [SymNdx],3000
jle _Lbl1336
; LN:7677 SymFull=$ff
mov byte [SymFull],255
; LN:7678 RETURN
ret
; LN:7679 ENDIF
_Lbl1336:
; LN:7680 IF SymTableKey(SymNdx)<>TempInt THEN SymSrch1
mov esi,SymTableKey-(1*4)
mov eax, dword [SymNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [TempInt]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1337
jmp SymSrch1
_Lbl1337:
; LN:7681 IF SymTable(SymNdx).SymName<>TempName THEN SymSrch1
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,TempName
call __CmpStr
setne bl
or bh,bl
je _Lbl1338
jmp SymSrch1
_Lbl1338:
; LN:7682 SymFound=$ff
mov byte [SymFound],255
; LN:7683 RETURN
ret
SymSearch:
; LN:7686 GOSUB SymSrch
call SymSrch
; LN:7687 IF SymFound=$ff THEN
cmp [SymFound],255
jne _Lbl1339
; LN:7688 RETURN
ret
; LN:7689 ENDIF
_Lbl1339:
; LN:7690 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:7691 GOSUB SymSrch
call SymSrch
; LN:7692 RETURN
ret
SymInsert:
; LN:7695 IF SymFull=$ff THEN
cmp [SymFull],255
jne _Lbl1340
; LN:7696 ErrNo=ErrSymFul
mov dword [ErrNo],7
; LN:7697 RETURN
ret
; LN:7698 ENDIF
_Lbl1340:
; LN:7699 SymTable(SymNdx)=SymTemp
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+0
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl1341:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl1341
; LN:7700 LastSym=SymNdx
mov eax, dword [SymNdx]
mov [LastSym],eax
; LN:7701 TempStr=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:7702 SymTableKey(SymNdx)=CHKWORD(TempStr)
mov esi,SymTableKey-(1*4)
mov eax, dword [SymNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
xor eax,eax
mov esi,[TempStr]
mov edx,[TempStr+4]
xor ecx,ecx
_Lbl1342:
mov cl, byte [esi]
or cl,cl
je _Lbl1343
inc esi
add eax,ecx
dec edx
jne _Lbl1342
_Lbl1343:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7703 RETURN
ret
KeyLook:
; LN:7706 KeyNdx=0
mov dword [KeyNdx],0
; LN:7707 TempInt=CHKWORD(TokenBuf)
xor eax,eax
mov esi,[TokenBuf]
mov edx,[TokenBuf+4]
xor ecx,ecx
_Lbl1344:
mov cl, byte [esi]
or cl,cl
je _Lbl1345
inc esi
add eax,ecx
dec edx
jne _Lbl1344
_Lbl1345:
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [TempInt],eax
LookUp1:
; LN:7709 INC KeyNdx
inc [KeyNdx]
; LN:7710 IF KeyNdx=LastKey THEN
xor bh,bh
mov eax, dword [KeyNdx]
mov edx, dword [LastKey]
cmp eax,edx
sete bl
or bh,bl
je _Lbl1346
; LN:7711 KeyNdx=0
mov dword [KeyNdx],0
; LN:7712 RETURN
ret
; LN:7713 ENDIF
_Lbl1346:
; LN:7714 IF KeyTable(KeyNdx).KeyCheckWord<>TempInt THEN LookUp1
mov esi,KeyTable-(1*24)+0
mov eax, dword [KeyNdx]
imul eax,24
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov edx, dword [TempInt]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1347
jmp LookUp1
_Lbl1347:
; LN:7715 IF KeyTable(KeyNdx).KeyName=TokenBuf THEN
mov esi,KeyTable-(1*24)+4
mov eax, dword [KeyNdx]
imul eax,24
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],16
mov [_TmpVec1+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,TokenBuf
call __CmpStr
sete bl
or bh,bl
je _Lbl1348
; LN:7716 RETURN
ret
; LN:7717 ENDIF
_Lbl1348:
; LN:7718 GOTO LookUp1
jmp LookUp1
CmpOps:
; LN:7721 Op1Class=0
mov byte [Op1Class],0
; LN:7722 AndOrFlag=$ff
mov byte [AndOrFlag],255
; LN:7723 CompFlag=$ff
mov byte [CompFlag],255
CmpOps1:
; LN:7725 Promote=0
mov byte [Promote],0
; LN:7726 Demote=0
mov byte [Demote],0
; LN:7727 TmpUse=0
mov dword [TmpUse],0
; LN:7728 TmpVecUse=0
mov dword [TmpVecUse],0
; LN:7729 FTmpUse=0
mov dword [FTmpUse],0
; LN:7730 ChrTmpUse=0
mov dword [ChrTmpUse],0
; LN:7731 StrTmpUse=0
mov dword [StrTmpUse],0
; LN:7732 TypeFlag=0
mov byte [TypeFlag],0
; LN:7733 TDataMod=0
mov word [TDataMod],0
; LN:7734 FileStat=0
mov byte [FileStat],0
; LN:7735 GOSUB ClrDatTyp
call ClrDatTyp
; LN:7736 GOSUB Expr
call Expr
; LN:7737 ErrRet
; LN:7737 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1349
; LN:7737 RETURN
ret
; LN:7737 ENDIF
_Lbl1349:
; LN:7738 Op1Name=TSymName
mov edi,Op1Name
mov esi,TSymName
call __MovStr
; LN:7739 Op1Class=OpClass
mov al, byte [OpClass]
mov [Op1Class],al
; LN:7740 Op1Type=TDataType
mov ax, word [TDataType]
mov [Op1Type],al
; LN:7741 Op1Mod=TDataMod
mov ax, word [TDataMod]
mov [Op1Mod],ax
; LN:7742 Op1Detail=TDetail
mov eax, dword [TDetail]
mov [Op1Detail],eax
; LN:7743 IF TDataType=BOOLVAR THEN
cmp [TDataType],1
jne _Lbl1350
; LN:7744 IF NextByte="=" OR NextByte="<" THEN
mov esi,_StrConst1193
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1194
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,NextByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1351
; LN:7745 GOSUB NexToken
call NexToken
; LN:7746 IF TokenBuf="=" THEN
mov esi,_StrConst1195
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1352
; LN:7747 SymType="sete "
mov edi,[SymType]
mov esi,_StrConst1196
call __SetStrConst
; LN:7748 ELSE
jmp _Lbl1353
_Lbl1352:
; LN:7749 SymType="setne "
mov edi,[SymType]
mov esi,_StrConst1197
call __SetStrConst
; LN:7750 ENDIF
_Lbl1353:
; LN:7751 IF TokenBuf<>"=" AND TokenBuf<>"<>" THEN
mov esi,_StrConst1198
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
mov esi,_StrConst1199
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl1354
; LN:7752 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:7753 RETURN
ret
; LN:7754 ENDIF
_Lbl1354:
; LN:7755 GOTO CmpOps2
jmp CmpOps2
; LN:7756 ELSE
jmp _Lbl1355
_Lbl1351:
; LN:7757 Op2Name="true"
mov edi,[Op2Name]
mov esi,_StrConst1200
call __SetStrConst
; LN:7758 Op2Class=BOOLClass
mov byte [Op2Class],6
; LN:7759 Op2Type=1
mov byte [Op2Type],1
; LN:7760 Op2Mod=$04
mov word [Op2Mod],4
; LN:7761 Op2Detail=1
mov dword [Op2Detail],1
; LN:7762 SymType="sete "
mov edi,[SymType]
mov esi,_StrConst1201
call __SetStrConst
; LN:7763 GOTO CmpOps3
jmp CmpOps3
; LN:7764 ENDIF
_Lbl1355:
; LN:7765 ENDIF
_Lbl1350:
; LN:7766 GOSUB NexToken
call NexToken
; LN:7767 IF TokenType<>1 THEN
cmp [TokenType],1
je _Lbl1356
; LN:7768 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:7769 RETURN
ret
; LN:7770 ENDIF
_Lbl1356:
; LN:7771 SymType=""
mov [SymType+12],0
; LN:7772 SELECT CASE TokenBuf
mov edi,[TokenBuf]
mov [_SwitchStr],edi
mov edi,[TokenBuf+4]
mov [_SwitchStr+4],edi
mov edi,[TokenBuf+8]
mov [_SwitchStr+8],edi
; LN:7773 CASE "="
mov esi,_StrConst1202
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1358
; LN:7774 SymType="sete "
mov edi,[SymType]
mov esi,_StrConst1203
call __SetStrConst
; LN:7775 SimpleOp="je "
mov edi,[SimpleOp]
mov esi,_StrConst1204
call __SetStrConst
; LN:7776 SimpleStructOp="jne "
mov edi,[SimpleStructOp]
mov esi,_StrConst1205
call __SetStrConst
; LN:7777 CASE "<"
jmp _Lbl1357
_Lbl1358:
mov esi,_StrConst1206
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1359
; LN:7778 SymType="setl "
mov edi,[SymType]
mov esi,_StrConst1207
call __SetStrConst
; LN:7779 SimpleOp="jnl "
mov edi,[SimpleOp]
mov esi,_StrConst1208
call __SetStrConst
; LN:7780 SimpleStructOp="jge "
mov edi,[SimpleStructOp]
mov esi,_StrConst1209
call __SetStrConst
; LN:7781 CASE ">"
jmp _Lbl1357
_Lbl1359:
mov esi,_StrConst1210
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1360
; LN:7782 SymType="setg "
mov edi,[SymType]
mov esi,_StrConst1211
call __SetStrConst
; LN:7783 SimpleOp="jg "
mov edi,[SimpleOp]
mov esi,_StrConst1212
call __SetStrConst
; LN:7784 SimpleStructOp="jle "
mov edi,[SimpleStructOp]
mov esi,_StrConst1213
call __SetStrConst
; LN:7785 CASE "<="
jmp _Lbl1357
_Lbl1360:
mov esi,_StrConst1214
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1361
; LN:7786 SymType="setle "
mov edi,[SymType]
mov esi,_StrConst1215
call __SetStrConst
; LN:7787 SimpleOp="jle "
mov edi,[SimpleOp]
mov esi,_StrConst1216
call __SetStrConst
; LN:7788 SimpleStructOp="jg "
mov edi,[SimpleStructOp]
mov esi,_StrConst1217
call __SetStrConst
; LN:7789 CASE ">="
jmp _Lbl1357
_Lbl1361:
mov esi,_StrConst1218
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1362
; LN:7790 SymType="setge "
mov edi,[SymType]
mov esi,_StrConst1219
call __SetStrConst
; LN:7791 SimpleOp="ge "
mov edi,[SimpleOp]
mov esi,_StrConst1220
call __SetStrConst
; LN:7792 SimpleStructOp="jl "
mov edi,[SimpleStructOp]
mov esi,_StrConst1221
call __SetStrConst
; LN:7793 CASE "<>"
jmp _Lbl1357
_Lbl1362:
mov esi,_StrConst1222
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
mov edi,_SwitchStr
mov esi,_TmpVec1
call __CmpStr
jne _Lbl1363
; LN:7794 SymType="setne "
mov edi,[SymType]
mov esi,_StrConst1223
call __SetStrConst
; LN:7795 SimpleOp="jne "
mov edi,[SimpleOp]
mov esi,_StrConst1224
call __SetStrConst
; LN:7796 SimpleStructOp="je "
mov edi,[SimpleStructOp]
mov esi,_StrConst1225
call __SetStrConst
; LN:7797 CASE ELSE
jmp _Lbl1357
_Lbl1363:
; LN:7798 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:7799 RETURN
ret
; LN:7800 END SELECT
jmp _Lbl1357
_Lbl1364:
_Lbl1357:
CmpOps2:
; LN:7802 GOSUB Expr
call Expr
; LN:7803 ErrRet
; LN:7803 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1365
; LN:7803 RETURN
ret
; LN:7803 ENDIF
_Lbl1365:
; LN:7804 Op2Name=TSymName
mov edi,Op2Name
mov esi,TSymName
call __MovStr
; LN:7805 Op2Class=OpClass
mov al, byte [OpClass]
mov [Op2Class],al
; LN:7806 Op2Type=TDataType
mov ax, word [TDataType]
mov [Op2Type],al
; LN:7807 Op2Mod=TDataMod
mov ax, word [TDataMod]
mov [Op2Mod],ax
; LN:7808 Op2Detail=TDetail
mov eax, dword [TDetail]
mov [Op2Detail],eax
; LN:7809 TempInt=LOR(Op1Mod,TempBit)
xor eax,eax
mov ax, word [Op1Mod]
mov edx,64
or eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [TempInt],eax
; LN:7810 IF ComplexCmp=0 THEN
cmp [ComplexCmp],0
jne _Lbl1366
; LN:7811 IF KeyNdx=10 AND HasFcn=0 AND Op1Class=INTClass AND TempInt=TempBit AND Op2Class=INTClass AND Op2Mod=ConstBit THEN
xor bh,bh
mov eax, dword [KeyNdx]
mov edx,10
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [HasFcn]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
mov eax, dword [TempInt]
mov edx,64
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov al, byte [Op2Class]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
xor eax,eax
mov ax, word [Op2Mod]
mov edx,4
cmp eax,edx
sete bl
and bh,bl
je _Lbl1367
; LN:7812 GOSUB NexToken
call NexToken
; LN:7813 IF TokenBuf<>"or" AND TokenBuf<>"and" then
mov esi,_StrConst1226
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
mov esi,_StrConst1227
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
and bh,bl
je _Lbl1368
; LN:7814 SimpleCmp=$ff
mov byte [SimpleCmp],255
; LN:7815 RETURN
ret
; LN:7816 ENDIF
_Lbl1368:
; LN:7817 GOSUB UnDoToken
call UnDoToken
; LN:7818 ENDIF
_Lbl1367:
; LN:7819 ENDIF
_Lbl1366:
; LN:7820 ComplexCmp=$ff
mov byte [ComplexCmp],255
CmpOps3:
; LN:7822 IF InitTrue=0 THEN
cmp [InitTrue],0
jne _Lbl1369
; LN:7823 OutBuf="xor bh,bh"
mov edi,[OutBuf]
mov esi,_StrConst1228
call __SetStrConst
; LN:7824 GOSUB OutCodeData
call OutCodeData
; LN:7825 InitTrue=$ff
mov byte [InitTrue],255
; LN:7826 ENDIF
_Lbl1369:
; LN:7827 IF Op1Class=INTClass OR Op1Class=FLTClass OR Op1Class=BOOLClass THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,6
cmp eax,edx
sete bl
or bh,bl
je _Lbl1370
; LN:7828 GOSUB CmpNum
call CmpNum
; LN:7829 ErrRet
; LN:7829 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1371
; LN:7829 RETURN
ret
; LN:7829 ENDIF
_Lbl1371:
; LN:7830 ENDIF
_Lbl1370:
; LN:7831 IF Op1Class<>Op2Class THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
xor edx,edx
mov dl, byte [Op2Class]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1372
; LN:7832 EXITIF Op1Class=INTClass AND Op2Class=FLTClass
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op2Class]
mov edx,5
cmp eax,edx
sete bl
and bh,bl
jne _Lbl1372
; LN:7833 EXITIF Op1Class=FLTClass AND Op2Class=INTClass
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op2Class]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
jne _Lbl1372
; LN:7834 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:7835 RETURN
ret
; LN:7836 ENDIF
_Lbl1372:
; LN:7837 IF Op1Class=STRClass THEN
cmp [Op1Class],2
jne _Lbl1373
; LN:7838 GOSUB CmpString
call CmpString
; LN:7839 ENDIF
_Lbl1373:
; LN:7840 IF Op1Class=0 OR Op1Class=ARRClass OR Op1Class=CPXClass THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,0
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,3
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [Op1Class]
mov edx,4
cmp eax,edx
sete bl
or bh,bl
je _Lbl1374
; LN:7841 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:7842 RETURN
ret
; LN:7843 ENDIF
_Lbl1374:
; LN:7844 IF AndOrFlag=0 THEN
cmp [AndOrFlag],0
jne _Lbl1375
; LN:7845 OutBuf="and bh,bl"
mov edi,[OutBuf]
mov esi,_StrConst1229
call __SetStrConst
; LN:7846 ELSE
jmp _Lbl1376
_Lbl1375:
; LN:7847 OutBuf="or bh,bl"
mov edi,[OutBuf]
mov esi,_StrConst1230
call __SetStrConst
; LN:7848 ENDIF
_Lbl1376:
; LN:7849 GOSUB OutCodeData
call OutCodeData
; LN:7850 GOSUB NexToken
call NexToken
; LN:7851 IF TokenBuf="and" THEN
mov esi,_StrConst1231
mov [_TmpVec1],esi
mov [_TmpVec1+4],4
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1377
; LN:7852 AndOrFlag=0
mov byte [AndOrFlag],0
; LN:7853 GOTO CmpOps1
jmp CmpOps1
; LN:7854 ENDIF
_Lbl1377:
; LN:7855 IF TokenBuf="or" THEN
mov esi,_StrConst1232
mov [_TmpVec1],esi
mov [_TmpVec1+4],3
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1378
; LN:7856 AndOrFlag=$ff
mov byte [AndOrFlag],255
; LN:7857 GOTO CmpOps1
jmp CmpOps1
; LN:7858 ENDIF
_Lbl1378:
; LN:7859 RETURN
ret
ClrDatTyp:
; LN:7862 DTCompVar=0
mov byte [DTCompVar],0
; LN:7863 DTBoolean=0
mov byte [DTBoolean],0
; LN:7864 DTByte=0
mov byte [DTByte],0
; LN:7865 DTShort=0
mov byte [DTShort],0
; LN:7866 DTLong=0
mov byte [DTLong],0
; LN:7867 DTFloat=0
mov byte [DTFloat],0
; LN:7868 DTString=0
mov byte [DTString],0
; LN:7869 DTLabel=0
mov byte [DTLabel],0
; LN:7870 DTMacro=0
mov byte [DTMacro],0
; LN:7871 DTOper=0
mov byte [DTOper],0
; LN:7872 DTFcn=0
mov byte [DTFcn],0
; LN:7873 DTProc=0
mov byte [DTProc],0
; LN:7874 DTStruct=0
mov byte [DTStruct],0
; LN:7875 DTVoid=0
mov byte [DTVoid],0
; LN:7876 DTComplex=0
mov byte [DTComplex],0
; LN:7877 DTBuffer=0
mov byte [DTBuffer],0
; LN:7878 DMData=0
mov byte [DMData],0
; LN:7879 DMTemp=0
mov byte [DMTemp],0
; LN:7880 DMVector=0
mov byte [DMVector],0
; LN:7881 DMMember=0
mov byte [DMMember],0
; LN:7882 DMMulti=0
mov byte [DMMulti],0
; LN:7883 DMConst=0
mov byte [DMConst],0
; LN:7884 DMAddr=0
mov byte [DMAddr],0
; LN:7885 DMArray=0
mov byte [DMArray],0
; LN:7886 RETURN
ret
GtRootSym:
; LN:7889 SubscrErr=0
mov byte [SubscrErr],0
; LN:7890 RootSym=""
mov [RootSym+12],0
; LN:7891 SubCtr=0
mov byte [SubCtr],0
; LN:7892 Subscript(1)=""
mov esi,Subscript-(1*28)
mov eax,1
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:7893 Subscript(2)=""
mov esi,Subscript-(1*28)
mov eax,2
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:7894 Subscript(3)=""
mov esi,Subscript-(1*28)
mov eax,3
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_NullStr
call __MovStr
; LN:7895 SubValue(1)=1
mov esi,SubValue-(1*4)
mov eax,1
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7896 SubValue(2)=1
mov esi,SubValue-(1*4)
mov eax,2
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7897 SubValue(3)=1
mov esi,SubValue-(1*4)
mov eax,3
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,1
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7898 LabNdx=0
mov dword [LabNdx],0
GtRtSym1:
; LN:7900 INC LabNdx
inc [LabNdx]
; LN:7901 IF LabNdx>LEN(TokenSaf) THEN
mov esi,TokenSaf
call __StrLen
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [LabNdx]
mov edx, dword [_Tmp1]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1379
; LN:7902 RETURN
ret
; LN:7903 ENDIF
_Lbl1379:
; LN:7904 TempByte=MID$(TokenSaf,LabNdx,1)
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [LabNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7905 IF TempByte<>"(" THEN
mov esi,_StrConst1233
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1380
; LN:7906 RootSym=RootSym+TempByte
mov edi,[RootSym]
mov [_TmpVec1],edi
mov edi,[RootSym+4]
mov [_TmpVec1+4],edi
mov edi,[RootSym+8]
mov [_TmpVec1+8],edi
mov edi,[TempByte]
mov [_TmpVec2],edi
mov edi,[TempByte+4]
mov [_TmpVec2+4],edi
mov edi,[TempByte+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,RootSym
mov esi,_TmpVec1
call __MovStr
; LN:7907 GOTO GtRtSym1
jmp GtRtSym1
; LN:7908 ENDIF
_Lbl1380:
; LN:7909 IF RIGHT$(TokenSaf,1)<>")" THEN
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
call __RightStr
mov esi,_StrConst1234
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1381
; LN:7910 SubscrErr=$ff
mov byte [SubscrErr],255
; LN:7911 RETURN
ret
; LN:7912 ENDIF
_Lbl1381:
GtRtSym2:
; LN:7914 INC SubCtr
inc [SubCtr]
; LN:7915 IF SubCtr>3 THEN
cmp [SubCtr],3
jle _Lbl1382
; LN:7916 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:7917 RETURN
ret
; LN:7918 ENDIF
_Lbl1382:
GtRtSym3:
; LN:7920 INC LabNdx
inc [LabNdx]
; LN:7921 TempByte=MID$(TokenSaf,LabNdx,1)
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax, dword [LabNdx]
mov edx,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:7922 IF TempByte=")" OR TempByte="," THEN
mov esi,_StrConst1235
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
mov esi,_StrConst1236
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1383
; LN:7923 SymNdxSaf=SymNdx
mov eax, dword [SymNdx]
mov [SymNdxSaf],eax
; LN:7924 TempStr=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TempStr
mov esi,_TmpVec1
call __MovStr
; LN:7925 IF LEFT$(Subscript(SubCtr),1)>="0" AND LEFT$(Subscript(SubCtr),1)<="9" THEN
mov esi,Subscript-(1*28)
xor eax,eax
mov al, byte [SubCtr]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1237
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setge bl
or bh,bl
mov esi,Subscript-(1*28)
xor eax,eax
mov al, byte [SubCtr]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov esi,_StrConst1238
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setle bl
and bh,bl
je _Lbl1384
; LN:7926 SubValue(SubCtr)=VAL(Subscript(SubCtr))
mov esi,SubValue-(1*4)
xor eax,eax
mov al, byte [SubCtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,Subscript-(1*28)
xor eax,eax
mov al, byte [SubCtr]
imul eax,28
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov esi,[_TmpVec2]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7927 ELSE
jmp _Lbl1385
_Lbl1384:
; LN:7928 SymTemp.SymName=Subscript(SubCtr)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,Subscript-(1*28)
xor eax,eax
mov al, byte [SubCtr]
imul eax,28
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:7929 GOSUB SymSrch
call SymSrch
; LN:7930 IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACROVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [SymFound]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,8
cmp eax,edx
sete bl
or bh,bl
je _Lbl1386
; LN:7931 SubValue(SubCtr)=SymTable(SymNdx).Detail
mov esi,SubValue-(1*4)
xor eax,eax
mov al, byte [SubCtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7932 ELSE
jmp _Lbl1387
_Lbl1386:
; LN:7933 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:7934 RETURN
ret
; LN:7935 ENDIF
_Lbl1387:
; LN:7936 ENDIF
_Lbl1385:
; LN:7937 SymNdx=SymNdxSaf
mov eax, dword [SymNdxSaf]
mov [SymNdx],eax
; LN:7938 SymTemp.SymName=TempStr
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:7939 IF TempByte="," THEN GtRtSym2
mov esi,_StrConst1239
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1388
jmp GtRtSym2
_Lbl1388:
; LN:7940 RETURN
ret
; LN:7941 ENDIF
_Lbl1383:
; LN:7942 Subscript(SubCtr)=Subscript(SubCtr)+TempByte
mov esi,Subscript-(1*28)
xor eax,eax
mov al, byte [SubCtr]
imul eax,28
add esi,eax;
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,Subscript-(1*28)
xor eax,eax
mov al, byte [SubCtr]
imul eax,28
add esi,eax;
mov [_TmpVec2],esi
mov [_TmpVec2+4],28
mov [_TmpVec2+8],0
mov edi,[TempByte]
mov [_TmpVec3],edi
mov edi,[TempByte+4]
mov [_TmpVec3+4],edi
mov edi,[TempByte+8]
mov [_TmpVec3+8],edi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,_TmpVec1
mov esi,_TmpVec2
call __MovStr
; LN:7943 GOTO GtRtSym3
jmp GtRtSym3
F1:
; LN:7946 ' EOF(#FileNum)
; LN:7947 FileStat=$ff
mov byte [FileStat],255
; LN:7948 GOSUB ClassOp
call ClassOp
; LN:7949 GOSUB GetPthNum2
call GetPthNum2
; LN:7950 ErrRet
; LN:7950 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1389
; LN:7950 RETURN
ret
; LN:7950 ENDIF
_Lbl1389:
; LN:7951 OutBuf="invoke GetFileSize,[_IOPthNum],0"
mov edi,[OutBuf]
mov esi,_StrConst1240
call __SetStrConst
; LN:7952 GOSUB OutCodeData
call OutCodeData
; LN:7953 OutBuf="mov [_ArgSafe0],eax"
mov edi,[OutBuf]
mov esi,_StrConst1241
call __SetStrConst
; LN:7954 GOSUB OutCodeData
call OutCodeData
; LN:7955 GOSUB CallErr
call CallErr
; LN:7956 OutBuf="invoke SetFilePointer,[_IOPthNum],0,0,FILE_CURRENT"
mov edi,[OutBuf]
mov esi,_StrConst1242
call __SetStrConst
; LN:7957 GOSUB OutCodeData
call OutCodeData
; LN:7958 GOSUB CallErr
call CallErr
; LN:7959 OpClass=BOOLClass
mov byte [OpClass],6
; LN:7960 TDataType=BOOLVAR
mov word [TDataType],1
; LN:7961 GOSUB GetTmp
call GetTmp
; LN:7962 ErrRet
; LN:7962 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1390
; LN:7962 RETURN
ret
; LN:7962 ENDIF
_Lbl1390:
; LN:7963 OutBuf="cmp eax,[_ArgSafe0]"
mov edi,[OutBuf]
mov esi,_StrConst1243
call __SetStrConst
; LN:7964 GOSUB OutCodeData
call OutCodeData
; LN:7965 OutBuf="sete cl; Set result"
mov edi,[OutBuf]
mov esi,_StrConst1244
call __SetStrConst
; LN:7966 GOSUB OutCodeData
call OutCodeData
; LN:7967 OutBuf="mov byte ["+SymTemp.SymName+"],cl"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1245
mov [_TmpVec2],esi
mov [_TmpVec2+4],11
mov [_TmpVec2+8],0
mov esi,_StrConst1246
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7968 GOSUB OutCodeData
call OutCodeData
; LN:7969 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7970 RETURN
ret
F2:
; LN:7973 ' LEN(String)
; LN:7974 GOSUB ClassOp
call ClassOp
; LN:7975 IF TDataType<>STRINGVAR OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1391
; LN:7976 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:7977 RETURN
ret
; LN:7978 ENDIF
_Lbl1391:
; LN:7979 OutBuf="mov esi,"+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1247
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:7980 GOSUB OutCodeData
call OutCodeData
; LN:7981 GOSUB GetIntTmp
call GetIntTmp
; LN:7982 ErrRet
; LN:7982 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1392
; LN:7982 RETURN
ret
; LN:7982 ENDIF
_Lbl1392:
; LN:7983 UseStrLen=TRUE
mov byte [UseStrLen],1
; LN:7984 OutBuf="call __StrLen"
mov edi,[OutBuf]
mov esi,_StrConst1248
call __SetStrConst
; LN:7985 GOSUB OutCodeData
call OutCodeData
; LN:7986 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:7987 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:7988 RETURN
ret
F3:
; LN:7991 ' STR$(Number)
; LN:7992 GOSUB ClassOp
call ClassOp
; LN:7993 GOSUB LoadReg
call LoadReg
; LN:7994 ErrRet
; LN:7994 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1393
; LN:7994 RETURN
ret
; LN:7994 ENDIF
_Lbl1393:
; LN:7995 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,5
cmp eax,edx
setne bl
and bh,bl
je _Lbl1394
; LN:7996 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:7997 RETURN
ret
; LN:7998 ENDIF
_Lbl1394:
; LN:7999 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1395
; LN:8000 IF FloatFlag<>0 THEN
cmp [FloatFlag],0
je _Lbl1396
; LN:8001 OutBuf=";eax=eaxf;"
mov edi,[OutBuf]
mov esi,_StrConst1249
call __SetStrConst
; LN:8002 GOSUB OutCodeData	
call OutCodeData
; LN:8003 ENDIF
_Lbl1396:
; LN:8004 SELECT CASE FcnCode
xor eax,eax
mov al, byte [FcnCode]
mov [_SwitchInt],eax
; LN:8005 CASE 69
mov eax,69
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1398
; LN:8006 TempInt=2
mov dword [TempInt],2
; LN:8007 CASE 70
jmp _Lbl1397
_Lbl1398:
mov eax,70
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1399
; LN:8008 TempInt=8
mov dword [TempInt],8
; LN:8009 CASE 3
jmp _Lbl1397
_Lbl1399:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1400
; LN:8010 TempInt=10
mov dword [TempInt],10
; LN:8011 CASE 49
jmp _Lbl1397
_Lbl1400:
mov eax,49
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1401
; LN:8012 TempInt=16
mov dword [TempInt],16
; LN:8013 CASE ELSE
jmp _Lbl1397
_Lbl1401:
; LN:8014 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8015 RETURN
ret
; LN:8016 END SELECT			
jmp _Lbl1397
_Lbl1402:
_Lbl1397:
; LN:8017 OutBuf="cinvoke ltoa,eax,[_ConvBuf1],"+STR$(TempInt)
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1250
mov [_TmpVec2],esi
mov [_TmpVec2+4],30
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8018 ELSE
jmp _Lbl1403
_Lbl1395:
; LN:8019 OutBuf=""
mov [OutBuf+12],0
; LN:8020 ENDIF
_Lbl1403:
; LN:8021 GOSUB OutCodeData
call OutCodeData
; LN:8022 GOSUB NumToA
call NumToA
; LN:8023 RETURN
ret
NumToA:
; LN:8026 GOSUB GetStrVec
call GetStrVec
; LN:8027 ErrRet
; LN:8027 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1404
; LN:8027 RETURN
ret
; LN:8027 ENDIF
_Lbl1404:
; LN:8028 OutBuf="mov edi,"+SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1251
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8029 GOSUB OutCodeData
call OutCodeData
; LN:8030 OutBuf="mov esi,_ConvBuf1"
mov edi,[OutBuf]
mov esi,_StrConst1252
call __SetStrConst
; LN:8031 GOSUB OutCodeData
call OutCodeData
; LN:8032 UseMovStr=TRUE
mov byte [UseMovStr],1
; LN:8033 OutBuf="call __MovStr"
mov edi,[OutBuf]
mov esi,_StrConst1253
call __SetStrConst
; LN:8034 GOSUB OutCodeData
call OutCodeData
; LN:8035 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8036 RETURN
ret
F4:
; LN:8039 ' VAL(String)
; LN:8040 GOSUB ClassOp
call ClassOp
; LN:8041 IF TDataType<>STRINGVAR OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1405
; LN:8042 ErrNo=ErrTypMis'  wrong type
mov dword [ErrNo],3
; LN:8043 RETURN
ret
; LN:8044 ENDIF
_Lbl1405:
; LN:8045 IF Op1Class=FLTClass AND FcnCode=4 THEN
xor bh,bh
xor eax,eax
mov al, byte [Op1Class]
mov edx,5
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [FcnCode]
mov edx,4
cmp eax,edx
sete bl
and bh,bl
je _Lbl1406
; LN:8046 FcnCode=24
mov byte [FcnCode],24
; LN:8047 ENDIF
_Lbl1406:
; LN:8048 IF FcnCode=24 THEN
cmp [FcnCode],24
jne _Lbl1407
; LN:8049 OutBuf=";eaxf=_AtoD();"
mov edi,[OutBuf]
mov esi,_StrConst1254
call __SetStrConst
; LN:8050 ELSE
jmp _Lbl1408
_Lbl1407:
; LN:8051 OutBuf="mov esi,["+TSymName+"]"
mov esi,_StrConst1255
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1256
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8052 GOSUB OutCodeData
call OutCodeData
; LN:8053 UseAtoL=TRUE
mov byte [UseAtoL],1
; LN:8054 OutBuf="call __AtoL"
mov edi,[OutBuf]
mov esi,_StrConst1257
call __SetStrConst
; LN:8055 ENDIF
_Lbl1408:
; LN:8056 GOSUB OutCodeData
call OutCodeData
; LN:8057 IF FcnCode=24 THEN
cmp [FcnCode],24
jne _Lbl1409
; LN:8058 INC FloatFlag
inc [FloatFlag]
; LN:8059 OpClass=FLTClass
mov byte [OpClass],5
; LN:8060 TDataType=FLOATVAR
mov word [TDataType],5
; LN:8061 GOSUB GetFltTmp
call GetFltTmp
; LN:8062 ErrRet
; LN:8062 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1410
; LN:8062 RETURN
ret
; LN:8062 ENDIF
_Lbl1410:
; LN:8063 ELSE
jmp _Lbl1411
_Lbl1409:
; LN:8064 OpClass=INTClass
mov byte [OpClass],1
; LN:8065 GOSUB GetIntTmp
call GetIntTmp
; LN:8066 ErrRet
; LN:8066 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1412
; LN:8066 RETURN
ret
; LN:8066 ENDIF
_Lbl1412:
; LN:8067 ENDIF
_Lbl1411:
; LN:8068 IF FcnCode=24 THEN
cmp [FcnCode],24
jne _Lbl1413
; LN:8069 OutBuf=";"+SymTemp.SymName+"=eaxf;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1258
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1259
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8070 ELSE
jmp _Lbl1414
_Lbl1413:
; LN:8071 OutBuf="mov ["+SymTemp.SymName+"],eax"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1260
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1261
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8072 ENDIF
_Lbl1414:
; LN:8073 GOSUB OutCodeData
call OutCodeData
; LN:8074 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8075 RETURN
ret
F5:
; LN:8078 ' LAND(Exp1,Exp2)
; LN:8079 GOSUB ClassOp
call ClassOp
; LN:8080 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1415
; LN:8081 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8082 RETURN
ret
; LN:8083 ENDIF
_Lbl1415:
; LN:8084 IF TSymName<>"~" THEN
mov esi,_StrConst1262
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1416
; LN:8085 GOSUB LoadReg
call LoadReg
; LN:8086 ErrRet
; LN:8086 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1417
; LN:8086 RETURN
ret
; LN:8086 ENDIF
_Lbl1417:
; LN:8087 ENDIF
_Lbl1416:
; LN:8088 INC ExpNdx
inc [ExpNdx]
; LN:8089 GOSUB ClassOp
call ClassOp
; LN:8090 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1418
; LN:8091 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8092 RETURN
ret
; LN:8093 ENDIF
_Lbl1418:
; LN:8094 IF TSymName<>"~" THEN
mov esi,_StrConst1263
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1419
; LN:8095 GOSUB LoadReg
call LoadReg
; LN:8096 ErrRet
; LN:8096 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1420
; LN:8096 RETURN
ret
; LN:8096 ENDIF
_Lbl1420:
; LN:8097 ENDIF
_Lbl1419:
; LN:8098 GOSUB GetIntTmp
call GetIntTmp
; LN:8099 ErrRet
; LN:8099 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1421
; LN:8099 RETURN
ret
; LN:8099 ENDIF
_Lbl1421:
; LN:8100 SELECT CASE FcnCode
xor eax,eax
mov al, byte [FcnCode]
mov [_SwitchInt],eax
; LN:8101 CASE 5' LAND()
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1423
; LN:8102 OutBuf="and eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1264
call __SetStrConst
; LN:8103 CASE 7' LOR()
jmp _Lbl1422
_Lbl1423:
mov eax,7
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1424
; LN:8104 OutBuf="or eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1265
call __SetStrConst
; LN:8105 CASE 9' MOD()
jmp _Lbl1422
_Lbl1424:
mov eax,9
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1425
; LN:8106 OutBuf="mov ecx,edx"
mov edi,[OutBuf]
mov esi,_StrConst1266
call __SetStrConst
; LN:8107 GOSUB OutCodeData
call OutCodeData
; LN:8108 OutBuf="xor edx,edx"
mov edi,[OutBuf]
mov esi,_StrConst1267
call __SetStrConst
; LN:8109 GOSUB OutCodeData
call OutCodeData
; LN:8110 OutBuf="idiv ecx"
mov edi,[OutBuf]
mov esi,_StrConst1268
call __SetStrConst
; LN:8111 GOSUB OutCodeData
call OutCodeData
; LN:8112 OutBuf="mov eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1269
call __SetStrConst
; LN:8113 CASE 19' LXOR()
jmp _Lbl1422
_Lbl1425:
mov eax,19
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1426
; LN:8114 OutBuf="xor eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1270
call __SetStrConst
; LN:8115 END SELECT
jmp _Lbl1422
_Lbl1426:
_Lbl1422:
; LN:8116 GOSUB OutCodeData
call OutCodeData
; LN:8117 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8118 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8119 RETURN
ret
F6:
; LN:8122 ' MID$(String,Position,Quantity)
; LN:8123 IF FcnCode=6 THEN
cmp [FcnCode],6
jne _Lbl1427
; LN:8124 IF ExpRight-ExpLeft<>4 THEN
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
cmp [_Tmp1],4
je _Lbl1428
; LN:8125 ErrNo=ErrFcn
mov dword [ErrNo],28
; LN:8126 RETURN
ret
; LN:8127 ENDIF
_Lbl1428:
; LN:8128 ENDIF
_Lbl1427:
; LN:8129 GOSUB MidLftRt
call MidLftRt
; LN:8130 RETURN
ret
MidLftRt:
; LN:8133 GOSUB ClassOp
call ClassOp
; LN:8134 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1429
; LN:8135 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8136 RETURN
ret
; LN:8137 ENDIF
_Lbl1429:
; LN:8138 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1430
; LN:8139 REM need to make a temp vector
; LN:8140 GOSUB SetTmpVec
call SetTmpVec
; LN:8141 ErrRet
; LN:8141 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1431
; LN:8141 RETURN
ret
; LN:8141 ENDIF
_Lbl1431:
; LN:8142 ENDIF
_Lbl1430:
; LN:8143 OutBuf="mov esi,"+TSymName
mov esi,_StrConst1271
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8144 GOSUB OutCodeData
call OutCodeData
; LN:8145 INC ExpNdx
inc [ExpNdx]
; LN:8146 GOSUB ClassOp
call ClassOp
; LN:8147 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1432
; LN:8148 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8149 RETURN
ret
; LN:8150 ENDIF
_Lbl1432:
; LN:8151 GOSUB LoadReg' first arg
call LoadReg
; LN:8152 ErrRet
; LN:8152 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1433
; LN:8152 RETURN
ret
; LN:8152 ENDIF
_Lbl1433:
; LN:8153 SELECT CASE FcnCode
xor eax,eax
mov al, byte [FcnCode]
mov [_SwitchInt],eax
; LN:8154 CASE 6' Mid$
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1435
; LN:8155 INC ExpNdx
inc [ExpNdx]
; LN:8156 GOSUB ClassOp
call ClassOp
; LN:8157 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1436
; LN:8158 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8159 RETURN
ret
; LN:8160 ENDIF
_Lbl1436:
; LN:8161 GOSUB LoadReg' second arg
call LoadReg
; LN:8162 ErrRet
; LN:8162 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1437
; LN:8162 RETURN
ret
; LN:8162 ENDIF
_Lbl1437:
; LN:8163 UseMidStr=TRUE
mov byte [UseMidStr],1
; LN:8164 OutBuf="call __MidStr"
mov edi,[OutBuf]
mov esi,_StrConst1272
call __SetStrConst
; LN:8165 CASE 8' Left$
jmp _Lbl1434
_Lbl1435:
mov eax,8
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1438
; LN:8166 OutBuf="mov edx,eax"
mov edi,[OutBuf]
mov esi,_StrConst1273
call __SetStrConst
; LN:8167 GOSUB OutCodeData
call OutCodeData
; LN:8168 OutBuf="mov eax,1"
mov edi,[OutBuf]
mov esi,_StrConst1274
call __SetStrConst
; LN:8169 GOSUB OutCodeData
call OutCodeData
; LN:8170 UseMidStr=TRUE
mov byte [UseMidStr],1
; LN:8171 OutBuf="call __MidStr"
mov edi,[OutBuf]
mov esi,_StrConst1275
call __SetStrConst
; LN:8172 CASE 11' Right$
jmp _Lbl1434
_Lbl1438:
mov eax,11
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1439
; LN:8173 UseRightStr=TRUE
mov byte [UseRightStr],1
; LN:8174 OutBuf="call __RightStr"
mov edi,[OutBuf]
mov esi,_StrConst1276
call __SetStrConst
; LN:8175 CASE 80' Tail$
jmp _Lbl1434
_Lbl1439:
mov eax,80
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1440
; LN:8176 UseTailStr=TRUE
mov byte [UseTailStr],1
; LN:8177 OutBuf="call __TailStr"
mov edi,[OutBuf]
mov esi,_StrConst1277
call __SetStrConst
; LN:8178 END SELECT
jmp _Lbl1434
_Lbl1440:
_Lbl1434:
; LN:8179 GOSUB OutCodeData
call OutCodeData
; LN:8180 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:8181 RETURN
ret
F7:
; LN:8184 ' LOR(Exp1,Exp2)
; LN:8185 GOSUB F5
call F5
; LN:8186 RETURN
ret
F8:
; LN:8189 ' LEFT$(String,Quantity)
; LN:8190 IF ExpRight-ExpLeft<>3 THEN
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
cmp [_Tmp1],3
je _Lbl1441
; LN:8191 ErrNo=ErrFcn
mov dword [ErrNo],28
; LN:8192 RETURN
ret
; LN:8193 ENDIF
_Lbl1441:
; LN:8194 GOSUB MidLftRt
call MidLftRt
; LN:8195 RETURN
ret
F9:
; LN:8198 ' MOD(Exp1,Exp2)
; LN:8199 GOSUB F5
call F5
; LN:8200 RETURN
ret
F10:
; LN:8203 ' CHR$(Expr)
; LN:8204 GOSUB ClassOp
call ClassOp
; LN:8205 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1442
; LN:8206 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8207 RETURN
ret
; LN:8208 ENDIF
_Lbl1442:
; LN:8209 GOSUB LoadReg
call LoadReg
; LN:8210 ErrRet
; LN:8210 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1443
; LN:8210 RETURN
ret
; LN:8210 ENDIF
_Lbl1443:
; LN:8211 GOSUB GetChrVec
call GetChrVec
; LN:8212 ErrRet
; LN:8212 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1444
; LN:8212 RETURN
ret
; LN:8212 ENDIF
_Lbl1444:
; LN:8213 OutBuf="mov [_ChrTmp"+STR$(ChrTmpUse)+"],al"
mov eax, dword [ChrTmpUse]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1278
mov [_TmpVec2],esi
mov [_TmpVec2+4],13
mov [_TmpVec2+8],0
mov esi,_StrConst1279
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8214 GOSUB OutCodeData
call OutCodeData
; LN:8215 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8216 RETURN
ret
F11:
; LN:8219 ' RIGHT$(String,Quantity)
; LN:8220 IF Target<>0 THEN
cmp [Target],0
je _Lbl1445
; LN:8221 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:8222 RETURN
ret
; LN:8223 ENDIF
_Lbl1445:
; LN:8224 GOSUB MidLftRt
call MidLftRt
; LN:8225 RETURN
ret
F12:
; LN:8228 ' ASC(String)
; LN:8229 GOSUB ClassOp
call ClassOp
; LN:8230 IF TDataType<>STRINGVAR OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1446
; LN:8231 ErrNo=ErrFcn
mov dword [ErrNo],28
; LN:8232 RETURN
ret
; LN:8233 ENDIF
_Lbl1446:
; LN:8234 GOSUB GetIntTmp
call GetIntTmp
; LN:8235 ErrRet
; LN:8235 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1447
; LN:8235 RETURN
ret
; LN:8235 ENDIF
_Lbl1447:
; LN:8236 OutBuf="mov esi,["+TSymName+"]"
mov esi,_StrConst1280
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1281
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8237 GOSUB OutCodeData
call OutCodeData
; LN:8238 OutBuf="mov al, byte [esi]"
mov edi,[OutBuf]
mov esi,_StrConst1282
call __SetStrConst
; LN:8239 GOSUB OutCodeData
call OutCodeData
; LN:8240 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8241 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8242 RETURN
ret
F13:
; LN:8245 ' NOT(Boolean)
; LN:8246 GOSUB ClassOp
call ClassOp
; LN:8247 IF TDataType<>1 THEN
cmp [TDataType],1
je _Lbl1448
; LN:8248 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8249 RETURN
ret
; LN:8250 ENDIF
_Lbl1448:
; LN:8251 OpClass=BOOLClass
mov byte [OpClass],6
; LN:8252 TDataType=BOOLVAR
mov word [TDataType],1
; LN:8253 ErrRet
; LN:8253 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1449
; LN:8253 RETURN
ret
; LN:8253 ENDIF
_Lbl1449:
; LN:8254 IF TSymName<>"~" THEN
mov esi,_StrConst1283
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1450
; LN:8255 D0Loaded=0
mov byte [D0Loaded],0
; LN:8256 GOSUB LoadReg
call LoadReg
; LN:8257 ErrMain
; LN:8257 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:8258 ENDIF
_Lbl1450:
; LN:8259 GOSUB GetTmp
call GetTmp
; LN:8260 OutBuf="btc eax,0"
mov edi,[OutBuf]
mov esi,_StrConst1284
call __SetStrConst
; LN:8261 GOSUB OutCodeData
call OutCodeData
; LN:8262 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8263 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8264 RETURN
ret
F14:
; LN:8267 ' BUFADR(Buffer)
; LN:8268 GOSUB ClassOp
call ClassOp
; LN:8269 IF TDataType<>BUFFER THEN
cmp [TDataType],15
je _Lbl1452
; LN:8270 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8271 ENDIF
_Lbl1452:
; LN:8272 GOSUB GetIntTmp
call GetIntTmp
; LN:8273 ErrRet
; LN:8273 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1453
; LN:8273 RETURN
ret
; LN:8273 ENDIF
_Lbl1453:
; LN:8274 IF FcnCode=14 THEN
cmp [FcnCode],14
jne _Lbl1454
; LN:8275 OutBuf="mov eax,["+TSymName+"]"
mov esi,_StrConst1285
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1286
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8276 ELSE
jmp _Lbl1455
_Lbl1454:
; LN:8277 OutBuf="mov eax,["+TSymName+"+4]"
mov esi,_StrConst1287
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1288
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8278 ENDIF
_Lbl1455:
; LN:8279 GOSUB OutCodeData
call OutCodeData
; LN:8280 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8281 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8282 RETURN
ret
F15:
; LN:8285 ' BUFSIZ(Buffer)
; LN:8286 GOSUB F14
call F14
; LN:8287 RETURN
ret
F16:
; LN:8290 ' TAB()
; LN:8291 IF PrintFlag=0 THEN
cmp [PrintFlag],0
jne _Lbl1456
; LN:8292 ErrNo=ErrFcn
mov dword [ErrNo],28
; LN:8293 RETURN
ret
; LN:8294 ENDIF
_Lbl1456:
; LN:8295 TabFlag=$ff
mov byte [TabFlag],255
; LN:8296 GOSUB ClassOp
call ClassOp
; LN:8297 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1457
; LN:8298 GOSUB LoadReg
call LoadReg
; LN:8299 ErrRet
; LN:8299 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1458
; LN:8299 RETURN
ret
; LN:8299 ENDIF
_Lbl1458:
; LN:8300 OutBuf="call __PrintTab"
mov edi,[OutBuf]
mov esi,_StrConst1289
call __SetStrConst
; LN:8301 GOSUB OutCodeData
call OutCodeData
; LN:8302 GOSUB CallErr
call CallErr
; LN:8303 ELSE
jmp _Lbl1459
_Lbl1457:
; LN:8304 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8305 ENDIF
_Lbl1459:
; LN:8306 RETURN
ret
F17:
; LN:8309 ' PEEK
; LN:8310 GOSUB ClassOp
call ClassOp
; LN:8311 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1460
; LN:8312 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8313 RETURN
ret
; LN:8314 ENDIF
_Lbl1460:
; LN:8315 D0Loaded=0
mov byte [D0Loaded],0
; LN:8316 GOSUB LoadReg
call LoadReg
; LN:8317 OutBuf=";(long)_Poker=eax;"
mov edi,[OutBuf]
mov esi,_StrConst1290
call __SetStrConst
; LN:8318 GOSUB OutCodeData
call OutCodeData
; LN:8319 GOSUB GetIntTmp
call GetIntTmp
; LN:8320 ErrRet
; LN:8320 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1461
; LN:8320 RETURN
ret
; LN:8320 ENDIF
_Lbl1461:
; LN:8321 OutBuf=";"+SymTemp.SymName+"=*_Poker;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1291
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1292
mov [_TmpVec3],esi
mov [_TmpVec3+4],10
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8322 GOSUB OutCodeData
call OutCodeData
; LN:8323 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8324 RETURN
ret
F18:
; LN:8327 ' ADDR(Var)
; LN:8328 GOSUB ClassOp
call ClassOp
; LN:8329 IF FloatFlag>0 THEN
cmp [FloatFlag],0
jle _Lbl1462
; LN:8330 DEC FloatFlag
dec [FloatFlag]
; LN:8331 ENDIF
_Lbl1462:
; LN:8332 IF TDataType>STRINGVAR AND TDataType<COMPLEX OR DMConst<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setg bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,14
cmp eax,edx
setl bl
and bh,bl
xor eax,eax
mov al, byte [DMConst]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1463
; LN:8333 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8334 RETURN
ret
; LN:8335 ENDIF
_Lbl1463:
; LN:8336 IF DMArray=0 THEN
cmp [DMArray],0
jne _Lbl1464
; LN:8337 GOSUB GetBase
call GetBase
; LN:8338 ELSE
jmp _Lbl1465
_Lbl1464:
; LN:8339 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1466
; LN:8340 OutBuf="mov esi,"+TSymName
mov esi,_StrConst1293
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8341 GOSUB OutCodeData
call OutCodeData
; LN:8342 ELSE
jmp _Lbl1467
_Lbl1466:
; LN:8343 OutBuf="add esi,"+STR$(CpxArrayOffset)
mov eax, dword [CpxArrayOffset]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1294
mov [_TmpVec2],esi
mov [_TmpVec2+4],9
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8344 GOSUB OutCodeData
call OutCodeData
; LN:8345 ENDIF
_Lbl1467:
; LN:8346 ENDIF
_Lbl1465:
; LN:8347 OutBuf="mov eax,esi"
mov edi,[OutBuf]
mov esi,_StrConst1295
call __SetStrConst
; LN:8348 GOSUB OutCodeData
call OutCodeData
; LN:8349 GOSUB GetIntTmp
call GetIntTmp
; LN:8350 ErrRet
; LN:8350 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1468
; LN:8350 RETURN
ret
; LN:8350 ENDIF
_Lbl1468:
; LN:8351 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8352 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8353 RETURN
ret
F19:
; LN:8356 ' LXOR(IntExpr)
; LN:8357 GOSUB F5
call F5
; LN:8358 RETURN
ret
F20:
; LN:8361 ' LNOT(IntExpr)
; LN:8362 GOSUB ClassOp
call ClassOp
; LN:8363 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1469
; LN:8364 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8365 RETURN
ret
; LN:8366 ENDIF
_Lbl1469:
; LN:8367 IF TSymName<>"~" THEN
mov esi,_StrConst1296
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1470
; LN:8368 D0Loaded=0
mov byte [D0Loaded],0
; LN:8369 GOSUB LoadReg
call LoadReg
; LN:8370 ErrMain
; LN:8370 IF ErrNo<>0 THEN MainLoop
cmp [ErrNo],0
jne MainLoop
; LN:8371 ENDIF
_Lbl1470:
; LN:8372 GOSUB GetIntTmp
call GetIntTmp
; LN:8373 ErrRet
; LN:8373 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1472
; LN:8373 RETURN
ret
; LN:8373 ENDIF
_Lbl1472:
; LN:8374 OutBuf="not "+Reg0Name
mov esi,_StrConst1297
mov [_TmpVec1],esi
mov [_TmpVec1+4],5
mov [_TmpVec1+8],0
mov edi,[Reg0Name]
mov [_TmpVec2],edi
mov edi,[Reg0Name+4]
mov [_TmpVec2+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8375 GOSUB OutCodeData
call OutCodeData
; LN:8376 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8377 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8378 RETURN
ret
F21:
; LN:8381 ' INDEX(Pointer,IntExpr)
; LN:8382 GOSUB ClassOp
call ClassOp
; LN:8383 IF DMAddr=0 THEN
cmp [DMAddr],0
jne _Lbl1473
; LN:8384 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8385 RETURN
ret
; LN:8386 ENDIF
_Lbl1473:
; LN:8387 FcnOp1Nam=TSymName
mov edi,FcnOp1Nam
mov esi,TSymName
call __MovStr
; LN:8388 IF DMVector<>0 THEN
cmp [DMVector],0
je _Lbl1474
; LN:8389 FcnOp1Nam=FcnOp1Nam+"._Ptr"
mov edi,[FcnOp1Nam]
mov [_TmpVec1],edi
mov edi,[FcnOp1Nam+4]
mov [_TmpVec1+4],edi
mov edi,[FcnOp1Nam+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst1298
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,FcnOp1Nam
mov esi,_TmpVec1
call __MovStr
; LN:8390 ENDIF
_Lbl1474:
; LN:8391 GOSUB GetVarSiz
call GetVarSiz
; LN:8392 INC ExpNdx
inc [ExpNdx]
; LN:8393 GOSUB ClassOp
call ClassOp
; LN:8394 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1475
; LN:8395 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8396 RETURN
ret
; LN:8397 ENDIF
_Lbl1475:
; LN:8398 GOSUB GetIntTmp
call GetIntTmp
; LN:8399 ErrRet
; LN:8399 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1476
; LN:8399 RETURN
ret
; LN:8399 ENDIF
_Lbl1476:
; LN:8400 OutBuf="mov eax,"+TSymName
mov esi,_StrConst1299
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8401 GOSUB OutCodeData
call OutCodeData
; LN:8402 OutBuf="imul eax,"+STR$(VarSize)
mov eax, dword [VarSize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1300
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8403 GOSUB OutCodeData
call OutCodeData
; LN:8404 OutBuf="add eax,["+FcnOp1Nam+"]"
mov esi,_StrConst1301
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[FcnOp1Nam]
mov [_TmpVec2],edi
mov edi,[FcnOp1Nam+4]
mov [_TmpVec2+4],edi
mov edi,[FcnOp1Nam+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1302
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8405 GOSUB OutCodeData
call OutCodeData
; LN:8406 OutBuf="mov ["+SymTemp.SymName+"],eax"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1303
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1304
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8407 GOSUB OutCodeData
call OutCodeData
; LN:8408 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8409 RETURN
ret
GetVarSiz:
; LN:8412 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:8413 CASE COMPLEX
mov eax,14
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1478
; LN:8414 VarSize=SymTable(TDetail).DataSize
mov esi,SymTable-(1*60)+40
mov eax, dword [TDetail]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [VarSize],eax
; LN:8415 CASE STRINGVAR
jmp _Lbl1477
_Lbl1478:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1479
; LN:8416 VarSize=TDetail
mov eax, dword [TDetail]
mov [VarSize],eax
; LN:8417 CASE BOOLVAR
jmp _Lbl1477
_Lbl1479:
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1480
; LN:8418 VarSize=1
mov dword [VarSize],1
; LN:8419 CASE BYTEVAR
jmp _Lbl1477
_Lbl1480:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1481
; LN:8420 VarSize=1
mov dword [VarSize],1
; LN:8421 CASE WORDVAR
jmp _Lbl1477
_Lbl1481:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1482
; LN:8422 VarSize=2
mov dword [VarSize],2
; LN:8423 CASE LONGVAR
jmp _Lbl1477
_Lbl1482:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1483
; LN:8424 VarSize=4
mov dword [VarSize],4
; LN:8425 CASE FLOATVAR
jmp _Lbl1477
_Lbl1483:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1484
; LN:8426 VarSize=8
mov dword [VarSize],8
; LN:8427 END SELECT
jmp _Lbl1477
_Lbl1484:
_Lbl1477:
; LN:8428 RETURN
ret
F22:
; LN:8431 ' SIZE(Var)
; LN:8432 GOSUB ClassOp
call ClassOp
; LN:8433 IF FloatFlag>0 THEN
cmp [FloatFlag],0
jle _Lbl1485
; LN:8434 DEC FloatFlag
dec [FloatFlag]
; LN:8435 ENDIF
_Lbl1485:
; LN:8436 IF TDataType<1 OR TDataType>6 THEN SIZE1
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,1
cmp eax,edx
setl bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setg bl
or bh,bl
je _Lbl1486
jmp SIZE1
_Lbl1486:
; LN:8437 VarSize=TDataSize
mov eax, dword [TDataSize]
mov [VarSize],eax
; LN:8438 GOTO SIZE2
jmp SIZE2
SIZE1:
; LN:8440 IF TDataType=BUFFER THEN
cmp [TDataType],15
jne _Lbl1487
; LN:8441 VarSize=8
mov dword [VarSize],8
; LN:8442 GOTO SIZE2
jmp SIZE2
; LN:8443 ENDIF
_Lbl1487:
; LN:8444 IF TDataType=COMPLEX THEN
cmp [TDataType],14
jne _Lbl1488
; LN:8445 VarSize=TDataSize
mov eax, dword [TDataSize]
mov [VarSize],eax
; LN:8446 GOTO SIZE2
jmp SIZE2
; LN:8447 ENDIF
_Lbl1488:
; LN:8448 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8449 RETURN
ret
SIZE2:
; LN:8451 GOSUB GetIntTmp
call GetIntTmp
; LN:8452 ErrRet
; LN:8452 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1489
; LN:8452 RETURN
ret
; LN:8452 ENDIF
_Lbl1489:
; LN:8453 OutBuf="mov ["+SymTemp.SymName+"],"+STR$(VarSize)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [VarSize]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1305
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_StrConst1306
mov [_TmpVec4],esi
mov [_TmpVec4+4],3
mov [_TmpVec4+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:8454 GOSUB OutCodeData
call OutCodeData
; LN:8455 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8456 RETURN
ret
F23:
; LN:8459 ' IVAL(String)
; LN:8460 GOSUB F4
call F4
; LN:8461 RETURN
ret
F24:
; LN:8464 ' FVAL(String)
; LN:8465 GOSUB F4
call F4
; LN:8466 RETURN
ret
F25:
; LN:8469 ' TRIM$
; LN:8470 GOSUB ClassOp
call ClassOp
; LN:8471 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1490
; LN:8472 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8473 RETURN
ret
; LN:8474 ENDIF
_Lbl1490:
; LN:8475 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1491
; LN:8476 GOSUB SetTmpVec
call SetTmpVec
; LN:8477 ErrRet
; LN:8477 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1492
; LN:8477 RETURN
ret
; LN:8477 ENDIF
_Lbl1492:
; LN:8478 ENDIF
_Lbl1491:
; LN:8479 OutBuf=""'call __TrmStr
mov [OutBuf+12],0
; LN:8480 GOSUB OutCodeData
call OutCodeData
; LN:8481 ExpNdx=ExpLeft+1
mov eax, dword [ExpLeft]
mov edx,1
add eax,edx
mov dword [ExpNdx],eax
; LN:8482 RETURN
ret
F26:
; LN:8485 ' FILSIZ(#FileNum)
; LN:8486 FileStat=$ff
mov byte [FileStat],255
; LN:8487 GOSUB ClassOp
call ClassOp
; LN:8488 GOSUB GetPthNum2
call GetPthNum2
; LN:8489 ErrRet
; LN:8489 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1493
; LN:8489 RETURN
ret
; LN:8489 ENDIF
_Lbl1493:
; LN:8490 OutBuf="invoke GetFileSize,[_IOPthNum],0"
mov edi,[OutBuf]
mov esi,_StrConst1307
call __SetStrConst
; LN:8491 GOSUB OutCodeData
call OutCodeData
; LN:8492 GOSUB SetStatus
call SetStatus
; LN:8493 GOSUB CallErr
call CallErr
; LN:8494 GOSUB GetIntTmp
call GetIntTmp
; LN:8495 ErrRet
; LN:8495 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1494
; LN:8495 RETURN
ret
; LN:8495 ENDIF
_Lbl1494:
; LN:8496 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8497 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8498 RETURN
ret
F27:
; LN:8501 ' FILPOS(#FileNum)
; LN:8502 FileStat=$ff
mov byte [FileStat],255
; LN:8503 GOSUB ClassOp
call ClassOp
; LN:8504 GOSUB GetPthNum2
call GetPthNum2
; LN:8505 ErrRet
; LN:8505 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1495
; LN:8505 RETURN
ret
; LN:8505 ENDIF
_Lbl1495:
; LN:8506 OutBuf="invoke SetFilePointer,[_IOPthNum],0,0,FILE_CURRENT"
mov edi,[OutBuf]
mov esi,_StrConst1308
call __SetStrConst
; LN:8507 GOSUB OutCodeData
call OutCodeData
; LN:8508 GOSUB SetStatus
call SetStatus
; LN:8509 GOSUB CallErr
call CallErr
; LN:8510 GOSUB GetIntTmp
call GetIntTmp
; LN:8511 ErrRet
; LN:8511 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1496
; LN:8511 RETURN
ret
; LN:8511 ENDIF
_Lbl1496:
; LN:8512 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8513 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8514 RETURN
ret
F28:
; LN:8517 ' SQR(Expr)
; LN:8518 GOSUB ClassOp
call ClassOp
; LN:8519 INC FloatFlag
inc [FloatFlag]
; LN:8520 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,5
cmp eax,edx
setne bl
and bh,bl
je _Lbl1497
; LN:8521 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8522 RETURN
ret
; LN:8523 ENDIF
_Lbl1497:
; LN:8524 SELECT CASE FcnCode
xor eax,eax
mov al, byte [FcnCode]
mov [_SwitchInt],eax
; LN:8525 CASE 28
mov eax,28
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1499
; LN:8526 TempStr="sqrt"
mov edi,[TempStr]
mov esi,_StrConst1309
call __SetStrConst
; LN:8527 CASE 31
jmp _Lbl1498
_Lbl1499:
mov eax,31
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1500
; LN:8528 TempStr="sin"
mov edi,[TempStr]
mov esi,_StrConst1310
call __SetStrConst
; LN:8529 CASE 32
jmp _Lbl1498
_Lbl1500:
mov eax,32
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1501
; LN:8530 TempStr="cos"
mov edi,[TempStr]
mov esi,_StrConst1311
call __SetStrConst
; LN:8531 CASE 33
jmp _Lbl1498
_Lbl1501:
mov eax,33
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1502
; LN:8532 TempStr="tan"
mov edi,[TempStr]
mov esi,_StrConst1312
call __SetStrConst
; LN:8533 CASE 34
jmp _Lbl1498
_Lbl1502:
mov eax,34
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1503
; LN:8534 TempStr="asin"
mov edi,[TempStr]
mov esi,_StrConst1313
call __SetStrConst
; LN:8535 CASE 35
jmp _Lbl1498
_Lbl1503:
mov eax,35
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1504
; LN:8536 TempStr="acos"
mov edi,[TempStr]
mov esi,_StrConst1314
call __SetStrConst
; LN:8537 CASE 36
jmp _Lbl1498
_Lbl1504:
mov eax,36
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1505
; LN:8538 TempStr="atan"
mov edi,[TempStr]
mov esi,_StrConst1315
call __SetStrConst
; LN:8539 CASE 37
jmp _Lbl1498
_Lbl1505:
mov eax,37
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1506
; LN:8540 TempStr="log"
mov edi,[TempStr]
mov esi,_StrConst1316
call __SetStrConst
; LN:8541 CASE 38
jmp _Lbl1498
_Lbl1506:
mov eax,38
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1507
; LN:8542 TempStr="log10"
mov edi,[TempStr]
mov esi,_StrConst1317
call __SetStrConst
; LN:8543 END SELECT
jmp _Lbl1498
_Lbl1507:
_Lbl1498:
; LN:8544 GOSUB GetFltTmp
call GetFltTmp
; LN:8545 ErrRet
; LN:8545 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1508
; LN:8545 RETURN
ret
; LN:8545 ENDIF
_Lbl1508:
; LN:8546 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1509
; LN:8547 OutBuf=";"+SymTemp.SymName+"="+TempStr+"((double)"+TSymName+");"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1318
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1319
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[TempStr]
mov [_TmpVec4],edi
mov edi,[TempStr+4]
mov [_TmpVec4+4],edi
mov edi,[TempStr+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1320
mov [_TmpVec5],esi
mov [_TmpVec5+4],10
mov [_TmpVec5+8],0
mov edi,[TSymName]
mov [_TmpVec6],edi
mov edi,[TSymName+4]
mov [_TmpVec6+4],edi
mov edi,[TSymName+8]
mov [_TmpVec6+8],edi
mov esi,_StrConst1321
mov [_TmpVec7],esi
mov [_TmpVec7+4],3
mov [_TmpVec7+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov esi,_TmpVec7
mov [_TmpVec6+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8548 ELSE
jmp _Lbl1510
_Lbl1509:
; LN:8549 OutBuf=";"+SymTemp.SymName+"="+TempStr+"(*((double*)"+TSymName+"._Ptr));"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1322
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1323
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[TempStr]
mov [_TmpVec4],edi
mov edi,[TempStr+4]
mov [_TmpVec4+4],edi
mov edi,[TempStr+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1324
mov [_TmpVec5],esi
mov [_TmpVec5+4],13
mov [_TmpVec5+8],0
mov edi,[TSymName]
mov [_TmpVec6],edi
mov edi,[TSymName+4]
mov [_TmpVec6+4],edi
mov edi,[TSymName+8]
mov [_TmpVec6+8],edi
mov esi,_StrConst1325
mov [_TmpVec7],esi
mov [_TmpVec7+4],9
mov [_TmpVec7+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov esi,_TmpVec7
mov [_TmpVec6+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8550 ENDIF
_Lbl1510:
; LN:8551 GOSUB OutCodeData
call OutCodeData
; LN:8552 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8553 RETURN
ret
F29:
; LN:8556 ' INT(FloatExpr)
; LN:8557 GOSUB ClassOp
call ClassOp
; LN:8558 IF FloatFlag>0 THEN
cmp [FloatFlag],0
jle _Lbl1511
; LN:8559 DEC FloatFlag
dec [FloatFlag]
; LN:8560 ENDIF
_Lbl1511:
; LN:8561 IF OpClass<>FLTClass THEN
cmp [OpClass],5
je _Lbl1512
; LN:8562 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8563 RETURN
ret
; LN:8564 ENDIF
_Lbl1512:
; LN:8565 GOSUB GetIntTmp
call GetIntTmp
; LN:8566 ErrRet
; LN:8566 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1513
; LN:8566 RETURN
ret
; LN:8566 ENDIF
_Lbl1513:
; LN:8567 IF DMVector=0 THEN
cmp [DMVector],0
jne _Lbl1514
; LN:8568 OutBuf=";"+SymTemp.SymName+"=(long)"+TSymName+";"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1326
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1327
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1328
mov [_TmpVec5],esi
mov [_TmpVec5+4],2
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8569 ELSE
jmp _Lbl1515
_Lbl1514:
; LN:8570 OutBuf=";"+SymTemp.SymName+"=(long)*((double*)"+TSymName+"._Ptr);"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1329
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1330
mov [_TmpVec3],esi
mov [_TmpVec3+4],19
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1331
mov [_TmpVec5],esi
mov [_TmpVec5+4],8
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8571 ENDIF
_Lbl1515:
; LN:8572 GOSUB OutCodeData
call OutCodeData
; LN:8573 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8574 RETURN
ret
F30:
; LN:8577 ' ABS(Expr)
; LN:8578 GOSUB ClassOp
call ClassOp
; LN:8579 IF OpClass<>INTClass AND OpClass<>FLTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,5
cmp eax,edx
setne bl
and bh,bl
je _Lbl1516
; LN:8580 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8581 RETURN
ret
; LN:8582 ENDIF
_Lbl1516:
; LN:8583 IF SymTemp.SymName<>"~" THEN
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1332
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1517
; LN:8584 D0Loaded=0
mov byte [D0Loaded],0
; LN:8585 GOSUB LoadReg
call LoadReg
; LN:8586 ENDIF
_Lbl1517:
; LN:8587 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1518
; LN:8588 GOSUB GetIntTmp
call GetIntTmp
; LN:8589 ErrRet
; LN:8589 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1519
; LN:8589 RETURN
ret
; LN:8589 ENDIF
_Lbl1519:
; LN:8590 OutBuf="cinvoke abs,eax"
mov edi,[OutBuf]
mov esi,_StrConst1333
call __SetStrConst
; LN:8591 GOSUB OutCodeData
call OutCodeData
; LN:8592 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8593 ELSE
jmp _Lbl1520
_Lbl1518:
; LN:8594 GOSUB GetFltTmp
call GetFltTmp
; LN:8595 ErrRet
; LN:8595 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1521
; LN:8595 RETURN
ret
; LN:8595 ENDIF
_Lbl1521:
; LN:8596 OutBuf=";"+SymTemp.SymName+"=fabs("+TSymName+");"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1334
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1335
mov [_TmpVec3],esi
mov [_TmpVec3+4],7
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1336
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8597 GOSUB OutCodeData
call OutCodeData
; LN:8598 ENDIF
_Lbl1520:
; LN:8599 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8600 RETURN
ret
F31:
; LN:8603 ' SIN(Expr)
; LN:8604 GOSUB F28
call F28
; LN:8605 RETURN
ret
F32:
; LN:8608 ' COS(Expr)
; LN:8609 GOSUB F28
call F28
; LN:8610 RETURN
ret
F33:
; LN:8613 ' TAN(Expr)
; LN:8614 GOSUB F28
call F28
; LN:8615 RETURN
ret
F34:
; LN:8618 ' ASN(Expr)
; LN:8619 GOSUB F28
call F28
; LN:8620 RETURN
ret
F35:
; LN:8623 ' ACS(Expr)
; LN:8624 GOSUB F28
call F28
; LN:8625 RETURN
ret
F36:
; LN:8628 ' ATN(Expr)
; LN:8629 GOSUB F28
call F28
; LN:8630 RETURN
ret
F37:
; LN:8633 ' LOG(Expr)
; LN:8634 GOSUB F28
call F28
; LN:8635 RETURN
ret
F38:
; LN:8638 ' LOG10(Expr)
; LN:8639 RETURN
ret
F39:
; LN:8642 ' Vacant
; LN:8643 RETURN
ret
F40:
; LN:8646 ' Vacant
; LN:8647 RETURN
ret
F41:
; LN:8650 ' THOUR()
; LN:8651 GOSUB DateTime
call DateTime
; LN:8652 RETURN
ret
F42:
; LN:8655 ' TMIN()
; LN:8656 GOSUB DateTime
call DateTime
; LN:8657 RETURN
ret
F43:
; LN:8660 ' TSEC()
; LN:8661 GOSUB DateTime
call DateTime
; LN:8662 RETURN
ret
F44:
; LN:8665 ' TYEAR()
; LN:8666 GOSUB DateTime
call DateTime
; LN:8667 RETURN
ret
F45:
; LN:8670 ' TMON()
; LN:8671 GOSUB DateTime
call DateTime
; LN:8672 RETURN
ret
F46:
; LN:8675 ' TDAT()
; LN:8676 GOSUB DateTime
call DateTime
; LN:8677 RETURN
ret
F47:
; LN:8680 ' TDAY()
; LN:8681 GOSUB DateTime
call DateTime
; LN:8682 RETURN
ret
DateTime:
; LN:8685 OutBuf=";_t=time(0);"
mov edi,[OutBuf]
mov esi,_StrConst1337
call __SetStrConst
; LN:8686 GOSUB OutCodeData
call OutCodeData
; LN:8687 OutBuf=";_systime=localtime(&_t);"
mov edi,[OutBuf]
mov esi,_StrConst1338
call __SetStrConst
; LN:8688 GOSUB OutCodeData
call OutCodeData
; LN:8689 GOSUB GetIntTmp
call GetIntTmp
; LN:8690 ErrRet
; LN:8690 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1522
; LN:8690 RETURN
ret
; LN:8690 ENDIF
_Lbl1522:
; LN:8691 IF FcnCode=41 THEN
cmp [FcnCode],41
jne _Lbl1523
; LN:8692 OutBuf=";"+SymTemp.SymName+"=_systime->tm_hour;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1339
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1340
mov [_TmpVec3],esi
mov [_TmpVec3+4],20
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8693 GOSUB OutCodeData
call OutCodeData
; LN:8694 ENDIF
_Lbl1523:
; LN:8695 IF FcnCode=42 THEN
cmp [FcnCode],42
jne _Lbl1524
; LN:8696 OutBuf=";"+SymTemp.SymName+"=_systime->tm_min;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1341
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1342
mov [_TmpVec3],esi
mov [_TmpVec3+4],19
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8697 GOSUB OutCodeData
call OutCodeData
; LN:8698 ENDIF
_Lbl1524:
; LN:8699 IF FcnCode=43 THEN
cmp [FcnCode],43
jne _Lbl1525
; LN:8700 OutBuf=";"+SymTemp.SymName+"=_systime->tm_sec;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1343
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1344
mov [_TmpVec3],esi
mov [_TmpVec3+4],19
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8701 GOSUB OutCodeData
call OutCodeData
; LN:8702 ENDIF
_Lbl1525:
; LN:8703 IF FcnCode=44 THEN
cmp [FcnCode],44
jne _Lbl1526
; LN:8704 OutBuf=";"+SymTemp.SymName+"=_systime->tm_year;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1345
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1346
mov [_TmpVec3],esi
mov [_TmpVec3+4],20
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8705 GOSUB OutCodeData
call OutCodeData
; LN:8706 ENDIF
_Lbl1526:
; LN:8707 IF FcnCode=45 THEN
cmp [FcnCode],45
jne _Lbl1527
; LN:8708 OutBuf=";"+SymTemp.SymName+"=_systime->tm_mon+1;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1347
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1348
mov [_TmpVec3],esi
mov [_TmpVec3+4],21
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8709 GOSUB OutCodeData
call OutCodeData
; LN:8710 ENDIF
_Lbl1527:
; LN:8711 IF FcnCode=46 THEN
cmp [FcnCode],46
jne _Lbl1528
; LN:8712 OutBuf=";"+SymTemp.SymName+"=_systime->tm_mday;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1349
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1350
mov [_TmpVec3],esi
mov [_TmpVec3+4],20
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8713 GOSUB OutCodeData
call OutCodeData
; LN:8714 ENDIF
_Lbl1528:
; LN:8715 IF FcnCode=47 THEN
cmp [FcnCode],47
jne _Lbl1529
; LN:8716 OutBuf=";"+SymTemp.SymName+"=_systime->tm_wday;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1351
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1352
mov [_TmpVec3],esi
mov [_TmpVec3+4],20
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8717 GOSUB OutCodeData
call OutCodeData
; LN:8718 ENDIF
_Lbl1529:
; LN:8719 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8720 RETURN
ret
F48:
; LN:8723 ' CHKWORD(STRING)
; LN:8724 'code template is for ASC(STRING)
; LN:8725 GOSUB ClassOp
call ClassOp
; LN:8726 IF TDataType<>STRINGVAR OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1530
; LN:8727 ErrNo=ErrFcn
mov dword [ErrNo],28
; LN:8728 RETURN
ret
; LN:8729 ENDIF
_Lbl1530:
; LN:8730 GOSUB GetIntTmp
call GetIntTmp
; LN:8731 ErrRet
; LN:8731 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1531
; LN:8731 RETURN
ret
; LN:8731 ENDIF
_Lbl1531:
; LN:8732 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst1353
call __SetStrConst
; LN:8733 GOSUB OutCodeData
call OutCodeData
; LN:8734 OutBuf="mov esi,["+TSymName+"]"
mov esi,_StrConst1354
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1355
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8735 GOSUB OutCodeData
call OutCodeData
; LN:8736 OutBuf="mov edx,["+TSymName+"+4]"
mov esi,_StrConst1356
mov [_TmpVec1],esi
mov [_TmpVec1+4],10
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1357
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8737 GOSUB OutCodeData
call OutCodeData
; LN:8738 OutBuf="xor ecx,ecx"
mov edi,[OutBuf]
mov esi,_StrConst1358
call __SetStrConst
; LN:8739 GOSUB OutCodeData
call OutCodeData
; LN:8740 INC LabelNum
inc [LabelNum]
; LN:8741 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1359
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst1360
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8742 GOSUB OutCodeData
call OutCodeData
; LN:8743 OutBuf="mov cl, byte [esi]"
mov edi,[OutBuf]
mov esi,_StrConst1361
call __SetStrConst
; LN:8744 GOSUB OutCodeData
call OutCodeData
; LN:8745 OutBuf="or cl,cl"
mov edi,[OutBuf]
mov esi,_StrConst1362
call __SetStrConst
; LN:8746 GOSUB OutCodeData
call OutCodeData
; LN:8747 OutBuf="je "+"_Lbl"+STR$(LabelNum+1)
mov eax, dword [LabelNum]
mov edx,1
add eax,edx
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1363
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst1364
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8748 GOSUB OutCodeData
call OutCodeData
; LN:8749 OutBuf="inc esi"
mov edi,[OutBuf]
mov esi,_StrConst1365
call __SetStrConst
; LN:8750 GOSUB OutCodeData
call OutCodeData
; LN:8751 OutBuf="add eax,ecx"
mov edi,[OutBuf]
mov esi,_StrConst1366
call __SetStrConst
; LN:8752 GOSUB OutCodeData
call OutCodeData
; LN:8753 OutBuf="dec edx"
mov edi,[OutBuf]
mov esi,_StrConst1367
call __SetStrConst
; LN:8754 GOSUB OutCodeData
call OutCodeData
; LN:8755 OutBuf="jne "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1368
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst1369
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8756 GOSUB OutCodeData
call OutCodeData
; LN:8757 INC LabelNum
inc [LabelNum]
; LN:8758 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1370
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst1371
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8759 GOSUB OutCodeData
call OutCodeData
; LN:8760 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8761 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8762 RETURN
ret
F49:
; LN:8765 ' HEX$(INT)
; LN:8766 GOSUB F3
call F3
; LN:8767 RETURN
ret
F50:
; LN:8770 ' BITTST(ByteVar,Bit#)
; LN:8771 GOSUB ClassOp
call ClassOp
; LN:8772 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1532
; LN:8773 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8774 RETURN
ret
; LN:8775 ENDIF
_Lbl1532:
; LN:8776 GOSUB LoadReg
call LoadReg
; LN:8777 ErrRet
; LN:8777 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1533
; LN:8777 RETURN
ret
; LN:8777 ENDIF
_Lbl1533:
; LN:8778 INC ExpNdx
inc [ExpNdx]
; LN:8779 GOSUB ClassOp
call ClassOp
; LN:8780 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1534
; LN:8781 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8782 RETURN
ret
; LN:8783 ENDIF
_Lbl1534:
; LN:8784 GOSUB LoadReg
call LoadReg
; LN:8785 ErrRet
; LN:8785 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1535
; LN:8785 RETURN
ret
; LN:8785 ENDIF
_Lbl1535:
; LN:8786 OutBuf="bt eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1372
call __SetStrConst
; LN:8787 GOSUB OutCodeData
call OutCodeData
; LN:8788 OpClass=BOOLClass
mov byte [OpClass],6
; LN:8789 TDataType=BOOLVAR
mov word [TDataType],1
; LN:8790 GOSUB GetTmp
call GetTmp
; LN:8791 ErrRet
; LN:8791 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1536
; LN:8791 RETURN
ret
; LN:8791 ENDIF
_Lbl1536:
; LN:8792 OutBuf="setc cl; Set result"
mov edi,[OutBuf]
mov esi,_StrConst1373
call __SetStrConst
; LN:8793 GOSUB OutCodeData
call OutCodeData
; LN:8794 OutBuf="mov byte ["+SymTemp.SymName+"],cl"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1374
mov [_TmpVec2],esi
mov [_TmpVec2+4],11
mov [_TmpVec2+8],0
mov esi,_StrConst1375
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8795 GOSUB OutCodeData
call OutCodeData
; LN:8796 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8797 RETURN
ret
F51:
; LN:8800 ' SHL
; LN:8801 GOSUB ClassOp
call ClassOp
; LN:8802 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1537
; LN:8803 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8804 RETURN
ret
; LN:8805 ENDIF
_Lbl1537:
; LN:8806 GOSUB LoadReg
call LoadReg
; LN:8807 ErrRet
; LN:8807 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1538
; LN:8807 RETURN
ret
; LN:8807 ENDIF
_Lbl1538:
; LN:8808 INC ExpNdx
inc [ExpNdx]
; LN:8809 GOSUB ClassOp
call ClassOp
; LN:8810 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1539
; LN:8811 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8812 RETURN
ret
; LN:8813 ENDIF
_Lbl1539:
; LN:8814 GOSUB LoadReg
call LoadReg
; LN:8815 ErrRet
; LN:8815 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1540
; LN:8815 RETURN
ret
; LN:8815 ENDIF
_Lbl1540:
; LN:8816 OutBuf="mov ecx,edx"
mov edi,[OutBuf]
mov esi,_StrConst1376
call __SetStrConst
; LN:8817 GOSUB OutCodeData
call OutCodeData
; LN:8818 OpSizeStr="cl"
mov edi,[OpSizeStr]
mov esi,_StrConst1377
call __SetStrConst
; LN:8819 SELECT CASE FcnCode
xor eax,eax
mov al, byte [FcnCode]
mov [_SwitchInt],eax
; LN:8820 CASE 51
mov eax,51
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1542
; LN:8821 TempStr="shl "
mov edi,[TempStr]
mov esi,_StrConst1378
call __SetStrConst
; LN:8822 CASE 52
jmp _Lbl1541
_Lbl1542:
mov eax,52
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1543
; LN:8823 TempStr="shr "
mov edi,[TempStr]
mov esi,_StrConst1379
call __SetStrConst
; LN:8824 CASE 53
jmp _Lbl1541
_Lbl1543:
mov eax,53
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1544
; LN:8825 TempStr="rol "
mov edi,[TempStr]
mov esi,_StrConst1380
call __SetStrConst
; LN:8826 CASE 54
jmp _Lbl1541
_Lbl1544:
mov eax,54
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1545
; LN:8827 TempStr="ror "
mov edi,[TempStr]
mov esi,_StrConst1381
call __SetStrConst
; LN:8828 CASE 55
jmp _Lbl1541
_Lbl1545:
mov eax,55
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1546
; LN:8829 TempStr="btc "
mov edi,[TempStr]
mov esi,_StrConst1382
call __SetStrConst
; LN:8830 OpSizeStr="ecx"
mov edi,[OpSizeStr]
mov esi,_StrConst1383
call __SetStrConst
; LN:8831 CASE 56
jmp _Lbl1541
_Lbl1546:
mov eax,56
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1547
; LN:8832 TempStr="btr "
mov edi,[TempStr]
mov esi,_StrConst1384
call __SetStrConst
; LN:8833 OpSizeStr="ecx"
mov edi,[OpSizeStr]
mov esi,_StrConst1385
call __SetStrConst
; LN:8834 CASE 57
jmp _Lbl1541
_Lbl1547:
mov eax,57
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1548
; LN:8835 TempStr="bts "
mov edi,[TempStr]
mov esi,_StrConst1386
call __SetStrConst
; LN:8836 OpSizeStr="ecx"
mov edi,[OpSizeStr]
mov esi,_StrConst1387
call __SetStrConst
; LN:8837 CASE 62
jmp _Lbl1541
_Lbl1548:
mov eax,62
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1549
; LN:8838 TempStr="sal "
mov edi,[TempStr]
mov esi,_StrConst1388
call __SetStrConst
; LN:8839 CASE 63
jmp _Lbl1541
_Lbl1549:
mov eax,63
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1550
; LN:8840 TempStr="sar "
mov edi,[TempStr]
mov esi,_StrConst1389
call __SetStrConst
; LN:8841 CASE 64
jmp _Lbl1541
_Lbl1550:
mov eax,64
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1551
; LN:8842 TempStr="rcl "
mov edi,[TempStr]
mov esi,_StrConst1390
call __SetStrConst
; LN:8843 CASE 65
jmp _Lbl1541
_Lbl1551:
mov eax,65
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1552
; LN:8844 TempStr="rcr "
mov edi,[TempStr]
mov esi,_StrConst1391
call __SetStrConst
; LN:8845 ENDSELECT
jmp _Lbl1541
_Lbl1552:
_Lbl1541:
; LN:8846 OutBuf=TempStr+Reg0Name+","+OpSizeStr
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov edi,[Reg0Name]
mov [_TmpVec2],edi
mov edi,[Reg0Name+4]
mov [_TmpVec2+4],edi
mov edi,[Reg0Name+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1392
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[OpSizeStr]
mov [_TmpVec4],edi
mov edi,[OpSizeStr+4]
mov [_TmpVec4+4],edi
mov edi,[OpSizeStr+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:8847 GOSUB OutCodeData
call OutCodeData
; LN:8848 GOSUB GetIntTmp
call GetIntTmp
; LN:8849 ErrRet
; LN:8849 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1553
; LN:8849 RETURN
ret
; LN:8849 ENDIF
_Lbl1553:
; LN:8850 GOSUB StoreD0Tmp
call StoreD0Tmp
; LN:8851 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8852 RETURN
ret
F52:
; LN:8855 ' SHL
; LN:8856 GOSUB F51
call F51
; LN:8857 RETURN
ret
F53:
; LN:8860 ' ROL
; LN:8861 GOSUB F51
call F51
; LN:8862 RETURN
ret
F54:
; LN:8865 ' ROR
; LN:8866 GOSUB F51
call F51
; LN:8867 RETURN
ret
F55:
; LN:8870 ' BITCHG
; LN:8871 GOSUB F51
call F51
; LN:8872 RETURN
ret
F56:
; LN:8875 ' BITCLR
; LN:8876 GOSUB F51
call F51
; LN:8877 RETURN
ret
F57:
; LN:8880 ' BITSET
; LN:8881 GOSUB F51
call F51
; LN:8882 RETURN
ret
F58:
; LN:8885 ' SUBSTR(Str1,Str2,[StartPos])
; LN:8886 GOSUB ClassOp
call ClassOp
; LN:8887 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1554
; LN:8888 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:8889 RETURN
ret
; LN:8890 ENDIF
_Lbl1554:
; LN:8891 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1555
; LN:8892 GOSUB SetTmpVec
call SetTmpVec
; LN:8893 ErrRet
; LN:8893 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1556
; LN:8893 RETURN
ret
; LN:8893 ENDIF
_Lbl1556:
; LN:8894 ENDIF
_Lbl1555:
; LN:8895 FcnOp1Nam=TSymName
mov edi,FcnOp1Nam
mov esi,TSymName
call __MovStr
; LN:8896 INC ExpNdx
inc [ExpNdx]
; LN:8897 GOSUB ClassOp
call ClassOp
; LN:8898 IF TDataType<>STRINGVAR THEN
cmp [TDataType],6
je _Lbl1557
; LN:8899 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:8900 RETURN
ret
; LN:8901 ENDIF
_Lbl1557:
; LN:8902 IF DMVector<>0 AND DMTemp=0 THEN
xor bh,bh
xor eax,eax
mov al, byte [DMVector]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMTemp]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
je _Lbl1558
; LN:8903 GOSUB SetTmpVec
call SetTmpVec
; LN:8904 ErrRet
; LN:8904 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1559
; LN:8904 RETURN
ret
; LN:8904 ENDIF
_Lbl1559:
; LN:8905 ENDIF
_Lbl1558:
; LN:8906 TempStr=TSymName
mov edi,TempStr
mov esi,TSymName
call __MovStr
; LN:8907 IF ExpRight-ExpLeft=4 THEN
mov eax, dword [ExpRight]
mov edx, dword [ExpLeft]
sub eax,edx
mov [_Tmp1],eax
cmp [_Tmp1],4
jne _Lbl1560
; LN:8908 INC ExpNdx
inc [ExpNdx]
; LN:8909 GOSUB ClassOp
call ClassOp
; LN:8910 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1561
; LN:8911 ErrNo=ErrIVType
mov dword [ErrNo],9
; LN:8912 RETURN
ret
; LN:8913 ENDIF
_Lbl1561:
; LN:8914 ELSE
jmp _Lbl1562
_Lbl1560:
; LN:8915 TSymName="1"
mov edi,[TSymName]
mov esi,_StrConst1393
call __SetStrConst
; LN:8916 ENDIF
_Lbl1562:
; LN:8917 GOSUB GetIntTmp
call GetIntTmp
; LN:8918 ErrRet
; LN:8918 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1563
; LN:8918 RETURN
ret
; LN:8918 ENDIF
_Lbl1563:
; LN:8919 OutBuf=";"+SymTemp.SymName+"=_SubStr(&"+FcnOp1Nam+",&"+TempStr+","+TSymName+");"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1394
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1395
mov [_TmpVec3],esi
mov [_TmpVec3+4],11
mov [_TmpVec3+8],0
mov edi,[FcnOp1Nam]
mov [_TmpVec4],edi
mov edi,[FcnOp1Nam+4]
mov [_TmpVec4+4],edi
mov edi,[FcnOp1Nam+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1396
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov edi,[TempStr]
mov [_TmpVec6],edi
mov edi,[TempStr+4]
mov [_TmpVec6+4],edi
mov edi,[TempStr+8]
mov [_TmpVec6+8],edi
mov esi,_StrConst1397
mov [_TmpVec7],esi
mov [_TmpVec7+4],2
mov [_TmpVec7+8],0
mov edi,[TSymName]
mov [_TmpVec8],edi
mov edi,[TSymName+4]
mov [_TmpVec8+4],edi
mov edi,[TSymName+8]
mov [_TmpVec8+8],edi
mov esi,_StrConst1398
mov [_TmpVec9],esi
mov [_TmpVec9+4],3
mov [_TmpVec9+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov esi,_TmpVec6
mov [_TmpVec5+8],esi
mov esi,_TmpVec7
mov [_TmpVec6+8],esi
mov esi,_TmpVec8
mov [_TmpVec7+8],esi
mov esi,_TmpVec9
mov [_TmpVec8+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:8920 GOSUB OutCodeData
call OutCodeData
; LN:8921 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8922 RETURN
ret
F59:
; LN:8925 ' ZSTR$(INT)
; LN:8926 GOSUB ClassOp
call ClassOp
; LN:8927 GOSUB LoadReg
call LoadReg
; LN:8928 ErrRet
; LN:8928 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1564
; LN:8928 RETURN
ret
; LN:8928 ENDIF
_Lbl1564:
; LN:8929 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1565
; LN:8930 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8931 RETURN
ret
; LN:8932 ENDIF
_Lbl1565:
; LN:8933 OutBuf=";_ZLtoA(eax);"
mov edi,[OutBuf]
mov esi,_StrConst1399
call __SetStrConst
; LN:8934 GOSUB OutCodeData
call OutCodeData
; LN:8935 GOSUB NumToA
call NumToA
; LN:8936 RETURN
ret
F60:
; LN:8939 ' ZHEX$(INT)
; LN:8940 GOSUB ClassOp
call ClassOp
; LN:8941 GOSUB LoadReg
call LoadReg
; LN:8942 ErrRet
; LN:8942 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1566
; LN:8942 RETURN
ret
; LN:8942 ENDIF
_Lbl1566:
; LN:8943 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1567
; LN:8944 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8945 RETURN
ret
; LN:8946 ENDIF
_Lbl1567:
; LN:8947 OutBuf=";_ZLtoH(eax);"
mov edi,[OutBuf]
mov esi,_StrConst1400
call __SetStrConst
; LN:8948 GOSUB OutCodeData
call OutCodeData
; LN:8949 GOSUB NumToA
call NumToA
; LN:8950 RETURN
ret
F61:
; LN:8953 ' USING()
; LN:8955 RETURN
ret
F62:
; LN:8958 ' SAL()
; LN:8959 GOSUB F51
call F51
; LN:8960 RETURN
ret
F63:
; LN:8963 ' SAR()
; LN:8964 GOSUB F51
call F51
; LN:8965 RETURN
ret
F64:
; LN:8968 ' RCL()
; LN:8969 GOSUB F51
call F51
; LN:8970 RETURN
ret
F65:
; LN:8973 ' RCR()
; LN:8974 GOSUB F51
call F51
; LN:8975 RETURN
ret
F66:
; LN:8978 ' TABLESIZE()
; LN:8979 GOSUB ClassOp
call ClassOp
; LN:8980 IF LAND(TDataMod,ArrayBit)<>ArrayBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,1
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
je _Lbl1568
; LN:8981 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:8982 RETURN
ret
; LN:8983 ENDIF
_Lbl1568:
; LN:8984 GOSUB GetIntTmp
call GetIntTmp
; LN:8985 ErrRet
; LN:8985 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1569
; LN:8985 RETURN
ret
; LN:8985 ENDIF
_Lbl1569:
; LN:8986 TempInt=TDataSize/TDataAddr
mov eax, dword [TDataSize]
mov edx, dword [TDataAddr]
mov ecx,edx
xor edx,edx
idiv ecx
mov dword [TempInt],eax
; LN:8987 OutBuf="mov ["+SymTemp.SymName+"],"+STR$(TempInt)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov eax, dword [TempInt]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec2],esi
mov [_TmpVec2+4],32
mov [_TmpVec2+8],0
mov edi,_TmpVec2
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1401
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_StrConst1402
mov [_TmpVec4],esi
mov [_TmpVec4+4],3
mov [_TmpVec4+8],0
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec1+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:8988 GOSUB OutCodeData
call OutCodeData
; LN:8989 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:8990 RETURN
ret
F67:
; LN:8993 ' FilTyp()
; LN:8994 'GetFileType
; LN:8995 RETURN
ret
F68:
; LN:8998 ' CurDir()
; LN:8999 'GetCurrentDirectory
; LN:9000 RETURN
ret
F69:
; LN:9003 ' BIN$()
; LN:9004 GOSUB F3
call F3
; LN:9005 RETURN
ret
F70:
; LN:9008 ' OCT$()
; LN:9009 GOSUB F3
call F3
; LN:9010 RETURN
ret
F71:
; LN:9013 ' Vacant()
; LN:9014 RETURN
ret
F72:
; LN:9017 ' RND()
; LN:9018 GOSUB GetIntTmp
call GetIntTmp
; LN:9019 ErrRet
; LN:9019 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1570
; LN:9019 RETURN
ret
; LN:9019 ENDIF
_Lbl1570:
; LN:9020 OutBuf=";"+SymTemp.SymName+"=rand();"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1403
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1404
mov [_TmpVec3],esi
mov [_TmpVec3+4],9
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9021 GOSUB OutCodeData
call OutCodeData
; LN:9022 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9023 RETURN
ret
F73:
; LN:9026 ' Vacant()
; LN:9027 RETURN
ret
F74:
; LN:9030 ' Vacant()
; LN:9031 RETURN
ret
F75:
; LN:9034 ' Vacant()
; LN:9035 RETURN
ret
F76:
; LN:9038 ' Vacant()
; LN:9039 RETURN
ret
F77:
; LN:9042 ' Vacant()
; LN:9043 RETURN
ret
F78:
; LN:9046 ' LCASE$()
; LN:9047 GOSUB ClassOp
call ClassOp
; LN:9048 IF TDataType<>STRINGVAR OR DMArray<>0 THEN
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [DMArray]
mov edx,0
cmp eax,edx
setne bl
or bh,bl
je _Lbl1571
; LN:9049 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9050 RETURN
ret
; LN:9051 ENDIF
_Lbl1571:
; LN:9052 OutBuf="mov edi,_IOBuffer"
mov edi,[OutBuf]
mov esi,_StrConst1405
call __SetStrConst
; LN:9053 GOSUB OutCodeData
call OutCodeData
; LN:9054 OutBuf="mov esi,"+TSymName
mov esi,_StrConst1406
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9055 GOSUB OutCodeData
call OutCodeData
; LN:9056 UseMovStr=TRUE
mov byte [UseMovStr],1
; LN:9057 OutBuf="call __MovStr"
mov edi,[OutBuf]
mov esi,_StrConst1407
call __SetStrConst
; LN:9058 GOSUB OutCodeData
call OutCodeData
; LN:9059 OutBuf="mov esi,_IOBuffer"
mov edi,[OutBuf]
mov esi,_StrConst1408
call __SetStrConst
; LN:9060 GOSUB OutCodeData
call OutCodeData
; LN:9061 IF FcnCode=78 THEN
cmp [FcnCode],78
jne _Lbl1572
; LN:9062 UseLCase=TRUE
mov byte [UseLCase],1
; LN:9063 OutBuf="call __LCase"
mov edi,[OutBuf]
mov esi,_StrConst1409
call __SetStrConst
; LN:9064 ELSE
jmp _Lbl1573
_Lbl1572:
; LN:9065 UseUCase=TRUE
mov byte [UseUCase],1
; LN:9066 OutBuf="call __UCase"
mov edi,[OutBuf]
mov esi,_StrConst1410
call __SetStrConst
; LN:9067 ENDIF
_Lbl1573:
; LN:9068 GOSUB OutCodeData
call OutCodeData
; LN:9069 ExpTable(ExpNdx)=96
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax,96
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9070 RETURN
ret
F79:
; LN:9073 ' UCASE$()
; LN:9074 GOTO F77
jmp F77
F80:
; LN:9077 ' Tail$(String,Quantity)
; LN:9078 IF Target<>0 THEN
cmp [Target],0
je _Lbl1574
; LN:9079 ErrNo=ErrIVTarg
mov dword [ErrNo],29
; LN:9080 RETURN
ret
; LN:9081 ENDIF
_Lbl1574:
; LN:9082 GOSUB MidLftRt
call MidLftRt
; LN:9083 RETURN
ret
F81:
; LN:9086 ' FINDADDR()
; LN:9087 GOSUB ClassOp
call ClassOp
; LN:9088 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1575
; LN:9089 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9090 RETURN
ret
; LN:9091 ENDIF
_Lbl1575:
; LN:9092 D0Loaded=0
mov byte [D0Loaded],0
; LN:9093 GOSUB LoadReg
call LoadReg
; LN:9094 OutBuf="mov [_Poker],eax"
mov edi,[OutBuf]
mov esi,_StrConst1411
call __SetStrConst
; LN:9095 GOSUB OutCodeData
call OutCodeData
; LN:9096 INC ExpNdx
inc [ExpNdx]
; LN:9097 GOSUB ClassOp
call ClassOp
; LN:9098 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1576
; LN:9099 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9100 RETURN
ret
; LN:9101 ENDIF
_Lbl1576:
; LN:9102 D0Loaded=0
mov byte [D0Loaded],0
; LN:9103 GOSUB LoadReg
call LoadReg
; LN:9104 OutBuf="mov [_ArgSafe0],eax"
mov edi,[OutBuf]
mov esi,_StrConst1412
call __SetStrConst
; LN:9105 GOSUB OutCodeData
call OutCodeData
; LN:9106 INC ExpNdx
inc [ExpNdx]
; LN:9107 GOSUB ClassOp
call ClassOp
; LN:9108 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1577
; LN:9109 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9110 RETURN
ret
; LN:9111 ENDIF
_Lbl1577:
; LN:9112 D0Loaded=0
mov byte [D0Loaded],0
; LN:9113 GOSUB LoadReg 
call LoadReg
; LN:9114 GOSUB GetIntTmp
call GetIntTmp
; LN:9115 ErrRet
; LN:9115 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1578
; LN:9115 RETURN
ret
; LN:9115 ENDIF
_Lbl1578:
; LN:9116 OutBuf=";"+SymTemp.SymName+"=0;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1413
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1414
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9117 GOSUB OutCodeData
call OutCodeData
; LN:9118 OutBuf=";while (_ArgSafe0){"
mov edi,[OutBuf]
mov esi,_StrConst1415
call __SetStrConst
; LN:9119 GOSUB OutCodeData
call OutCodeData
; LN:9120 OutBuf=";if(*_Poker == eax){"
mov edi,[OutBuf]
mov esi,_StrConst1416
call __SetStrConst
; LN:9121 GOSUB OutCodeData
call OutCodeData
; LN:9122 OutBuf=";"+SymTemp.SymName+"=(long)_Poker;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1417
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1418
mov [_TmpVec3],esi
mov [_TmpVec3+4],15
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9123 GOSUB OutCodeData
call OutCodeData
; LN:9124 OutBuf=";break;}"
mov edi,[OutBuf]
mov esi,_StrConst1419
call __SetStrConst
; LN:9125 GOSUB OutCodeData
call OutCodeData
; LN:9126 OutBuf=";_Poker++;"
mov edi,[OutBuf]
mov esi,_StrConst1420
call __SetStrConst
; LN:9127 GOSUB OutCodeData
call OutCodeData
; LN:9128 OutBuf=";_ArgSafe0--;}"
mov edi,[OutBuf]
mov esi,_StrConst1421
call __SetStrConst
; LN:9129 GOSUB OutCodeData
call OutCodeData
; LN:9130 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9131 RETURN
ret
F82:
; LN:9134 ' FINDOFFS()
; LN:9135 GOSUB ClassOp
call ClassOp
; LN:9136 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1579
; LN:9137 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9138 RETURN
ret
; LN:9139 ENDIF
_Lbl1579:
; LN:9140 D0Loaded=0
mov byte [D0Loaded],0
; LN:9141 GOSUB LoadReg
call LoadReg
; LN:9143 ' %%%%%%%%%%%############ bug follows
; LN:9144 OutBuf="mov [_Poker],eax"
mov edi,[OutBuf]
mov esi,_StrConst1422
call __SetStrConst
; LN:9145 OutBuf="mov [_ArgSafe1],eax"
mov edi,[OutBuf]
mov esi,_StrConst1423
call __SetStrConst
; LN:9146 GOSUB OutCodeData
call OutCodeData
; LN:9147 GOSUB OutCodeData
call OutCodeData
; LN:9149 INC ExpNdx
inc [ExpNdx]
; LN:9150 GOSUB ClassOp
call ClassOp
; LN:9151 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1580
; LN:9152 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9153 RETURN
ret
; LN:9154 ENDIF
_Lbl1580:
; LN:9155 D0Loaded=0
mov byte [D0Loaded],0
; LN:9156 GOSUB LoadReg
call LoadReg
; LN:9157 OutBuf="mov [_ArgSafe0],eax"
mov edi,[OutBuf]
mov esi,_StrConst1424
call __SetStrConst
; LN:9158 GOSUB OutCodeData
call OutCodeData
; LN:9159 INC ExpNdx
inc [ExpNdx]
; LN:9160 GOSUB ClassOp
call ClassOp
; LN:9161 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1581
; LN:9162 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9163 RETURN
ret
; LN:9164 ENDIF
_Lbl1581:
; LN:9165 D0Loaded=0
mov byte [D0Loaded],0
; LN:9166 GOSUB LoadReg 
call LoadReg
; LN:9167 GOSUB GetIntTmp
call GetIntTmp
; LN:9168 ErrRet
; LN:9168 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1582
; LN:9168 RETURN
ret
; LN:9168 ENDIF
_Lbl1582:
; LN:9169 OutBuf=";"+SymTemp.SymName+"=-1;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1425
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1426
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9170 GOSUB OutCodeData
call OutCodeData
; LN:9171 OutBuf=";while (_ArgSafe0){"
mov edi,[OutBuf]
mov esi,_StrConst1427
call __SetStrConst
; LN:9172 GOSUB OutCodeData
call OutCodeData
; LN:9173 OutBuf=";if(*_Poker == eax){"
mov edi,[OutBuf]
mov esi,_StrConst1428
call __SetStrConst
; LN:9174 GOSUB OutCodeData
call OutCodeData
; LN:9175 OutBuf=";"+SymTemp.SymName+"=(long)_Poker-_ArgSafe1;"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1429
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_StrConst1430
mov [_TmpVec3],esi
mov [_TmpVec3+4],25
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9176 GOSUB OutCodeData
call OutCodeData
; LN:9177 OutBuf=";break;}"
mov edi,[OutBuf]
mov esi,_StrConst1431
call __SetStrConst
; LN:9178 GOSUB OutCodeData
call OutCodeData
; LN:9179 OutBuf=";_Poker++;"
mov edi,[OutBuf]
mov esi,_StrConst1432
call __SetStrConst
; LN:9180 GOSUB OutCodeData
call OutCodeData
; LN:9181 OutBuf=";_BlkCnt++;"
mov edi,[OutBuf]
mov esi,_StrConst1433
call __SetStrConst
; LN:9182 GOSUB OutCodeData
call OutCodeData
; LN:9183 OutBuf=";_ArgSafe0--;}"
mov edi,[OutBuf]
mov esi,_StrConst1434
call __SetStrConst
; LN:9184 GOSUB OutCodeData
call OutCodeData
; LN:9185 ExpTable(ExpNdx)=SymNdx
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov eax, dword [SymNdx]
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9186 RETURN
ret
OutCodeData:
; LN:9189 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9190 IF StartFlag=$ff THEN
cmp [StartFlag],255
jne _Lbl1583
; LN:9191 IF ProcFcnFlag=0 THEN
cmp [ProcFcnFlag],0
jne _Lbl1584
; LN:9192 GOSUB OutCode
call OutCode
; LN:9193 ELSE
jmp _Lbl1585
_Lbl1584:
; LN:9194 GOSUB OutFunction
call OutFunction
; LN:9195 ENDIF
_Lbl1585:
; LN:9196 ELSE
jmp _Lbl1586
_Lbl1583:
; LN:9197 WRITE #DataFile,OutBuf
mov eax, dword [DataFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9198 ENDIF
_Lbl1586:
; LN:9199 RETURN
ret
OutDim:
; LN:9202 WRITE #DimFile,OutBuf
mov eax, dword [DimFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9203 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9204 RETURN
ret
OutDeclare:
; LN:9207 WRITE #DeclareFile,OutBuf
mov eax, dword [DeclareFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9208 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9209 RETURN
ret
OutInitData:
; LN:9212 WRITE #DataFile,OutBuf
mov eax, dword [DataFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9213 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9214 RETURN
ret
OutCode:
; LN:9217 'LastFilePos=FILPOS(#CodeFile)
; LN:9218 WRITE #CodeFile,OutBuf
mov eax, dword [CodeFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9219 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9220 RETURN
ret
OutFunction:
; LN:9223 WRITE #FunctionFile,OutBuf
mov eax, dword [FunctionFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9224 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9225 RETURN
ret
OutPreCode:
; LN:9228 WRITE #PreCodeFile,OutBuf
mov eax, dword [PreCodeFile]
mov [_IOPthNum],eax
mov esi,[OutBuf]
mov [_XferAddr],esi
mov [__ByteCounter],500
call __WriteFile
; LN:9229 INC AsmLineCtr
inc [AsmLineCtr]
; LN:9230 RETURN
ret
StoreD0Tmp:
; LN:9233 OutBuf="mov ["+SymTemp.SymName+"],eax"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1435
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1436
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9234 GOSUB OutCodeData
call OutCodeData
; LN:9235 D1Cleared=0
mov byte [D1Cleared],0
; LN:9236 RETURN
ret
OutWrite:
; LN:9239 IF PrintFlag=0 THEN
cmp [PrintFlag],0
jne _Lbl1587
; LN:9240 OutBuf="invoke WriteFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0"
mov edi,[OutBuf]
mov esi,_StrConst1437
call __SetStrConst
; LN:9241 ELSE
jmp _Lbl1588
_Lbl1587:
; LN:9242 OutBuf=";STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
mov edi,[OutBuf]
mov esi,_StrConst1438
call __SetStrConst
; LN:9243 ENDIF
_Lbl1588:
; LN:9244 GOSUB OutCodeData
call OutCodeData
; LN:9245 GOSUB SetStatus
call SetStatus
; LN:9246 GOSUB CallErrZ
call CallErrZ
; LN:9247 RETURN
ret
OutRead:
; LN:9250 OutBuf="invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0"
mov edi,[OutBuf]
mov esi,_StrConst1439
call __SetStrConst
; LN:9251 GOSUB OutCodeData
call OutCodeData
; LN:9252 GOSUB SetStatus
call SetStatus
; LN:9253 GOSUB CallErrZ
call CallErrZ
; LN:9254 RETURN
ret
SetStatus:
; LN:9257 OutBuf="mov [STATUS],eax"
mov edi,[OutBuf]
mov esi,_StrConst1440
call __SetStrConst
; LN:9258 GOSUB OutCodeData
call OutCodeData
; LN:9259 RETURN
ret
OutCRLF:
; LN:9262 OutBuf="mov [_XferAddr],_CRLF"
mov edi,[OutBuf]
mov esi,_StrConst1441
call __SetStrConst
; LN:9263 GOSUB OutCodeData
call OutCodeData
; LN:9264 OutBuf="mov [XferCount],2"
mov edi,[OutBuf]
mov esi,_StrConst1442
call __SetStrConst
; LN:9265 GOSUB OutCodeData
call OutCodeData
; LN:9266 OutBuf=";STATUS=write(_PrtPthNum,_XferAddr,XferCount);"
mov edi,[OutBuf]
mov esi,_StrConst1443
call __SetStrConst
; LN:9267 GOSUB OutCodeData
call OutCodeData
; LN:9268 GOSUB CallErr 
call CallErr
; LN:9269 RETURN
ret
MacDefInc:
; LN:9272 INC MacDefNdx
inc [MacDefNdx]
; LN:9273 IF MacDefNdx>MacBufSiz THEN
cmp [MacDefNdx],50000
jle _Lbl1589
; LN:9274 DEC MacDefNdx
dec [MacDefNdx]
; LN:9275 ErrNo=ErrMacBuf
mov dword [ErrNo],16
; LN:9276 ENDIF
_Lbl1589:
; LN:9277 RETURN
ret
IncConStk:
; LN:9280 INC ConStkPtr
inc [ConStkPtr]
; LN:9281 IF ConStkPtr>40 THEN
cmp [ConStkPtr],40
jle _Lbl1590
; LN:9282 ErrNo=ErrNDeep
mov dword [ErrNo],20
; LN:9283 ENDIF
_Lbl1590:
; LN:9284 RETURN
ret
MakString:
; LN:9287 IF OpClass=BOOLClass THEN
cmp [OpClass],6
jne _Lbl1591
; LN:9288 IF TSymName<>"~" THEN
mov esi,_StrConst1444
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1592
; LN:9289 D0Loaded=0
mov byte [D0Loaded],0
; LN:9290 GOSUB LoadReg
call LoadReg
; LN:9291 ErrRet
; LN:9291 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1593
; LN:9291 RETURN
ret
; LN:9291 ENDIF
_Lbl1593:
; LN:9292 ENDIF
_Lbl1592:
; LN:9293 UseBtoA=TRUE
mov byte [UseBtoA],1
; LN:9294 OutBuf="call __BtoA"
mov edi,[OutBuf]
mov esi,_StrConst1445
call __SetStrConst
; LN:9295 GOSUB OutCodeData
call OutCodeData
; LN:9296 GOSUB NumToA
call NumToA
; LN:9297 RETURN
ret
; LN:9298 ENDIF
_Lbl1591:
; LN:9299 IF TSymName<>"~" THEN
mov esi,_StrConst1446
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1594
; LN:9300 D0Loaded=0
mov byte [D0Loaded],0
; LN:9301 GOSUB LoadReg
call LoadReg
; LN:9302 ErrRet
; LN:9302 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1595
; LN:9302 RETURN
ret
; LN:9302 ENDIF
_Lbl1595:
; LN:9303 ENDIF
_Lbl1594:
; LN:9304 IF FloatFlag=0 THEN
cmp [FloatFlag],0
jne _Lbl1596
; LN:9305 OutBuf="cinvoke ltoa,eax,[_ConvBuf1],10"
mov edi,[OutBuf]
mov esi,_StrConst1447
call __SetStrConst
; LN:9306 ELSE
jmp _Lbl1597
_Lbl1596:
; LN:9307 OutBuf=";_DtoA(eaxf);"
mov edi,[OutBuf]
mov esi,_StrConst1448
call __SetStrConst
; LN:9308 ENDIF
_Lbl1597:
; LN:9309 GOSUB OutCodeData
call OutCodeData
; LN:9310 GOSUB NumToA
call NumToA
; LN:9311 RETURN
ret
ConStkChk:
; LN:9314 IF ConStkPtr<1 THEN
cmp [ConStkPtr],1
jge _Lbl1598
; LN:9315 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:9316 RETURN
ret
; LN:9317 ENDIF
_Lbl1598:
; LN:9318 IF ConStk(ConStkPtr).ConType<>TempInt THEN
mov esi,ConStk-(1*73)+36
mov eax, dword [ConStkPtr]
imul eax,73
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx, dword [TempInt]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1599
; LN:9319 ErrNo=ErrUBCon
mov dword [ErrNo],19
; LN:9320 ENDIF
_Lbl1599:
; LN:9321 RETURN
ret
StrSiz:
; LN:9324 SymNdxSaf=SymNdx
mov eax, dword [SymNdx]
mov [SymNdxSaf],eax
; LN:9325 TokenBuf=SymTemp.SymName
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,TokenBuf
mov esi,_TmpVec1
call __MovStr
; LN:9326 TempByte=LEFT$(TempStr,1)
mov edi,[TempStr]
mov [_TmpVec1],edi
mov edi,[TempStr+4]
mov [_TmpVec1+4],edi
mov edi,[TempStr+8]
mov [_TmpVec1+8],edi
mov esi,_TmpVec1
mov eax,1
mov edx,eax
mov eax,1
call __MidStr
mov edi,TempByte
mov esi,_TmpVec1
call __MovStr
; LN:9327 IF TempByte>="0" AND TempByte<="9" THEN
mov esi,_StrConst1449
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setge bl
or bh,bl
mov esi,_StrConst1450
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,TempByte
mov esi,_TmpVec1
call __CmpStr
setle bl
and bh,bl
je _Lbl1600
; LN:9328 TempInt=VAL(TempStr)
mov esi,[TempStr]
call __AtoL
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov dword [TempInt],eax
; LN:9329 ELSE
jmp _Lbl1601
_Lbl1600:
; LN:9330 SymTemp.SymName=TempStr
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TempStr
call __MovStr
; LN:9331 GOSUB SymSrch
call SymSrch
; LN:9332 IF SymFound=$ff AND SymTable(SymNdx).DataType=COMPVAR OR SymTable(SymNdx).DataType=MACROVAR THEN
xor bh,bh
xor eax,eax
mov al, byte [SymFound]
mov edx,255
cmp eax,edx
sete bl
or bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,0
cmp eax,edx
sete bl
and bh,bl
mov esi,SymTable-(1*60)+28
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov ax, word [edi]
mov edx,8
cmp eax,edx
sete bl
or bh,bl
je _Lbl1602
; LN:9333 TempInt=SymTable(SymNdx).Detail
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov dword [TempInt],eax
; LN:9334 ELSE
jmp _Lbl1603
_Lbl1602:
; LN:9335 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:9336 RETURN
ret
; LN:9337 ENDIF
_Lbl1603:
; LN:9338 ENDIF
_Lbl1601:
; LN:9339 SymNdx=SymNdxSaf
mov eax, dword [SymNdxSaf]
mov [SymNdx],eax
; LN:9340 SymTemp.SymName=TokenBuf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenBuf
call __MovStr
; LN:9341 RETURN
ret
Remark:
; LN:9344 OutBuf="; LN:"+STR$(BasicLineCtr)+" "+SrcLine
mov eax, dword [BasicLineCtr]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1451
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_StrConst1452
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov edi,[SrcLine]
mov [_TmpVec4],edi
mov edi,[SrcLine+4]
mov [_TmpVec4+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9345 RETURN
ret
BldComment:
; LN:9348 OutBuf=";"+Comment
mov esi,_StrConst1453
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[Comment]
mov [_TmpVec2],edi
mov edi,[Comment+4]
mov [_TmpVec2+4],edi
mov edi,[Comment+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9349 RETURN
ret
GetDtaTyp:
; LN:9352 SELECT CASE TDataType
xor eax,eax
mov ax, word [TDataType]
mov [_SwitchInt],eax
; LN:9353 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1605
; LN:9354 _DataType=" byte "
mov edi,[_DataType]
mov esi,_StrConst1454
call __SetStrConst
; LN:9355 CASE BYTEVAR
jmp _Lbl1604
_Lbl1605:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1606
; LN:9356 _DataType=" byte "
mov edi,[_DataType]
mov esi,_StrConst1455
call __SetStrConst
; LN:9357 CASE WORDVAR
jmp _Lbl1604
_Lbl1606:
mov eax,3
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1607
; LN:9358 _DataType=" word "
mov edi,[_DataType]
mov esi,_StrConst1456
call __SetStrConst
; LN:9359 CASE LONGVAR
jmp _Lbl1604
_Lbl1607:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1608
; LN:9360 _DataType=" dword "
mov edi,[_DataType]
mov esi,_StrConst1457
call __SetStrConst
; LN:9361 CASE FLOATVAR
jmp _Lbl1604
_Lbl1608:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1609
; LN:9362 _DataType=" double "
mov edi,[_DataType]
mov esi,_StrConst1458
call __SetStrConst
; LN:9363 END SELECT
jmp _Lbl1604
_Lbl1609:
_Lbl1604:
; LN:9364 IF LAND(TDataMod,PointerBit)=PointerBit THEN
xor eax,eax
mov ax, word [TDataMod]
mov edx,2
and eax,edx
mov [_Tmp1],eax
xor bh,bh
mov eax, dword [_Tmp1]
mov edx,2
cmp eax,edx
sete bl
or bh,bl
je _Lbl1610
; LN:9365 _DataType=" dword "
mov edi,[_DataType]
mov esi,_StrConst1459
call __SetStrConst
; LN:9366 ENDIF
_Lbl1610:
; LN:9367 RETURN
ret
VecSymNam:
; LN:9370 'GOSUB GetDtaTyp
; LN:9371 VSymName=TSymName
mov edi,VSymName
mov esi,TSymName
call __MovStr
; LN:9372 TSymName="["+VSymName+"]"
mov esi,_StrConst1460
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
mov edi,[VSymName]
mov [_TmpVec2],edi
mov edi,[VSymName+4]
mov [_TmpVec2+4],edi
mov edi,[VSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1461
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,TSymName
mov esi,_TmpVec1
call __MovStr
; LN:9373 RETURN
ret
GetIntOp:
; LN:9376 GOSUB Expr
call Expr
; LN:9377 ErrRet
; LN:9377 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1611
; LN:9377 RETURN
ret
; LN:9377 ENDIF
_Lbl1611:
; LN:9378 IF OpClass<>INTClass THEN
cmp [OpClass],1
je _Lbl1612
; LN:9379 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9380 RETURN
ret
; LN:9381 ENDIF
_Lbl1612:
; LN:9382 IF SymTemp.SymName<>"~" THEN
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1462
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
xor bh,bh
mov edi,_TmpVec1
mov esi,_TmpVec2
call __CmpStr
setne bl
or bh,bl
je _Lbl1613
; LN:9383 D0Loaded=0
mov byte [D0Loaded],0
; LN:9384 GOSUB LoadReg
call LoadReg
; LN:9385 ENDIF
_Lbl1613:
; LN:9386 RETURN
ret
GetFltOp:
; LN:9389 GOSUB Expr
call Expr
; LN:9390 ErrRet
; LN:9390 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1614
; LN:9390 RETURN
ret
; LN:9390 ENDIF
_Lbl1614:
; LN:9391 IF OpClass<>FLTClass AND OpClass<>INTClass THEN
xor bh,bh
xor eax,eax
mov al, byte [OpClass]
mov edx,5
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl1615
; LN:9392 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9393 RETURN
ret
; LN:9394 ENDIF
_Lbl1615:
; LN:9395 IF TSymName="~" AND OpClass=INTClass THEN
mov esi,_StrConst1463
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
sete bl
and bh,bl
je _Lbl1616
; LN:9396 TSymName="eax"
mov edi,[TSymName]
mov esi,_StrConst1464
call __SetStrConst
; LN:9397 ENDIF
_Lbl1616:
; LN:9398 IF TSymName<>"~" OR OpClass=INTClass THEN
mov esi,_StrConst1465
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
xor eax,eax
mov al, byte [OpClass]
mov edx,1
cmp eax,edx
sete bl
or bh,bl
je _Lbl1617
; LN:9399 OutBuf=";eaxf="+TSymName+";"
mov esi,_StrConst1466
mov [_TmpVec1],esi
mov [_TmpVec1+4],7
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1467
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9400 GOSUB OutCodeData
call OutCodeData
; LN:9401 ENDIF
_Lbl1617:
; LN:9402 RETURN
ret
GetComma:
; LN:9405 GOSUB NexToken
call NexToken
; LN:9406 IF TokenBuf<>"," THEN
mov esi,_StrConst1468
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1618
; LN:9407 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9408 ENDIF
_Lbl1618:
; LN:9409 RETURN
ret
GetColon:
; LN:9412 GOSUB NexToken
call NexToken
; LN:9413 IF TokenBuf<>":" THEN
mov esi,_StrConst1469
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1619
; LN:9414 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9415 ENDIF
_Lbl1619:
; LN:9416 RETURN
ret
GetEqual:
; LN:9419 GOSUB NexToken
call NexToken
; LN:9420 IF TokenBuf<>"=" THEN
mov esi,_StrConst1470
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1620
; LN:9421 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9422 ENDIF
_Lbl1620:
; LN:9423 RETURN
ret
SubLoad:
; LN:9426 D0Loaded=0
mov byte [D0Loaded],0
; LN:9427 GOSUB LoadReg
call LoadReg
; LN:9428 ErrRet
; LN:9428 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1621
; LN:9428 RETURN
ret
; LN:9428 ENDIF
_Lbl1621:
; LN:9429 IF FloatFlag<>0 THEN
cmp [FloatFlag],0
je _Lbl1622
; LN:9430 OutBuf=";eax=eaxf;"
mov edi,[OutBuf]
mov esi,_StrConst1471
call __SetStrConst
; LN:9431 GOSUB OutCodeData
call OutCodeData
; LN:9432 ENDIF
_Lbl1622:
; LN:9433 RETURN
ret
ReadSource:
; LN:9436 SrcLine=""
mov [SrcLine+12],0
; LN:9437 SrcNdx=0
mov dword [SrcNdx],0
; LN:9438 EndNdx=0
mov dword [EndNdx],0
; LN:9439 EndFound=0
mov byte [EndFound],0
; LN:9440 QuoteFlg=0
mov byte [QuoteFlg],0
; LN:9441 WhiteSpaceCtr=0
mov dword [WhiteSpaceCtr],0
; LN:9442 FirstValidChar=FALSE
mov byte [FirstValidChar],0
; LN:9443 LOOP
_Lbl1623:
; LN:9444 STATUS=GET #InpFile(InpFilPtr),RawData
mov esi,InpFile-(1*4)
mov eax, dword [InpFilPtr]
shl eax,2
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
mov eax, dword [edi]
mov [_IOPthNum],eax
mov esi,[RawData]
mov [_XferAddr],esi
mov [XferCount],1
invoke ReadFile,[_IOPthNum],[_XferAddr],[XferCount],XferCount,0
mov [STATUS],eax
; LN:9445 TempInt=XferCount
mov eax, dword [XferCount]
mov [TempInt],eax
; LN:9446 IF TempInt=0 THEN
cmp [TempInt],0
jne _Lbl1625
; LN:9447 IF EndFound=0 THEN
cmp [EndFound],0
jne _Lbl1626
; LN:9448 EndNdx=EndNdx-WhiteSpaceCtr
mov eax, dword [EndNdx]
mov edx, dword [WhiteSpaceCtr]
sub eax,edx
mov dword [EndNdx],eax
; LN:9449 ENDIF
_Lbl1626:
; LN:9450 RETURN
ret
; LN:9451 ENDIF
_Lbl1625:
; LN:9452 AsciiByte=ASC(RawData) 
mov esi,[RawData]
mov al, byte [esi]
mov [_Tmp1],eax
mov eax, dword [_Tmp1]
mov byte [AsciiByte],al
; LN:9453 IF AsciiByte=NewLine THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
xor edx,edx
mov dl, byte [NewLine]
cmp eax,edx
sete bl
or bh,bl
je _Lbl1627
; LN:9454 IF EndFound=0 THEN
cmp [EndFound],0
jne _Lbl1628
; LN:9455 EndNdx=EndNdx-WhiteSpaceCtr
mov eax, dword [EndNdx]
mov edx, dword [WhiteSpaceCtr]
sub eax,edx
mov dword [EndNdx],eax
; LN:9456 ENDIF
_Lbl1628:
; LN:9457 RETURN
ret
; LN:9458 ENDIF
_Lbl1627:
; LN:9459 IF QuoteFlg=0 THEN
cmp [QuoteFlg],0
jne _Lbl1629
; LN:9460 IF AsciiByte=OBQUOTE THEN
cmp [AsciiByte],34
jne _Lbl1630
; LN:9461 QuoteFlg=$ff
mov byte [QuoteFlg],255
; LN:9462 ENDIF
_Lbl1630:
; LN:9463 ELSE
jmp _Lbl1631
_Lbl1629:
; LN:9464 IF AsciiByte=OBQUOTE THEN
cmp [AsciiByte],34
jne _Lbl1632
; LN:9465 QuoteFlg=0
mov byte [QuoteFlg],0
; LN:9466 ENDIF
_Lbl1632:
; LN:9467 ENDIF
_Lbl1631:
; LN:9468 IF AsciiByte=$27 THEN
cmp [AsciiByte],39
jne _Lbl1633
; LN:9469 IF QuoteFlg=0 THEN
cmp [QuoteFlg],0
jne _Lbl1634
; LN:9470 EndFound=$ff
mov byte [EndFound],255
; LN:9471 EndNdx=EndNdx-WhiteSpaceCtr
mov eax, dword [EndNdx]
mov edx, dword [WhiteSpaceCtr]
sub eax,edx
mov dword [EndNdx],eax
; LN:9472 ENDIF
_Lbl1634:
; LN:9473 ENDIF
_Lbl1633:
; LN:9474 IF AsciiByte=$09 OR AsciiByte=$20 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
mov edx,9
cmp eax,edx
sete bl
or bh,bl
xor eax,eax
mov al, byte [AsciiByte]
mov edx,32
cmp eax,edx
sete bl
or bh,bl
je _Lbl1635
; LN:9475 INC WhiteSpaceCtr
inc [WhiteSpaceCtr]
; LN:9476 ELSE
jmp _Lbl1636
_Lbl1635:
; LN:9477 IF AsciiByte<>$0d THEN
cmp [AsciiByte],13
je _Lbl1637
; LN:9478 WhiteSpaceCtr=0
mov dword [WhiteSpaceCtr],0
; LN:9479 ENDIF
_Lbl1637:
; LN:9480 ENDIF
_Lbl1636:
; LN:9481 IF FirstValidChar=FALSE THEN
xor bh,bh
mov al, byte [FirstValidChar]
mov dl,0
cmp al,dl
sete bl
or bh,bl
je _Lbl1638
; LN:9482 IF AsciiByte<>$0a AND AsciiByte<>$0d AND AsciiByte<>$09 AND AsciiByte<>$20 THEN
xor bh,bh
xor eax,eax
mov al, byte [AsciiByte]
mov edx,10
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov al, byte [AsciiByte]
mov edx,13
cmp eax,edx
setne bl
and bh,bl
xor eax,eax
mov al, byte [AsciiByte]
mov edx,9
cmp eax,edx
setne bl
and bh,bl
xor eax,eax
mov al, byte [AsciiByte]
mov edx,32
cmp eax,edx
setne bl
and bh,bl
je _Lbl1639
; LN:9483 FirstValidChar=TRUE
mov byte [FirstValidChar],1
; LN:9484 SrcLine=SrcLine+RawData
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov edi,[RawData]
mov [_TmpVec2],edi
mov edi,[RawData+4]
mov [_TmpVec2+4],edi
mov edi,[RawData+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,SrcLine
mov esi,_TmpVec1
call __MovStr
; LN:9485 IF EndFound=0 THEN
cmp [EndFound],0
jne _Lbl1640
; LN:9486 INC EndNdx
inc [EndNdx]
; LN:9487 ENDIF
_Lbl1640:
; LN:9488 ENDIF
_Lbl1639:
; LN:9489 ELSE
jmp _Lbl1641
_Lbl1638:
; LN:9490 IF AsciiByte<>$0d THEN' Temporary code?
cmp [AsciiByte],13
je _Lbl1642
; LN:9491 SrcLine=SrcLine+RawData
mov edi,[SrcLine]
mov [_TmpVec1],edi
mov edi,[SrcLine+4]
mov [_TmpVec1+4],edi
mov edi,[SrcLine+8]
mov [_TmpVec1+8],edi
mov edi,[RawData]
mov [_TmpVec2],edi
mov edi,[RawData+4]
mov [_TmpVec2+4],edi
mov edi,[RawData+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,SrcLine
mov esi,_TmpVec1
call __MovStr
; LN:9492 IF EndFound=0 THEN
cmp [EndFound],0
jne _Lbl1643
; LN:9493 INC EndNdx
inc [EndNdx]
; LN:9494 ENDIF
_Lbl1643:
; LN:9495 ENDIF
_Lbl1642:
; LN:9496 ENDIF
_Lbl1641:
; LN:9497 ENDLOOP
jmp _Lbl1623
_Lbl1624:
; LN:9498 RETURN
ret
GenCase:
; LN:9501 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1644
; LN:9502 OutBuf="mov edx,[_SwitchInt]"
mov edi,[OutBuf]
mov esi,_StrConst1472
call __SetStrConst
; LN:9503 GOSUB OutCodeData
call OutCodeData
; LN:9504 OutBuf="cmp eax,edx"
mov edi,[OutBuf]
mov esi,_StrConst1473
call __SetStrConst
; LN:9505 GOSUB OutCodeData
call OutCodeData
; LN:9506 OutBuf=SymType+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[SymType]
mov [_TmpVec2],edi
mov edi,[SymType+4]
mov [_TmpVec2+4],edi
mov edi,[SymType+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1474
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9507 ELSE
jmp _Lbl1645
_Lbl1644:
; LN:9508 OutBuf="mov edi,_SwitchStr"
mov edi,[OutBuf]
mov esi,_StrConst1475
call __SetStrConst
; LN:9509 GOSUB OutCodeData
call OutCodeData
; LN:9510 OutBuf="mov esi,"+TSymName
mov esi,_StrConst1476
mov [_TmpVec1],esi
mov [_TmpVec1+4],9
mov [_TmpVec1+8],0
mov edi,[TSymName]
mov [_TmpVec2],edi
mov edi,[TSymName+4]
mov [_TmpVec2+4],edi
mov edi,[TSymName+8]
mov [_TmpVec2+8],edi
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9511 GOSUB OutCodeData
call OutCodeData
; LN:9512 UseCmpStr=TRUE
mov byte [UseCmpStr],1
; LN:9513 OutBuf="call __CmpStr"
mov edi,[OutBuf]
mov esi,_StrConst1477
call __SetStrConst
; LN:9514 GOSUB OutCodeData	
call OutCodeData
; LN:9515 OutBuf=SymType+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov edi,[SymType]
mov [_TmpVec2],edi
mov edi,[SymType+4]
mov [_TmpVec2+4],edi
mov edi,[SymType+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1478
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9516 ENDIF
_Lbl1645:
; LN:9517 GOSUB OutCodeData
call OutCodeData
; LN:9518 RETURN
ret
EndCasex:
; LN:9521 TempInt=7
mov dword [TempInt],7
; LN:9522 GOSUB ConStkChk
call ConStkChk
; LN:9523 ErrRet
; LN:9523 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1646
; LN:9523 RETURN
ret
; LN:9523 ENDIF
_Lbl1646:
; LN:9524 OutBuf="jmp "+"_Lbl"+STR$(ConStk(ConStkPtr).TermLabel)
mov esi,ConStk-(1*73)+0
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst1479
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst1480
mov [_TmpVec4],esi
mov [_TmpVec4+4],5
mov [_TmpVec4+8],0
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec2
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:9525 GOSUB OutCodeData
call OutCodeData
; LN:9526 OutBuf="_Lbl"+STR$(ConStk(ConStkPtr).ContLabel)+":"' get here if case not true
mov esi,ConStk-(1*73)+4
mov eax, dword [ConStkPtr]
imul eax,73
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
mov esi,_StrConst1481
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_StrConst1482
mov [_TmpVec4],esi
mov [_TmpVec4+4],2
mov [_TmpVec4+8],0
mov esi,_TmpVec2
mov [_TmpVec3+8],esi
mov esi,_TmpVec4
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec3
call __MovStr
; LN:9527 GOSUB OutCodeData
call OutCodeData
; LN:9528 RETURN
ret
MainLoopInit:
; LN:9531 GOSUB ClrDatTyp
call ClrDatTyp
; LN:9532 DMReDim=0
mov byte [DMReDim],0
; LN:9533 InitTrue=0
mov byte [InitTrue],0
; LN:9534 IgnoreRightParam=0
mov byte [IgnoreRightParam],0
; LN:9535 SimpleCmp=0
mov byte [SimpleCmp],0
; LN:9536 ComplexCmp=0
mov byte [ComplexCmp],0
; LN:9537 HasFcn=0
mov byte [HasFcn],0
; LN:9538 LetFlag=0
mov byte [LetFlag],0
; LN:9539 Target=0
mov byte [Target],0
; LN:9540 PrintFlag=0
mov byte [PrintFlag],0
; LN:9541 StatFlag=0
mov byte [StatFlag],0
; LN:9542 TabFlag=0
mov byte [TabFlag],0
; LN:9543 DevFlag=0
mov byte [DevFlag],0
; LN:9544 FileIO=0
mov byte [FileIO],0
; LN:9545 DiskIO=0
mov byte [DiskIO],0
; LN:9546 BufRWFlg=0
mov byte [BufRWFlg],0
; LN:9547 D1Cleared=0
mov byte [D1Cleared],0
; LN:9548 FileStat=0
mov byte [FileStat],0
; LN:9549 LabelFlag=$00
mov byte [LabelFlag],0
; LN:9550 Op1Class=0
mov byte [Op1Class],0
; LN:9551 ReadFlag=0
mov byte [ReadFlag],0
; LN:9552 CompFlag=0
mov byte [CompFlag],0
; LN:9553 Promote=0
mov byte [Promote],0
; LN:9554 Demote=0
mov byte [Demote],0
; LN:9555 LNFlag=$00
mov byte [LNFlag],0
; LN:9556 TmpUse=0
mov dword [TmpUse],0
; LN:9557 TmpVecUse=0
mov dword [TmpVecUse],0
; LN:9558 FTmpUse=0
mov dword [FTmpUse],0
; LN:9559 ChrTmpUse=0
mov dword [ChrTmpUse],0
; LN:9560 StrTmpUse=0
mov dword [StrTmpUse],0
; LN:9561 DimFlag=$00
mov byte [DimFlag],0
; LN:9562 TypeFlag=$00
mov byte [TypeFlag],0
; LN:9563 TDataMod=0
mov word [TDataMod],0
; LN:9564 RETURN
ret
ClrDataRegs:
; LN:9567 IF TDataType<>LONGVAR AND TDataType<>BOOLVAR THEN' Check for pointer here also?
xor bh,bh
xor eax,eax
mov ax, word [TDataType]
mov edx,4
cmp eax,edx
setne bl
or bh,bl
xor eax,eax
mov ax, word [TDataType]
mov edx,1
cmp eax,edx
setne bl
and bh,bl
je _Lbl1647
; LN:9568 IF D1Cleared=0 THEN
cmp [D1Cleared],0
jne _Lbl1648
; LN:9569 IF D0Loaded=0 THEN
cmp [D0Loaded],0
jne _Lbl1649
; LN:9570 OutBuf="xor eax,eax"
mov edi,[OutBuf]
mov esi,_StrConst1483
call __SetStrConst
; LN:9571 ELSE
jmp _Lbl1650
_Lbl1649:
; LN:9572 D1Cleared=$ff
mov byte [D1Cleared],255
; LN:9573 OutBuf="xor edx,edx"
mov edi,[OutBuf]
mov esi,_StrConst1484
call __SetStrConst
; LN:9574 ENDIF
_Lbl1650:
; LN:9575 GOSUB OutCodeData
call OutCodeData
; LN:9576 ENDIF
_Lbl1648:
; LN:9577 ENDIF
_Lbl1647:
; LN:9578 RETURN
ret
GetSymTemp:
; LN:9581 SymTemp=SymTable(SymNdx)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl1651:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl1651
; LN:9582 RETURN
ret
GetSymTempExpNdx:
; LN:9585 SymTemp=SymTable(ExpTable(ExpNdx))
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov esi,ExpTable-(1*4)
mov eax, dword [ExpNdx]
shl eax,2
add esi,eax;
mov [_TmpVec2],esi
mov esi,SymTable-(1*60)+0
mov edi,[_TmpVec2]
mov eax, dword [edi]
imul eax,60
add esi,eax;
mov [_TmpVec3],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec3]; Get src addr
mov ecx,60
_Lbl1652:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl1652
; LN:9586 RETURN
ret
ChkLabel:
; LN:9589 LNFlag=$ff
mov byte [LNFlag],255
; LN:9590 GOSUB TokenSym
call TokenSym
; LN:9591 ErrRet
; LN:9591 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1653
; LN:9591 RETURN
ret
; LN:9591 ENDIF
_Lbl1653:
; LN:9592 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl1654
; LN:9593 SymTemp.DataType=LABELVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,7
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:9594 GOSUB ClrSym
call ClrSym
; LN:9595 SymTemp.Detail=LabelUnresolved
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9596 IF KeyNdx=2 THEN' Restore
cmp [KeyNdx],2
jne _Lbl1655
; LN:9597 SymTemp.DataMod=DataBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,128
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:9598 ENDIF
_Lbl1655:
; LN:9599 GOSUB SymInsert
call SymInsert
; LN:9600 ErrRet
; LN:9600 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1656
; LN:9600 RETURN
ret
; LN:9600 ENDIF
_Lbl1656:
; LN:9601 ENDIF
_Lbl1654:
; LN:9602 RETURN
ret
MakeStrConst:
; LN:9605 INC PoolCtr
inc [PoolCtr]
; LN:9606 OutBuf="_StrConst"+STR$(PoolCtr)+" db "+TokenSaf+",0"
mov eax, dword [PoolCtr]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1485
mov [_TmpVec2],esi
mov [_TmpVec2+4],10
mov [_TmpVec2+8],0
mov esi,_StrConst1486
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov edi,[TokenSaf]
mov [_TmpVec4],edi
mov edi,[TokenSaf+4]
mov [_TmpVec4+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec4+8],edi
mov esi,_StrConst1487
mov [_TmpVec5],esi
mov [_TmpVec5+4],3
mov [_TmpVec5+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov esi,_TmpVec5
mov [_TmpVec4+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9607 GOSUB OutInitData
call OutInitData
; LN:9608 RETURN
ret
MakeBuffer:
; LN:9611 Comment="Memory Buffer"
mov edi,[Comment]
mov esi,_StrConst1488
call __SetStrConst
; LN:9612 GOSUB BldComment
call BldComment
; LN:9613 GOSUB OutInitData
call OutInitData
; LN:9614 OutBuf=BufName+" dd 0"
mov edi,[BufName]
mov [_TmpVec1],edi
mov edi,[BufName+4]
mov [_TmpVec1+4],edi
mov edi,[BufName+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst1489
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9615 GOSUB OutInitData
call OutInitData
; LN:9616 OutBuf=" dd 0"
mov edi,[OutBuf]
mov esi,_StrConst1490
call __SetStrConst
; LN:9617 GOSUB OutInitData
call OutInitData
; LN:9618 RETURN
ret
ReleaseBuffer:
; LN:9621 OutBuf="cmp ["+BufName+"+4],0"
mov esi,_StrConst1491
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1492
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9622 GOSUB OutCodeData
call OutCodeData
; LN:9623 INC LabelNum
inc [LabelNum]
; LN:9624 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1493
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst1494
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9625 GOSUB OutCodeData
call OutCodeData
; LN:9626 OutBuf="invoke  VirtualFree,["+BufName+"],0,MEM_RELEASE"
mov esi,_StrConst1495
mov [_TmpVec1],esi
mov [_TmpVec1+4],22
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1496
mov [_TmpVec3],esi
mov [_TmpVec3+4],16
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9627 GOSUB OutCodeData
call OutCodeData
; LN:9628 OutBuf="mov ["+BufName+"],0"
mov esi,_StrConst1497
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1498
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9629 GOSUB OutCodeData
call OutCodeData
; LN:9630 OutBuf="mov ["+BufName+"+4],0"
mov esi,_StrConst1499
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1500
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9631 GOSUB OutCodeData
call OutCodeData
; LN:9632 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1501
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst1502
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9633 GOSUB OutCodeData
call OutCodeData
; LN:9634 RETURN
ret
GetBuffer:
; LN:9637 OutBuf="push eax"
mov edi,[OutBuf]
mov esi,_StrConst1503
call __SetStrConst
; LN:9638 GOSUB OutCodeData
call OutCodeData
; LN:9639 OutBuf="cmp ["+BufName+"+4],0"
mov esi,_StrConst1504
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1505
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9640 GOSUB OutCodeData
call OutCodeData
; LN:9641 INC LabelNum
inc [LabelNum]
; LN:9642 OutBuf="je "+"_Lbl"+STR$(LabelNum)
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1506
mov [_TmpVec2],esi
mov [_TmpVec2+4],4
mov [_TmpVec2+8],0
mov esi,_StrConst1507
mov [_TmpVec3],esi
mov [_TmpVec3+4],5
mov [_TmpVec3+8],0
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov esi,_TmpVec1
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9643 GOSUB OutCodeData
call OutCodeData
; LN:9644 OutBuf="invoke  VirtualFree,["+BufName+"],0,MEM_RELEASE"
mov esi,_StrConst1508
mov [_TmpVec1],esi
mov [_TmpVec1+4],22
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1509
mov [_TmpVec3],esi
mov [_TmpVec3+4],16
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9645 GOSUB OutCodeData
call OutCodeData
; LN:9646 OutBuf="mov ["+BufName+"],0"
mov esi,_StrConst1510
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1511
mov [_TmpVec3],esi
mov [_TmpVec3+4],4
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9647 GOSUB OutCodeData
call OutCodeData
; LN:9648 OutBuf="mov ["+BufName+"+4],0"
mov esi,_StrConst1512
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1513
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9649 GOSUB OutCodeData
call OutCodeData
; LN:9650 OutBuf="_Lbl"+STR$(LabelNum)+":"
mov eax, dword [LabelNum]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1514
mov [_TmpVec2],esi
mov [_TmpVec2+4],5
mov [_TmpVec2+8],0
mov esi,_StrConst1515
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9651 GOSUB OutCodeData
call OutCodeData
; LN:9652 OutBuf="pop eax"
mov edi,[OutBuf]
mov esi,_StrConst1516
call __SetStrConst
; LN:9653 GOSUB OutCodeData
call OutCodeData
; LN:9654 OutBuf="mov ["+BufName+"+4],eax"
mov esi,_StrConst1517
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1518
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9655 GOSUB OutCodeData
call OutCodeData
; LN:9656 OutBuf="invoke  VirtualAlloc,0,eax,MEM_COMMIT,PAGE_READWRITE"
mov edi,[OutBuf]
mov esi,_StrConst1519
call __SetStrConst
; LN:9657 GOSUB OutCodeData
call OutCodeData
; LN:9658 OutBuf="mov ["+BufName+"],eax"
mov esi,_StrConst1520
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[BufName]
mov [_TmpVec2],edi
mov edi,[BufName+4]
mov [_TmpVec2+4],edi
mov edi,[BufName+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1521
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9659 GOSUB OutCodeData
call OutCodeData
; LN:9660 RETURN
ret
PushArgs:
; LN:9663 IgnoreRightParam=$ff
mov byte [IgnoreRightParam],255
; LN:9664 SymTemp=SymTable(SymNdx)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl1657:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl1657
; LN:9665 GOSUB GetFcnTypes
call GetFcnTypes
; LN:9666 GOSUB NexToken
call NexToken
; LN:9667 IF TokenBuf<>"(" THEN
mov esi,_StrConst1522
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1658
; LN:9668 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9669 RETURN
ret
; LN:9670 ENDIF
_Lbl1658:
; LN:9671 NeedComma=0
mov byte [NeedComma],0
; LN:9672 Ctr3=0
mov dword [Ctr3],0
PushArgsLp:
; LN:9674 IF Ctr3>TFcnArgs THEN
xor bh,bh
mov eax, dword [Ctr3]
mov edx, dword [TFcnArgs]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1659
; LN:9675 ErrNo=ErrFcnArgs
mov dword [ErrNo],37
; LN:9676 RETURN
ret
; LN:9677 ENDIF
_Lbl1659:
; LN:9678 GOSUB NexToken
call NexToken
; LN:9679 IF TokenBuf=")" THEN
mov esi,_StrConst1523
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1660
; LN:9680 IF Ctr3<>TFcnArgs THEN
xor bh,bh
mov eax, dword [Ctr3]
mov edx, dword [TFcnArgs]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1661
; LN:9681 ErrNo=ErrFcnArgs
mov dword [ErrNo],37
; LN:9682 ENDIF
_Lbl1661:
; LN:9683 RETURN	
ret
; LN:9684 ENDIF
_Lbl1660:
; LN:9685 IF NeedComma<>0 THEN
cmp [NeedComma],0
je _Lbl1662
; LN:9686 IF TokenSaf<>"," THEN
mov esi,_StrConst1524
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1663
; LN:9687 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9688 GOTO MainLoop
jmp MainLoop
; LN:9689 ENDIF
_Lbl1663:
; LN:9690 NeedComma=0
mov byte [NeedComma],0
; LN:9691 GOTO PushArgsLp
jmp PushArgsLp
; LN:9692 ELSE
jmp _Lbl1664
_Lbl1662:
; LN:9693 IF TokenSaf="," THEN
mov esi,_StrConst1525
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1665
; LN:9694 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9695 GOTO MainLoop
jmp MainLoop
; LN:9696 ENDIF
_Lbl1665:
; LN:9697 ENDIF
_Lbl1664:
; LN:9698 GOSUB UnDoToken
call UnDoToken
; LN:9699 GOSUB Expr
call Expr
; LN:9700 ErrRet
; LN:9700 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1666
; LN:9700 RETURN
ret
; LN:9700 ENDIF
_Lbl1666:
; LN:9701 INC Ctr3
inc [Ctr3]
; LN:9702 GOSUB ArgPush
call ArgPush
; LN:9703 ErrRet
; LN:9703 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1667
; LN:9703 RETURN
ret
; LN:9703 ENDIF
_Lbl1667:
; LN:9704 NeedComma=$ff
mov byte [NeedComma],255
; LN:9705 GOTO PushArgsLp
jmp PushArgsLp
; LN:9706 RETURN
ret
PopArgs:
; LN:9709 SymTemp=SymTable(SymNdx)
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov esi,SymTable-(1*60)+0
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec2],esi
mov edi,[_TmpVec1]
mov esi,[_TmpVec2]; Get src addr
mov ecx,60
_Lbl1668:
mov al,byte [esi]
mov byte [edi],al
inc esi
inc edi
dec ecx
jne _Lbl1668
; LN:9710 GOSUB GetFcnTypes
call GetFcnTypes
; LN:9711 GOSUB NexToken
call NexToken
; LN:9712 IF TokenBuf<>"(" THEN
mov esi,_StrConst1526
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1669
; LN:9713 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9714 RETURN
ret
; LN:9715 ENDIF
_Lbl1669:
; LN:9716 NeedComma=0
mov byte [NeedComma],0
; LN:9717 Ctr3=0
mov dword [Ctr3],0
PopArgsLp:
; LN:9719 IF Ctr3>TFcnArgs THEN
xor bh,bh
mov eax, dword [Ctr3]
mov edx, dword [TFcnArgs]
cmp eax,edx
setg bl
or bh,bl
je _Lbl1670
; LN:9720 ErrNo=ErrFcnArgs
mov dword [ErrNo],37
; LN:9721 RETURN
ret
; LN:9722 ENDIF
_Lbl1670:
; LN:9723 GOSUB NexToken
call NexToken
; LN:9724 IF TokenBuf=")" THEN
mov esi,_StrConst1527
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1671
; LN:9725 IF Ctr3<>TFcnArgs THEN
xor bh,bh
mov eax, dword [Ctr3]
mov edx, dword [TFcnArgs]
cmp eax,edx
setne bl
or bh,bl
je _Lbl1672
; LN:9726 ErrNo=ErrFcnArgs
mov dword [ErrNo],37
; LN:9727 ENDIF
_Lbl1672:
; LN:9728 RETURN	
ret
; LN:9729 ENDIF
_Lbl1671:
; LN:9730 IF NeedComma<>0 THEN
cmp [NeedComma],0
je _Lbl1673
; LN:9731 IF TokenSaf<>"," THEN
mov esi,_StrConst1528
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1674
; LN:9732 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9733 GOTO MainLoop
jmp MainLoop
; LN:9734 ENDIF
_Lbl1674:
; LN:9735 NeedComma=0
mov byte [NeedComma],0
; LN:9736 GOTO PopArgsLp
jmp PopArgsLp
; LN:9737 ELSE
jmp _Lbl1675
_Lbl1673:
; LN:9738 IF TokenSaf="," THEN
mov esi,_StrConst1529
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TokenSaf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
je _Lbl1676
; LN:9739 ErrNo=ErrSyntax
mov dword [ErrNo],5
; LN:9740 GOTO MainLoop
jmp MainLoop
; LN:9741 ENDIF
_Lbl1676:
; LN:9742 ENDIF
_Lbl1675:
; LN:9743 INC Ctr3
inc [Ctr3]
; LN:9744 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:9745 GOSUB SymSrch
call SymSrch
; LN:9746 IF SymFound<>0 THEN
cmp [SymFound],0
je _Lbl1677
; LN:9747 ErrNo=ErrDupSym
mov dword [ErrNo],6
; LN:9748 ErrRet
; LN:9748 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1678
; LN:9748 RETURN
ret
; LN:9748 ENDIF
_Lbl1678:
; LN:9749 ENDIF
_Lbl1677:
; LN:9750 SymTemp.Detail=0
mov esi,SymTemp+32
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9751 OutBuf="; Auto diminsion of argument"
mov edi,[OutBuf]
mov esi,_StrConst1530
call __SetStrConst
; LN:9752 GOSUB OutDim
call OutDim
; LN:9753 OutBuf="align 4"
mov edi,[OutBuf]
mov esi,_StrConst1531
call __SetStrConst
; LN:9754 GOSUB OutDim
call OutDim
; LN:9755 SELECT CASE FcnTypes(Ctr3)
mov esi,FcnTypes-(1*1)
mov eax, dword [Ctr3]
add esi,eax;
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov [_SwitchInt],eax
; LN:9756 CASE BOOLVAR
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1680
; LN:9757 ' Pop bool here
; LN:9758 CASE LONGVAR
jmp _Lbl1679
_Lbl1680:
mov eax,4
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1681
; LN:9759 OutBuf=TokenSaf+" rd 1"
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst1532
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9760 GOSUB OutDim
call OutDim
; LN:9761 OutBuf="mov eax,[_FcnArg"+STR$(Ctr3)+"]"
mov eax, dword [Ctr3]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1533
mov [_TmpVec2],esi
mov [_TmpVec2+4],17
mov [_TmpVec2+8],0
mov esi,_StrConst1534
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9762 GOSUB OutCodeData
call OutCodeData
; LN:9763 OutBuf="mov ["+TokenSaf+"],eax"
mov esi,_StrConst1535
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1536
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9764 GOSUB OutCodeData
call OutCodeData
; LN:9765 SymTemp.DataType=LONGVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:9766 SymTemp.DataMod=0
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,0
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:9767 SymTemp.DataAddr=4
mov esi,SymTemp+36
mov [_TmpVec1],esi
mov eax,4
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9768 CASE FLOATVAR
jmp _Lbl1679
_Lbl1681:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1682
; LN:9769 ' Pop float here
; LN:9770 CASE STRINGVAR
jmp _Lbl1679
_Lbl1682:
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1683
; LN:9771 OutBuf=TokenSaf+" rd 3"
mov edi,[TokenSaf]
mov [_TmpVec1],edi
mov edi,[TokenSaf+4]
mov [_TmpVec1+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec1+8],edi
mov esi,_StrConst1537
mov [_TmpVec2],esi
mov [_TmpVec2+4],6
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9772 GOSUB OutDim
call OutDim
; LN:9773 OutBuf="mov esi,[_FcnArg"+STR$(Ctr3)+"]"
mov eax, dword [Ctr3]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1538
mov [_TmpVec2],esi
mov [_TmpVec2+4],17
mov [_TmpVec2+8],0
mov esi,_StrConst1539
mov [_TmpVec3],esi
mov [_TmpVec3+4],2
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9774 GOSUB OutCodeData
call OutCodeData
; LN:9775 OutBuf="mov eax,[esi]"
mov edi,[OutBuf]
mov esi,_StrConst1540
call __SetStrConst
; LN:9776 GOSUB OutCodeData
call OutCodeData
; LN:9777 OutBuf="mov ["+TokenSaf+"],eax"
mov esi,_StrConst1541
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1542
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9778 GOSUB OutCodeData
call OutCodeData
; LN:9779 OutBuf="add esi,4"
mov edi,[OutBuf]
mov esi,_StrConst1543
call __SetStrConst
; LN:9780 GOSUB OutCodeData
call OutCodeData
; LN:9781 OutBuf="mov eax,[esi]"
mov edi,[OutBuf]
mov esi,_StrConst1544
call __SetStrConst
; LN:9782 GOSUB OutCodeData
call OutCodeData
; LN:9783 OutBuf="mov ["+TokenSaf+"+4],eax"
mov esi,_StrConst1545
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1546
mov [_TmpVec3],esi
mov [_TmpVec3+4],8
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9784 GOSUB OutCodeData
call OutCodeData
; LN:9785 OutBuf="mov ["+TokenSaf+"+8],0"
mov esi,_StrConst1547
mov [_TmpVec1],esi
mov [_TmpVec1+4],6
mov [_TmpVec1+8],0
mov edi,[TokenSaf]
mov [_TmpVec2],edi
mov edi,[TokenSaf+4]
mov [_TmpVec2+4],edi
mov edi,[TokenSaf+8]
mov [_TmpVec2+8],edi
mov esi,_StrConst1548
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov esi,_TmpVec3
mov [_TmpVec2+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9786 GOSUB OutCodeData
call OutCodeData
; LN:9787 SymTemp.DataType=STRINGVAR
mov esi,SymTemp+28
mov [_TmpVec1],esi
mov eax,6
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:9788 SymTemp.DataMod=VectorBit
mov esi,SymTemp+30
mov [_TmpVec1],esi
mov eax,32
mov esi,[_TmpVec1]
mov word [esi],ax
; LN:9789 END SELECT
jmp _Lbl1679
_Lbl1683:
_Lbl1679:
; LN:9790 GOSUB SymInsert
call SymInsert
; LN:9791 NeedComma=$ff
mov byte [NeedComma],255
; LN:9792 GOTO PopArgsLp
jmp PopArgsLp
; LN:9793 RETURN
ret
GetFcnTypes:
; LN:9796 TFcnArgs=SymTemp.FcnArgs
mov esi,SymTemp+59
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov dword [TFcnArgs],eax
; LN:9797 TFcnDataType=SymTemp.FcnDataType
mov esi,SymTemp+58
mov [_TmpVec1],esi
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov byte [TFcnDataType],al
; LN:9798 FcnTypes(1)=SymTemp.DataAddr
mov esi,FcnTypes-(1*1)
mov eax,1
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+36
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9799 FcnTypes(2)=SymTemp.DataSize
mov esi,FcnTypes-(1*1)
mov eax,2
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+40
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9800 FcnTypes(3)=SymTemp.ArrayDim1
mov esi,FcnTypes-(1*1)
mov eax,3
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+44
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9801 FcnTypes(4)=SymTemp.ArrayDim2
mov esi,FcnTypes-(1*1)
mov eax,4
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+48
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9802 FcnTypes(5)=SymTemp.ArrayDim3
mov esi,FcnTypes-(1*1)
mov eax,5
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+52
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
mov eax, dword [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9803 FcnTypes(6)=SymTemp.ArrayDims
mov esi,FcnTypes-(1*1)
mov eax,6
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+56
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9804 FcnTypes(7)=SymTemp.Misc
mov esi,FcnTypes-(1*1)
mov eax,7
add esi,eax;
mov [_TmpVec1],esi
mov esi,SymTemp+57
mov [_TmpVec2],esi
mov edi,[_TmpVec2]
xor eax,eax
mov al, byte [edi]
mov esi,[_TmpVec1]
mov byte [esi],al
; LN:9805 RETURN
ret
ChkInt:
; LN:9808 GOSUB ValidInt
call ValidInt
; LN:9809 IF IntOK=0 THEN
cmp [IntOK],0
jne _Lbl1684
; LN:9810 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:9811 ENDIF
_Lbl1684:
; LN:9812 RETURN
ret
ChkSym:
; LN:9815 GOSUB TokenSym1
call TokenSym1
; LN:9816 ErrRet
; LN:9816 IF ErrNo<>0 THEN
cmp [ErrNo],0
je _Lbl1685
; LN:9816 RETURN
ret
; LN:9816 ENDIF
_Lbl1685:
; LN:9817 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl1686
; LN:9818 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:9819 RETURN
ret
; LN:9820 ENDIF
_Lbl1686:
; LN:9821 RETURN
ret
ChkHex:
; LN:9824 GOSUB ValidHex
call ValidHex
; LN:9825 IF HexOK=0 THEN
cmp [HexOK],0
jne _Lbl1687
; LN:9826 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:9827 RETURN
ret
; LN:9828 ENDIF
_Lbl1687:
; LN:9829 RETURN
ret
ChkFlt:
; LN:9832 GOSUB ValidFlt
call ValidFlt
; LN:9833 IF FloatOK=0 THEN
cmp [FloatOK],0
jne _Lbl1688
; LN:9834 ErrNo=ErrIVExp
mov dword [ErrNo],4
; LN:9835 GOTO MainLoop
jmp MainLoop
; LN:9836 ENDIF
_Lbl1688:
; LN:9837 RETURN
ret
LoadNumericValue:
; LN:9840 IF TSymName<>"~" THEN
mov esi,_StrConst1549
mov [_TmpVec1],esi
mov [_TmpVec1+4],2
mov [_TmpVec1+8],0
xor bh,bh
mov edi,TSymName
mov esi,_TmpVec1
call __CmpStr
setne bl
or bh,bl
je _Lbl1689
; LN:9841 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1690
; LN:9842 D0Loaded=0
mov byte [D0Loaded],0
; LN:9843 GOSUB LoadReg
call LoadReg
; LN:9844 ELSE
jmp _Lbl1691
_Lbl1690:
; LN:9845 'TSymName="eaxf"
; LN:9846 ENDIF
_Lbl1691:
; LN:9847 ELSE
jmp _Lbl1692
_Lbl1689:
; LN:9848 IF OpClass=INTClass THEN
cmp [OpClass],1
jne _Lbl1693
; LN:9849 TSymName="eax"
mov edi,[TSymName]
mov esi,_StrConst1550
call __SetStrConst
; LN:9850 ELSE
jmp _Lbl1694
_Lbl1693:
; LN:9851 'TSymName="eaxf"
; LN:9852 ENDIF
_Lbl1694:
; LN:9853 ENDIF
_Lbl1692:
; LN:9854 RETURN
ret
PushNumeric:
; LN:9857 GOSUB LoadNumericValue
call LoadNumericValue
; LN:9858 OutBuf="mov [_FcnArg"+STR$(Ctr3)+"],eax"
mov eax, dword [Ctr3]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1551
mov [_TmpVec2],esi
mov [_TmpVec2+4],13
mov [_TmpVec2+8],0
mov esi,_StrConst1552
mov [_TmpVec3],esi
mov [_TmpVec3+4],6
mov [_TmpVec3+8],0
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9859 GOSUB OutCodeData
call OutCodeData
; LN:9860 RETURN
ret
ProcFcnPrep:
; LN:9863 GOSUB NexToken
call NexToken
; LN:9864 SymTemp.SymName=TokenSaf
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,TokenSaf
call __MovStr
; LN:9865 GOSUB SymSrch
call SymSrch
; LN:9866 IF SymFound=0 THEN
cmp [SymFound],0
jne _Lbl1695
; LN:9867 ErrNo=ErrUDSym
mov dword [ErrNo],1
; LN:9868 GOTO MainLoop
jmp MainLoop
; LN:9869 ENDIF
_Lbl1695:
; LN:9870 SymTable(SymNdx).Detail=LabelResolved
mov esi,SymTable-(1*60)+32
mov eax, dword [SymNdx]
imul eax,60
add esi,eax;
mov [_TmpVec1],esi
mov eax,255
mov esi,[_TmpVec1]
mov dword [esi],eax
; LN:9871 GOSUB GetSymTemp
call GetSymTemp
; LN:9872 OutBuf=SymTemp.SymName+":"
mov esi,SymTemp+0
mov [_TmpVec1],esi
mov [_TmpVec1+4],28
mov [_TmpVec1+8],0
mov esi,_StrConst1553
mov [_TmpVec2],esi
mov [_TmpVec2+4],2
mov [_TmpVec2+8],0
mov esi,_TmpVec2
mov [_TmpVec1+8],esi
mov edi,OutBuf
mov esi,_TmpVec1
call __MovStr
; LN:9873 GOSUB OutFunction
call OutFunction
; LN:9874 GOSUB GetFcnTypes
call GetFcnTypes
; LN:9875 RETURN
ret
ArgPush:
; LN:9878 SELECT CASE OpClass
xor eax,eax
mov al, byte [OpClass]
mov [_SwitchInt],eax
; LN:9879 CASE BOOLClass
mov eax,6
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1697
; LN:9880 IF FcnTypes(Ctr3)<>BOOLVAR THEN
mov esi,FcnTypes-(1*1)
mov eax, dword [Ctr3]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,1
cmp eax,edx
setne bl
or bh,bl
je _Lbl1698
; LN:9881 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9882 RETURN
ret
; LN:9883 ENDIF
_Lbl1698:
; LN:9884 ' Push bool here
; LN:9885 CASE INTClass
jmp _Lbl1696
_Lbl1697:
mov eax,1
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1699
; LN:9886 IF FcnTypes(Ctr3)<>LONGVAR THEN
mov esi,FcnTypes-(1*1)
mov eax, dword [Ctr3]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,4
cmp eax,edx
setne bl
or bh,bl
je _Lbl1700
; LN:9887 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9888 RETURN
ret
; LN:9889 ENDIF
_Lbl1700:
; LN:9890 GOSUB PushNumeric
call PushNumeric
; LN:9891 CASE FLTClass
jmp _Lbl1696
_Lbl1699:
mov eax,5
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1701
; LN:9892 IF FcnTypes(Ctr3)<>FLOATVAR THEN
mov esi,FcnTypes-(1*1)
mov eax, dword [Ctr3]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,5
cmp eax,edx
setne bl
or bh,bl
je _Lbl1702
; LN:9893 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9894 RETURN
ret
; LN:9895 ENDIF
_Lbl1702:
; LN:9896 GOSUB PushNumeric
call PushNumeric
; LN:9897 CASE STRClass
jmp _Lbl1696
_Lbl1701:
mov eax,2
mov edx,[_SwitchInt]
cmp eax,edx
jne _Lbl1703
; LN:9898 IF FcnTypes(Ctr3)<>STRINGVAR THEN
mov esi,FcnTypes-(1*1)
mov eax, dword [Ctr3]
add esi,eax;
mov [_TmpVec1],esi
xor bh,bh
mov edi,[_TmpVec1]
xor eax,eax
mov al, byte [edi]
mov edx,6
cmp eax,edx
setne bl
or bh,bl
je _Lbl1704
; LN:9899 ErrNo=ErrTypMis
mov dword [ErrNo],3
; LN:9900 RETURN
ret
; LN:9901 ENDIF
_Lbl1704:
; LN:9902 OutBuf="mov [_FcnArg"+STR$(Ctr3)+"],"+TSymName
mov eax, dword [Ctr3]
cinvoke ltoa,eax,[_ConvBuf1],10
mov esi,_StrTmp1
mov [_TmpVec1],esi
mov [_TmpVec1+4],32
mov [_TmpVec1+8],0
mov edi,_TmpVec1
mov esi,_ConvBuf1
call __MovStr
mov esi,_StrConst1554
mov [_TmpVec2],esi
mov [_TmpVec2+4],13
mov [_TmpVec2+8],0
mov esi,_StrConst1555
mov [_TmpVec3],esi
mov [_TmpVec3+4],3
mov [_TmpVec3+8],0
mov edi,[TSymName]
mov [_TmpVec4],edi
mov edi,[TSymName+4]
mov [_TmpVec4+4],edi
mov edi,[TSymName+8]
mov [_TmpVec4+8],edi
mov esi,_TmpVec1
mov [_TmpVec2+8],esi
mov esi,_TmpVec3
mov [_TmpVec1+8],esi
mov esi,_TmpVec4
mov [_TmpVec3+8],esi
mov edi,OutBuf
mov esi,_TmpVec2
call __MovStr
; LN:9903 GOSUB OutCodeData
call OutCodeData
; LN:9904 END SELECT
jmp _Lbl1696
_Lbl1703:
_Lbl1696:
; LN:9905 RETURN
ret
ChkUse:
; LN:9909 RESTORE MovArgLib
mov dword [_DataPtr],MovArgLib
; LN:9910 GOSUB OutLibCode
call OutLibCode
; LN:9912 IF UseInpData=TRUE THEN
xor bh,bh
mov al, byte [UseInpData]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1705
; LN:9913 RESTORE InpDataLib
mov dword [_DataPtr],InpDataLib
; LN:9914 GOSUB OutLibCode
call OutLibCode
; LN:9915 ENDIF
_Lbl1705:
; LN:9917 IF UseData=TRUE THEN
xor bh,bh
mov al, byte [UseData]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1706
; LN:9918 RESTORE DataLib
mov dword [_DataPtr],DataLib
; LN:9919 GOSUB OutLibCode
call OutLibCode
; LN:9920 ENDIF
_Lbl1706:
; LN:9922 IF UseCmpStr=TRUE THEN
xor bh,bh
mov al, byte [UseCmpStr]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1707
; LN:9923 RESTORE CmpStrLib
mov dword [_DataPtr],CmpStrLib
; LN:9924 GOSUB OutLibCode
call OutLibCode
; LN:9925 ENDIF
_Lbl1707:
; LN:9927 IF UseMovStr=TRUE THEN
xor bh,bh
mov al, byte [UseMovStr]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1708
; LN:9928 RESTORE MovStrLib
mov dword [_DataPtr],MovStrLib
; LN:9929 GOSUB OutLibCode
call OutLibCode
; LN:9930 ENDIF
_Lbl1708:
; LN:9932 IF UseStrLen=TRUE THEN
xor bh,bh
mov al, byte [UseStrLen]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1709
; LN:9933 RESTORE StrLenLib
mov dword [_DataPtr],StrLenLib
; LN:9934 GOSUB OutLibCode
call OutLibCode
; LN:9935 ENDIF
_Lbl1709:
; LN:9937 IF UseAtoL=TRUE THEN
xor bh,bh
mov al, byte [UseAtoL]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1710
; LN:9938 RESTORE AtoLLib
mov dword [_DataPtr],AtoLLib
; LN:9939 GOSUB OutLibCode
call OutLibCode
; LN:9940 ENDIF
_Lbl1710:
; LN:9942 IF UseBtoA=TRUE THEN
xor bh,bh
mov al, byte [UseBtoA]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1711
; LN:9943 RESTORE BtoALib
mov dword [_DataPtr],BtoALib
; LN:9944 GOSUB OutLibCode
call OutLibCode
; LN:9945 ENDIF
_Lbl1711:
; LN:9947 IF UseSetStrConst=TRUE THEN
xor bh,bh
mov al, byte [UseSetStrConst]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1712
; LN:9948 RESTORE SetStrConstLib
mov dword [_DataPtr],SetStrConstLib
; LN:9949 GOSUB OutLibCode
call OutLibCode
; LN:9950 ENDIF
_Lbl1712:
; LN:9952 IF UseMidStr=TRUE THEN
xor bh,bh
mov al, byte [UseMidStr]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1713
; LN:9953 RESTORE MidStrLib
mov dword [_DataPtr],MidStrLib
; LN:9954 GOSUB OutLibCode
call OutLibCode
; LN:9955 ENDIF
_Lbl1713:
; LN:9957 IF UseRightStr=TRUE THEN
xor bh,bh
mov al, byte [UseRightStr]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1714
; LN:9958 RESTORE RightStrLib
mov dword [_DataPtr],RightStrLib
; LN:9959 GOSUB OutLibCode
call OutLibCode
; LN:9960 ENDIF
_Lbl1714:
; LN:9962 IF UseTailStr=TRUE THEN
xor bh,bh
mov al, byte [UseTailStr]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1715
; LN:9963 RESTORE TailStrLib
mov dword [_DataPtr],TailStrLib
; LN:9964 GOSUB OutLibCode
call OutLibCode
; LN:9965 ENDIF
_Lbl1715:
; LN:9967 IF UseLCase=TRUE THEN
xor bh,bh
mov al, byte [UseLCase]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1716
; LN:9968 RESTORE LCaseLib
mov dword [_DataPtr],LCaseLib
; LN:9969 GOSUB OutLibCode
call OutLibCode
; LN:9970 ENDIF
_Lbl1716:
; LN:9972 IF UseUCase=TRUE THEN
xor bh,bh
mov al, byte [UseUCase]
mov dl,1
cmp al,dl
sete bl
or bh,bl
je _Lbl1717
; LN:9973 RESTORE UCaseLib
mov dword [_DataPtr],UCaseLib
; LN:9974 GOSUB OutLibCode
call OutLibCode
; LN:9975 ENDIF
_Lbl1717:
; LN:9977 RETURN
ret
OutLibCode:
; LN:9980 LOOP
_Lbl1718:
; LN:9981 READ OutBuf
mov esi,[OutBuf]
mov eax,500
call __ReadStr
; LN:9982 EXITIF OutBuf="ENDTEXT"
mov esi,_StrConst1556
mov [_TmpVec1],esi
mov [_TmpVec1+4],8
mov [_TmpVec1+8],0
xor bh,bh
mov edi,OutBuf
mov esi,_TmpVec1
call __CmpStr
sete bl
or bh,bl
jne _Lbl1719
; LN:9983 GOSUB OutFunction
call OutFunction
; LN:9984 ENDLOOP
jmp _Lbl1718
_Lbl1719:
; LN:9985 RETURN
ret

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
