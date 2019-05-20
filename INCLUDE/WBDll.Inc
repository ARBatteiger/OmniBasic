;Browser messages:
WBM_NAVIGATE			equ WM_USER+100	;wParam=0, lParam=pointer to null terminated string
WBM_GOBACK			equ WM_USER+101	;wParam=0, lParam=0
WBM_GOFORWARD			equ WM_USER+102	;wParam=0, lParam=0

;Browser styles:
WBS_STATUSWINDOW		equ 1
WBS_STATUSSIZEGRIP		equ 2
WBS_CAPTION			equ 4
WBS_COMBO			equ 8