
;---------- [Place in the Application file (.asm)] ----------

MOVmd    MACRO Var1, Var2
         push     Var2
          pop     Var1
         ENDM

.data
ButtonClass    db  'button',0
FontName       db  'MS Sans Serif',0
szButText      db  'Lulu',0

TextC          dd  00000000h
FaceC          dd  000000ffh
HiLiteC        dd  000000ffh

.data?
hButCtrl       dd  ?
hFontB         dd  ?
hImage         dd  ?

BmpW           dd  ?
BmpH           dd  ?

BmpOn          dd  ?
IcoOn          dd  ?
TransOn        dd  ?
RaisedOn       dd  ?
DepressOn      dd  ?
ImageTextOn    dd  ?
ImageOnlyOn    dd  ?
SizeIToBOn     dd  ?
SizeBToIOn     dd  ?

lf             LOGFONT         <>

LOCAL    dis:DRAWITEMSTRUCT
LOCAL    hBrush:DWORD, hMemDC, TextColor, uFormat
LOCAL    szBuff0[256]:BYTE

      .if wmsg == WM_CREATE
;---------- [Create the Button Control] ----------
         INVOKE     CreateWindowEx, 0, addr ButtonClass, addr szButText,\
                    WS_CHILD or WS_VISIBLE or BS_OWNERDRAW,\
                    100, 50, 100, 40, hwnd, 702, hInst, 0
            mov     hButCtrl, eax

;---------- [Create the Button Font] ----------
         INVOKE     lstrcpy, addr lf.lfFaceName, addr FontName
            mov     lf.lfHeight, 14
            mov     lf.lfWeight, 600
         INVOKE     CreateFontIndirect, ADDR lf
            mov     hFontB, eax
 
            mov     BmpOn, 0
            mov     TransOn, 0
            mov     RaisedOn, 1
            mov     DepressOn, 0
            mov     ImageTextOn, 0
            mov     ImageOnlyOn, 0
            mov     SizeIToBOn, 0
            mov     SizeBToIOn, 0

GGII
      .elseif wMsg == WM_DRAWITEM
         .if wParam == 702
               mov     esi, lParam
               lea     eax, dis
               mov     edi, eax
               mov     ecx, sizeof dis
               rep     movsb
            .if dis.itemID != -1

               .if BmpOn || TransOn
;---------- [You may need to select a different matching color
;            depending on where you place the Button] ----------
                  INVOKE     GetSysColor, COLOR_BTNFACE
                  INVOKE     CreateSolidBrush, eax
                     mov     hBrush, eax
                  INVOKE     FillRect, dis.hdc, addr dis.rcItem, eax
                  INVOKE     DeleteObject, hBrush
               .endif

               .if BmpOn
                  .if (dis.itemState & ODS_SELECTED)
                        add     dis.rcItem.left, 1
                        add     dis.rcItem.top, 1
                  .endif
                  INVOKE     CreateCompatibleDC, dis.hdc     ; Create a compatible dc in memory
                     mov     hMemDC, eax
                  INVOKE     SelectObject, hMemDC, hImage    ; Select the opened bitmap into the dc
                  .if !SizeIToBOn
                     INVOKE     BitBlt, dis.hdc, dis.rcItem.left, dis.rcItem.top,\
                                BmpW, BmpH, hMemDC, 0, 0, SRCCOPY
                  .else
                     INVOKE     StretchBlt, dis.hdc, dis.rcItem.left, dis.rcItem.top,\
                                dis.rcItem.right, dis.rcItem.bottom, hMemDC, 0, 0, BmpW, BmpH, SRCCOPY
                  .endif
                  INVOKE     DeleteDC, hMemDC                ; Delete the memory dc
                   MOVmd     TextColor, TextC
                  .if (dis.itemState & ODS_SELECTED)
                      MOVmd     TextColor, HiLiteC
                        sub     dis.rcItem.left, 1
                        sub     dis.rcItem.top, 1
                  .endif

               .else
                   MOVmd     TextColor, TextC
                  .if (dis.itemState & ODS_SELECTED)
                      MOVmd     TextColor, HiLiteC
                  .endif
               .endif

               .if !TransOn
                  INVOKE     CreateSolidBrush, FaceC
                     mov     hBrush, eax

               .else
;---------- [You may need to select a different matching color
;            depending on where you place the Button] ----------
                  INVOKE     GetSysColor, COLOR_BTNFACE
                  INVOKE     CreateSolidBrush, eax
                     mov     hBrush, eax
               .endif

                  mov     uFormat, DT_CENTER or DT_VCENTER or DT_SINGLELINE
               .if !BmpOn
                  INVOKE     FillRect, dis.hdc, addr dis.rcItem, hBrush
               .endif
               INVOKE     SetTextColor, dis.hdc, TextColor
               .if !TransOn
                  INVOKE     SetBkColor, dis.hdc, FaceC
               .else
                  INVOKE     SetBkMode, dis.hdc, TRANSPARENT ; Set the text background to transparent
               .endif
               .if (dis.itemState & ODS_SELECTED)
                  .if DepressOn
                     INVOKE     DrawEdge, dis.hdc, addr dis.rcItem, EDGE_SUNKEN, BF_RECT
                  .endif
                     add     dis.rcItem.left, 2
                     add     dis.rcItem.top, 2
                  .else
                     .if RaisedOn
                        INVOKE     DrawEdge, dis.hdc, addr dis.rcItem, EDGE_RAISED, BF_RECT
                     .endif
               .endif
               .if !ImageOnlyOn
                  INVOKE     DrawText, dis.hdc, addr szButText, -1, addr dis.rcItem, uFormat
               .endif
               INVOKE     DeleteObject, hBrush
            .endif
               mov     dis.itemState, ODS_DEFAULT
               mov     dis.hdc, 0
         .endif

;---------- [System and user commands] ----------
      .elseif wmsg == WM_COMMAND
            mov     eax, wparam
           cwde                          ; Only low word contains command
         .if eax == 702
INVOKE     MessageBox, NULL, addr szButText, addr ButtonClass, MB_OK
         .endif
.
.
;---------- [Delete Objects] ----------
      .elseif wmsg == WM_DESTROY
         INVOKE     DeleteObject, hFontB
 
.
.
.

