PROP_STYLEMULTI			equ 3

DP_COUNT				equ WM_USER+1 	; wParam = count 
DP_INIT					equ WM_USER+2 	; wParam = count / lParam = maxi
DP_TEXT					equ WM_USER+3 	; wParam = text 
DP_FONT					equ WM_USER+4 	; wParam = Font
DP_COLORBKG				equ WM_USER+5 	; wParam = color background
DP_HBITMAP				equ WM_USER+6 	; wParam = pBrush
;DP_MODELCOLOR			equ WM_USER+7 	; wParam = modelcolor
;DP_MODELTEXT			equ WM_USER+8 	; wParam = modeltext

STYLE				equ WS_CHILD or WS_VISIBLE
EXSTYLE				equ 200h
IDB_BMP				equ 100

STYLE_BLUE			equ 0000h
STYLE_RED			equ 0001h
STYLE_GREEN			equ 0002h
STYLE_LIGHTB			equ 0003h

STYLE_NOTEXT			equ 0000h
STYLE_TEXT			equ 0004h
STYLE_PERCENT			equ 0008h

STYLE_LEFTTOP			equ 0000h
STYLE_CENTER			equ 0010h

.const

szToolTip				db 'DrawProgress',0
szCap					db 'Draw Progressbar',0
szName					db 'IDC_DPG',0
szClassName				db 'DRAWPROGRESS',0


PropertyModelColor		db 'Blue,Red,Green,Light Blue',0
						dd -1 xor 0003h,STYLE_BLUE
						dd -1,EXSTYLE_NONE
						dd -1 xor 0003h,STYLE_RED
						dd -1,EXSTYLE_NONE
						dd -1 xor 0003h,STYLE_GREEN
						dd -1,EXSTYLE_NONE
						dd -1 xor 0003h,STYLE_LIGHTB
						dd -1,EXSTYLE_NONE		
PropertyText			db 'No Text,Show Text,Show Percent',0
						dd -1 xor 000Ch,STYLE_NOTEXT
						dd -1,EXSTYLE_NONE
						dd -1 xor 000Ch,STYLE_TEXT
						dd -1,EXSTYLE_NONE
						dd -1 xor 000Ch,STYLE_PERCENT
						dd -1,EXSTYLE_NONE				
																				
Methods					dd PROP_STYLEMULTI,offset PropertyModelColor
						dd PROP_STYLEMULTI,offset PropertyText


PROGRESSDATA struct
	pBitmap					dd ?
	colorbkg				dd ?
	count					dd ?
	maxi					dd ?
	height					dd ?
	hFont					dd ?
	modelcolor				dd ?
	modeltext				dd ?
	state					dd ?
	buffer					dd 256 dup(?)
PROGRESSDATA ends

.data
	szProperty				db 'Model Color,Model Text',0
	ccdefex					CCDEFEX <77777,offset szToolTip,0,offset szCap,offset szName,offset szClassName,STYLE,EXSTYLE,11111111000110000000000000000000b,00010000000000011000000000000000b,00000000000000000000000000000000b,00000000000000000000000000000000b,offset szProperty,offset Methods>
	Txt						db "text",0
	hInstance				dd 0
	
	

	
	
