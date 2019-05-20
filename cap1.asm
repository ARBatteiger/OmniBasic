
; Caption styles manipulation - Win32 example program

format PE GUI 4.0
entry start

include 'include\kernel.inc'
include 'include\user.inc'

include 'include\macro\stdcall.inc'
include 'include\macro\import.inc'

section '.data' data readable writeable

  hinstance dd 0

  msg MSG
  wc WNDCLASS

  ws dd WS_VISIBLE+WS_CAPTION

  _class db 'FCAPTION',0
  _button db 'BUTTON',0

  hClassBrush rd 1

  _title db 'Caption styles',0
  _ws_sysmenu db 'WS_SYSMENU',0
  _ws_thickframe db 'WS_THICKFRAME',0
  _ws_minimizebox db 'WS_MINIMIZEBOX',0
  _ws_maximizebox db 'WS_MAXIMIZEBOX',0

  virtual at 0
  minmaxinfo MINMAXINFO
  end virtual

  ID_SYSMENU	 = 101
  ID_THICKFRAME  = 102
  ID_MINIMIZEBOX = 103
  ID_MAXIMIZEBOX = 104

section '.code' code readable executable

  start:

	invoke	GetModuleHandle,0
	mov	[hinstance],eax
	invoke	LoadIcon,0,IDI_APPLICATION
	mov	[wc.hIcon],eax
	invoke	LoadCursor,0,IDC_ARROW
	mov	[wc.hCursor],eax
	mov	[wc.style],0
	mov	[wc.lpfnWndProc],WindowProc
	mov	[wc.cbClsExtra],0
	mov	[wc.cbWndExtra],0
	mov	eax,[hinstance]
	mov	[wc.hInstance],eax
	mov	[wc.hbrBackground],COLOR_BTNFACE+1
	mov	[wc.lpszMenuName],0
	mov	[wc.lpszClassName],_class
	invoke	RegisterClass,wc

	invoke	CreateWindowEx,0,_class,_title,[ws],100,100,256,128,NULL,NULL,[hinstance],NULL

  msg_loop:
	invoke	GetMessage,msg,NULL,0,0
	or	eax,eax
	jz	end_loop
	invoke	TranslateMessage,msg
	invoke	DispatchMessage,msg

	jmp	msg_loop

  end_loop:
	invoke	ExitProcess,[msg.wParam]

proc WindowProc, OBMain,wmsg,wparam,lparam
	enter
	push	ebx esi edi
	cmp	[wmsg],WM_CREATE
	je	wmcreate
	cmp	[wmsg],WM_DESTROY
	je	wmdestroy
	cmp	[wmsg],WM_COMMAND
	je	wmcommand
	cmp	[wmsg],WM_GETMINMAXINFO
	je	wmgetminmaxinfo
  defwndproc:
	invoke	DefWindowProc,[OBMain],[wmsg],[wparam],[lparam]
	jmp	finish
  wmcreate:
	invoke	CreateWindowEx,0,_button,_ws_sysmenu,WS_VISIBLE+WS_CHILD+BS_AUTOCHECKBOX,16,16,256,16,[OBMain],ID_SYSMENU,[hinstance],NULL
	invoke	CreateWindowEx,0,_button,_ws_thickframe,WS_VISIBLE+WS_CHILD+BS_AUTOCHECKBOX,16,32,256,16,[OBMain],ID_THICKFRAME,[hinstance],NULL
	invoke	CreateWindowEx,0,_button,_ws_minimizebox,WS_VISIBLE+WS_CHILD+BS_AUTOCHECKBOX,16,48,256,16,[OBMain],ID_MINIMIZEBOX,[hinstance],NULL
	invoke	CreateWindowEx,0,_button,_ws_maximizebox,WS_VISIBLE+WS_CHILD+BS_AUTOCHECKBOX,16,64,256,16,[OBMain],ID_MAXIMIZEBOX,[hinstance],NULL
	xor	eax,eax
	jmp	finish
  wmcommand:
	cmp	[wparam],BN_CLICKED shl 16 + ID_SYSMENU
	je	switch_sysmenu
	cmp	[wparam],BN_CLICKED shl 16 + ID_THICKFRAME
	je	switch_thickframe
	cmp	[wparam],BN_CLICKED shl 16 + ID_MINIMIZEBOX
	je	switch_minimizebox
	cmp	[wparam],BN_CLICKED shl 16 + ID_MAXIMIZEBOX
	je	switch_maximizebox
	jmp	defwndproc
      switch_sysmenu:
invoke CreateSolidBrush, 0FF0000h;;;
mov [hClassBrush], eax
invoke SetClassLong, [OBMain], GCL_HBRBACKGROUND, [hClassBrush]
invoke InvalidateRect,[OBMain],NULL,TRUE
invoke UpdateWindow,[OBMain]
	mov	ebx,WS_SYSMENU
	jmp	set_flag
      switch_thickframe:
	mov	ebx,WS_THICKFRAME
	jmp	set_flag
      switch_minimizebox:
	mov	ebx,WS_MINIMIZEBOX
	jmp	set_flag
      switch_maximizebox:
	mov	ebx,WS_MAXIMIZEBOX
      set_flag:
	invoke	SendMessage,[lparam],BM_GETCHECK,0,0
	or	eax,eax
	jz	clear_flag
	or	[ws],ebx
	jmp	update_style
      clear_flag:
	not	ebx
	and	[ws],ebx
      update_style:
	invoke	SetWindowLong,[OBMain],GWL_STYLE,[ws]
	invoke	RedrawWindow,[OBMain],0,0,RDW_FRAME+RDW_INVALIDATE+RDW_UPDATENOW
	xor	eax,eax
	jmp	finish
  wmgetminmaxinfo:
	mov	ebx,[lparam]
	mov	[ebx+minmaxinfo.ptMinTrackSize.x],192
	mov	[ebx+minmaxinfo.ptMinTrackSize.y],128
	xor	eax,eax
	jmp	finish
  wmdestroy:
	invoke	PostQuitMessage,0
	xor	eax,eax
  finish:
	pop	edi esi ebx
	return

section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
	  user,'USER32.DLL',\
	  gdi,'GDI32.DLL'

  kernel:
  import GetModuleHandle,'GetModuleHandleA',\
	 ExitProcess,'ExitProcess'

  user:
  import RegisterClass,'RegisterClassA',\
	 CreateWindowEx,'CreateWindowExA',\
	 DefWindowProc,'DefWindowProcA',\
	 SetWindowLong,'SetWindowLongA',\
	 SetClassLong,'SetClassLongA',\
	 UpdateWindow,'UpdateWindow',\
	 InvalidateRect,'InvalidateRect',\
	 RedrawWindow,'RedrawWindow',\
	 GetMessage,'GetMessageA',\
	 TranslateMessage,'TranslateMessage',\
	 DispatchMessage,'DispatchMessageA',\
	 SendMessage,'SendMessageA',\
	 LoadCursor,'LoadCursorA',\
	 LoadIcon,'LoadIconA',\
	 PostQuitMessage,'PostQuitMessage'

  gdi:
  import CreateFontIndirect,'CreateFontIndirectA',\
	 CreateSolidBrush,'CreateSolidBrush',\
         DeleteObject,'DeleteObject',\
 	 GetPixel,'GetPixel',\
 	 GetBkColor,'GetBkColor',\
	 SetBkColor,'SetBkColor',\
	 SetBkMode,'SetBkMode',\
	 SetTextColor,'SetTextColor'
