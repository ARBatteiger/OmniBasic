format PE CONSOLE 4.0

include  'include\macro\stdcall.inc'
include  'include\macro\import.inc'
include  'include\cproc.inc'

section  '.data' data readable writeable
pi dq 3.141592
msg db 'PI=%f',0
section '.code' code readable executable

  entry start

  start:
  mov esi,pi
  cinvoke printf,msg,dword [esi],dword [esi+4]
  invoke ExitProcess,0

section '.idata' import data readable writeable

  library kernel,'KERNEL32.DLL',\
	  msvcrt,'msvcrt.dll'

  kernel:
  import ExitProcess,'ExitProcess'

  msvcrt:
  import printf,'printf'