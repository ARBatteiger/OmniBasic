
;--- test CreateDIBSection
        .386
        .Model flat,stdcall
WIN32_LEAN_AND_MEAN equ 1
        include windows.inc
        include crt.inc
        include macros.inc
?SETMODE	equ 0
        .code
ReadBitmap proc uses ebx lpszName:ptr BYTE
local	dwRead:DWORD
local	pBM:ptr BITMAPINFOHEADER
local	bfh:BITMAPFILEHEADER
		invoke CreateFile, lpszName, GENERIC_READ, 0, 0, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0
		cmp eax, HFILE_ERROR
		jz error
    	mov ebx, eax
		invoke ReadFile, ebx, addr bfh, sizeof bfh, addr dwRead, 0
		and eax, eax
		jz error2
        mov eax, dwRead
        cmp eax, sizeof bfh
        jnz error2
        cmp bfh.bfType, "MB"
        jnz error2
        mov eax, bfh.bfSize
        invoke LocalAlloc, LMEM_FIXED, eax
        and eax, eax
        jz error2
        mov pBM, eax
        invoke ReadFile, ebx, pBM, bfh.bfSize, addr dwRead, 0
        and eax, eax
        jz error3
	    invoke CloseHandle, ebx
        mov eax, pBM
@exit:		ret
error3:    		invoke LocalFree, pBM
error2:    
		invoke CloseHandle, ebx
error:
		xor eax, eax
        jmp @exit
ReadBitmap endp        
main proc c
local	hdc:HDC
local	hdc2:HDC
local	pBM:DWORD
local	pBits:DWORD
local	hBitmap:HBITMAP
local	hBMOld:HBITMAP
local	dwSize:DWORD
local	bmi:BITMAPINFOHEADER
local	devmode:DEVMODE
		invoke ReadBitmap, CStr("Tasse.bmp")
        and eax, eax
        jz @exit
        mov pBM, eax
if ?SETMODE
		xor esi, esi
		.while (1)
        	mov devmode.dmSize, sizeof DEVMODE
        	mov devmode.dmDriverExtra, 0
        	invoke EnumDisplaySettings, NULL, esi, addr devmode
            .break .if (!eax)
            .break .if ((devmode.dmBitsPerPel == 16) && (devmode.dmPelsWidth == 640) && (devmode.dmPelsHeight == 480))
            inc esi
        .endw
        and eax, eax
        jz exit       
        invoke ChangeDisplaySettings, addr devmode, CDS_FULLSCREEN
endif
		invoke GetDC, NULL
        mov hdc, eax
		invoke CreateDIBSection, hdc, pBM, DIB_RGB_COLORS, addr pBits, 0, 0
        mov hBitmap, eax
        .if (pBits)
        	mov esi, pBM
            mov eax, [esi].BITMAPINFOHEADER.biWidth
            mov ecx, [esi].BITMAPINFOHEADER.biHeight
            mul ecx
            movzx ecx, [esi].BITMAPINFOHEADER.biBitCount
            mul ecx
            shr eax, 3
            mov dwSize, eax
            mov ecx, [esi].BITMAPINFOHEADER.biClrUsed
            .if (!ecx)
            	movzx edx, [esi].BITMAPINFOHEADER.biBitCount
                .if (dl == 1)
                	mov ecx, 2
                .elseif (dl == 4)
                	mov ecx, 16
                .elseif (dl == 8)
                	mov ecx, 256
                .else
                	xor ecx, ecx
                .endif
            .endif
            mov eax, [esi].BITMAPINFOHEADER.biSize
            lea eax, [eax+ecx*4]
            add esi, eax
            mov edi, pBits
            mov ecx, dwSize
            rep movsb
        .endif       
        invoke CreateCompatibleDC, hdc
        mov hdc2, eax       
        invoke SelectObject, hdc2, hBitmap
        mov hBMOld, eax
		mov bmi.biSize, sizeof BITMAPINFOHEADER
		mov bmi.biBitCount, 0
        invoke GetDIBits, hdc2, hBitmap, 0, 0, 0, addr bmi, DIB_RGB_COLORS
        .if (eax)
        .else
        	mov bmi.biWidth, 128
        	mov bmi.biHeight, 128
        .endif      
        invoke BitBlt, hdc, 0, 0, bmi.biWidth, bmi.biHeight, hdc2, 0, 0, SRCCOPY
        invoke printf, CStr(<"BitBlt()=%X",10>), eax      
        invoke SelectObject, hdc2, hBMOld
        invoke printf, CStr(<"my bitmap=%X",10>), eax
		invoke DeleteDC, hdc2
        invoke printf, CStr(<"DeleteDC()=%X",10>), eax      
        invoke ReleaseDC, NULL, hdc
        invoke printf, CStr(<"ReleaseDC()=%X",10>), eax
		invoke Sleep, 5000
if ?SETMODE        
		invoke ChangeDisplaySettings, 0, 0        
endif
@exit:        
        ret
main endp
        end

