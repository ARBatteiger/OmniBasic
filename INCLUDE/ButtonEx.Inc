; Colours
BTNEXST_COLOR_BK_IN			equ 0			; Background color when mouse is INside
BTNEXST_COLOR_FG_IN			equ	4			; Text color when mouse is INside
BTNEXST_COLOR_BK_OUT		equ	8			; Background color when mouse is OUTside
BTNEXST_COLOR_FG_OUT		equ	12			; Text color when mouse is OUTside
BTNEXST_COLOR_BK_FOCUS		equ	16			; Background color when the button is focused
BTNEXST_COLOR_FG_FOCUS		equ	20			; Text color when the button is focused

; Visual styles
BTNEXST_ALIGN_HORIZ			equ 00000000h	; Icon/bitmap on the left, text on the right
BTNEXST_ALIGN_VERT			equ	00002000h	; Icon/bitmap on the top, text on the bottom
BTNEXST_ALIGN_HORIZ_RIGHT	equ	00004000h	; Icon/bitmap on the right, text on the left
BTNEXST_PRESSED_LEFTRIGHT 	equ 00000000h	; Pressed style from left to right (as usual)
BTNEXST_PRESSED_TOPBOTTOM 	equ 00000001h	; Pressed style from top to bottom
BTNEXST_XPBUTTON			equ 00008401h	; Draw xpstyle button
BTNEXST_DEFAULT				equ	00000080h	; Make button default
BTNEXST_FLAT				equ 00000209h	; Draw flat button
BTNEXST_NORMAL				equ 00000000h	; Draw normal push-button
BTNEXST_XPCHECKBOX			equ 00008101h	; Draw checkbox xpstyle
BTNEXST_FLATCHECKBOX		equ 00000309h	; Draw flat checkbox

; Theme styles
BP_PUSHBUTTON				equ 00000001h
BTNEX_THEME_NORMAL			equ 00000001h
BTNEX_THEME_HOT				equ 00000002h
BTNEX_THEME_PRESSED			equ 00000003h
BTNEX_THEME_DISABLED		equ 00000004h
BTNEX_THEME_DEFAULTED		equ 00000005h

; States
BTNEXS_FLAT					equ 00000001h
BTNEXS_ALWAYSTRACK			equ 00000002h
BTNEXS_MOUSEONBTN			equ 00000004h
BTNEXS_TRANSPARENT			equ 00000008h
BTNEXS_PRESSED				equ 00000010h
BTNEXS_FOCUSED				equ 00000020h
BTNEXS_DISABLED				equ 00000040h
BTNEXS_DEFAULT				equ 00000080h
BTNEXS_CHECKBOX				equ 00000100h
BTNEXS_BORDER				equ 00000200h
BTNEXS_FLATFOCUS			equ 00000400h
BTNEXS_DISABLEDIMAGE		equ 00000800h
BTNEXS_CHECK				equ 00001000h
BTNEXS_ALIGN				equ 00006000h
BTNEXS_USETHEME				equ 00008000h

; Messages
BTNEXM_SETBITMAP			equ WM_USER+100	;wParam =	nBitmapInID, lParam = nBitmapOutID
BTNEXM_SETICON				equ WM_USER+102	;wParam =	  nIconInID, lParam = nIconOutID
BTNEXM_SETCURSOR			equ WM_USER+103	;wParam = 	    hCursor, lParam = bRedraw
BTNEXM_SETTOOLTIPTEXT		equ WM_USER+104	;wParam =    nByteAlloc, lParam = lpText
BTNEXM_SETPRESSEDSTYLE		equ WM_USER+105	;wParam =   nPressStyle, lParam = bRedraw
BTNEXM_ALIGN_HORIZ			equ WM_USER+106	;wParam =	 		  0, lParam = 0
BTNEXM_ALIGN_VERT			equ WM_USER+107	;wParam =			  0, lParam = 0
BTNEXM_ALIGN_HORIZRIGHT		equ WM_USER+108	;wParam =			  0, lParam = 0
BTNEXM_SETBKGRCOL_IN		equ WM_USER+109	;wParam =	    crColor, lParam = 0
BTNEXM_SETTEXTCOL_IN		equ WM_USER+110	;wParam =	    crColor, lParam = 0
BTNEXM_SETBKGRCOL_OUT		equ WM_USER+111	;wParam =	    crColor, lParam = 0
BTNEXM_SETTEXTCOL_OUT		equ WM_USER+112	;wParam =	    crColor, lParam = 0
BTNEXM_SETBKGRCOL_FOCUS		equ WM_USER+113	;wParam =	    crColor, lParam = 0
BTNEXM_SETTEXTCOL_FOCUS		equ WM_USER+114	;wParam =	    crColor, lParam = 0
BTNEXM_SETDEFAULTCOLORS		equ WM_USER+115	;wParam =	          0, lParam = 0
BTNEXM_SETSOUND				equ WM_USER+116	;wParam = nSoundHoverID, lParam = nSoundClickID
BTNEXM_SETXPBUTTON			equ WM_USER+117	;wParam =			  0, lParam = 0
BTNEXM_SETDEFAULT			equ WM_USER+118	;wParam =			  0, lParam = 0
BTNEXM_SETFLAT				equ WM_USER+119	;wParam =			  0, lParam = 0
BTNEXM_SETNORMAL			equ WM_USER+120	;wParam =			  0, lParam = 0
BTNEXM_SETXPCHECKBOX		equ WM_USER+121	;wParam =			  0, lParam = 0
BTNEXM_SETFLATCHECKBOX		equ WM_USER+122	;wParam =			  0, lParam = 0
BTNEXM_SHOWDISABLEIMAGE		equ WM_USER+123 ;wParam =			  0, lParam = 0

BTNEXM_RAINIT				equ WM_USER+9999;wParam =			  0, lParam=pointer to controls DIALOG struct

