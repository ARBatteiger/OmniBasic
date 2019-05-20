;Button messages:
MBM_SETIMAGE		equ WM_USER+100	;wParam=0, lParam=bitmap handle
MBM_SETDISABLEDIMAGE	equ WM_USER+101	;wParam=0, lParam=bitmap handle
MBM_SETMOUSEOVERIMAGE	equ WM_USER+102	;wParam=0, lParam=bitmap handle
MBM_SETMENU		equ WM_USER+110	;wParam=0, lParam=popup menu handle

MBM_RAINIT		equ WM_USER+9999;wParam=0, lParam=pointer to controls DIALOG struct

;Button styles:
MBS_TEXT		equ 1	;The button has text
MBS_IMAGE		equ 2	;The button has image
MBS_MENU		equ 4	;The button has menu
MBS_IMAGELEFT		equ 8	;Image left, text right

;Button states:
MBST_MOUSEOVER		equ 1	;The mouse is over the button
MBST_MNUBTNDOWN		equ 2	;The menu button is pushed
MBST_BTNDOWN		equ 4	;The main button is pushed

;Button sizes
ARROW_WIDTH		equ 7	;Width of menu button arrow
ARROW_HEIGHT		equ 5	;Height of menu button arrow
MB_WIDTH		equ 11	;Width of menu button
TXT_HEIGHT		equ 20	;Height of text if bottom aligned

