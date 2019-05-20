FILE_TYPE_UNKNOWN   equ $0000
FILE_TYPE_DISK      equ $0001
FILE_TYPE_CHAR      equ $0002
FILE_TYPE_PIPE      equ $0003
FILE_TYPE_REMOTE    equ $8000


STD_INPUT_HANDLE    equ -10
STD_OUTPUT_HANDLE   equ -11
STD_ERROR_HANDLE    equ -12

NOPARITY            equ 0
ODDPARITY           equ 1
EVENPARITY          equ 2
MARKPARITY          equ 3
SPACEPARITY         equ 4

ONESTOPBIT          equ 0
ONE5STOPBITS        equ 1
TWOSTOPBITS         equ 2

IGNORE              equ 0       ; Ignore signal
INFINITE            equ $FFFFFFFF  ; Infinite timeout

;
; Baud rates at which the communication device operates
;

CBR_110             equ 110
CBR_300             equ 300
CBR_600             equ 600
CBR_1200            equ 1200
CBR_2400            equ 2400
CBR_4800            equ 4800
CBR_9600            equ 9600
CBR_14400           equ 14400
CBR_19200           equ 19200
CBR_38400           equ 38400
CBR_56000           equ 56000
CBR_57600           equ 57600
CBR_115200          equ 15200
CBR_128000          equ 128000
CBR_256000          equ 256000

;
; Error Flags
;

CE_RXOVER           equ $0001  ; Receive Queue overflow
CE_OVERRUN          equ $0002  ; Receive Overrun Error
CE_RXPARITY         equ $0004  ; Receive Parity Error
CE_FRAME            equ $0008  ; Receive Framing error
CE_BREAK            equ $0010  ; Break Detected
CE_TXFULL           equ $0100  ; TX Queue is full
CE_PTO              equ $0200  ; LPTx Timeout
CE_IOE              equ $0400  ; LPTx I/O Error
CE_DNS              equ $0800  ; LPTx Device not selected
CE_OOP              equ $1000  ; LPTx Out-Of-Paper
CE_MODE             equ $8000  ; Requested mode unsupported

IE_BADID            equ -1    ; Invalid or unsupported id
IE_OPEN             equ -2    ; Device Already Open
IE_NOPEN            equ -3    ; Device Not Open
IE_MEMORY           equ -4    ; Unable to allocate queues
IE_DEFAULT          equ -5    ; Error in default parameters
IE_HARDWARE         equ -10   ; Hardware Not Present
IE_BYTESIZE         equ -11   ; Illegal Byte Size
IE_BAUDRATE         equ -12   ; Unsupported BaudRate

;
; Events
;

EV_RXCHAR           equ $0001  ; Any Character received
EV_RXFLAG           equ $0002  ; Received certain character
EV_TXEMPTY          equ $0004  ; Transmitt Queue Empty
EV_CTS              equ $0008  ; CTS changed state
EV_DSR              equ $0010  ; DSR changed state
EV_RLSD             equ $0020  ; RLSD changed state
EV_BREAK            equ $0040  ; BREAK received
EV_ERR              equ $0080  ; Line status error occurred
EV_RING             equ $0100  ; Ring signal detected
EV_PERR             equ $0200  ; Printer error occured
EV_RX80FULL         equ $0400  ; Receive buffer is 80 percent full
EV_EVENT1           equ $0800  ; Provider specific event 1
EV_EVENT2           equ $1000  ; Provider specific event 2

;
; Escape Functions
;

SETXOFF             equ 1       ; Simulate XOFF received
SETXON              equ 2       ; Simulate XON received
SETRTS              equ 3       ; Set RTS high
CLRRTS              equ 4       ; Set RTS low
SETDTR              equ 5       ; Set DTR high
CLRDTR              equ 6       ; Set DTR low
RESETDEV            equ 7       ; Reset device if possible
SETBREAK            equ 8       ; Set the device break line.
CLRBREAK            equ 9       ; Clear the device break line.

;
; PURGE function flags.
;
PURGE_TXABORT       equ $0001  ; Kill the pending/current writes to the comm port.
PURGE_RXABORT       equ $0002  ; Kill the pending/current reads to the comm port.
PURGE_TXCLEAR       equ $0004  ; Kill the transmit queue if there.
PURGE_RXCLEAR       equ $0008  ; Kill the typeahead buffer if there.

LPTx                equ $80    ; Set if ID is for LPT device

;
; Modem Status Flags
;
MS_CTS_ON           equ $0010)
MS_DSR_ON           equ $0020)
MS_RING_ON          equ $0040)
MS_RLSD_ON          equ $0080)

