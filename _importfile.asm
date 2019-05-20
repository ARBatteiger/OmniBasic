
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
		ChildWindowFromPoint,'ChildWindowFromPoint',\
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



