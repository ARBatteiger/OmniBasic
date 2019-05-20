format PE CONSOLE 4.0

include  'include\macro\stdcall.inc'
include  'include\macro\import.inc'
include  'include\cproc.inc'

section  '.data' data readable writeable
welcome db 'Hello friends!',13,10,13,0
upr	db 'this an example',0
m1	db 'strupr("this an example")=%s',13,10,0
m2	db 'Lenght of this string=%d',13,10,0
m3	db 'strcat("Flat ","assembler")=%s',13,10,0
string1 db 'Flat '
	   rb 9
	   db 0
string2 db 'assembler',0
section '.code' code readable executable

  entry start

  start:

  cinvoke printf,welcome
  cinvoke strupr,upr
  cinvoke printf,m1,upr
  cinvoke strlen,upr
  cinvoke printf,m2,eax
  cinvoke strcat,string1,string2
  cinvoke printf,m3,string1

  invoke ExitProcess,0
section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
	  msvcrt,'msvcrt.dll'

  kernel:
  import ExitProcess,'ExitProcess'

  msvcrt:
  import printf,'printf',\
	 strupr,'_strupr',\
	 strlen,'strlen',\
	 strcat,'strcat'