	.file	"list.c"
gcc2_compiled.:
___gnu_compiled_c:
.data
__StrConst1:
	.ascii "No file specified\0"
__StrConst2:
	.ascii " \0"
__StrConst3:
	.ascii "Cannot open \0"
	.def	___main;	.scl	2;	.type	32;	.endef
.text
LC0:
	.ascii "Error Exit\0"
	.align 4
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl %ebp
	movl %esp,%ebp
	subl $28,%esp
	pushl %edi
	pushl %esi
	pushl %ebx
	call ___main
	movl $__ConvBuf,%edi
	movl %edi,__CBufVec
	movl $22,__CBufVec+4
	movl $0,__CBufVec+8
	movl $__ConvBuf1,%edi
	movl %edi,__CBuf1Vec
	movl $22,__CBuf1Vec+4
	movl $0,__CBuf1Vec+8
	movl $__PrintBuf,%edi
	movl %edi,__PBufVec
	movl $300,__PBufVec+4
	movl $0,__PBufVec+8
	movl $__IOBuffer,%edi
	movl %edi,__IOBufVec
	movl $300,__IOBufVec+4
	movl $0,__IOBufVec+8
	movw $15,__Digits
	movw $2,__Decimals
	movl $0,_POS
	call __errno
	movl %eax,%eax
	movl $0,(%eax)
	movl $0,_XferCount
	movl $0,_STATUS
	movb $13,__CRLF
	movb $10,__CRLF+1
	movb $10,__NewLine
	movb $63,__Prompt
	movl 8(%ebp),%eax
	movl %eax,__ArgCount
	movl $0,__ArgNum
	movl 12(%ebp),%eax
	movl %eax,__ArgList
	movl $_ProgramName,__TmpVec1
	movl $28,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	movl __ArgList,%eax
	pushl %eax
	pushl $__TmpVec1
	call __MovArg
	addl $16,%esp
/APP
	Start:
/NO_APP
L3:
	movw $0,_LineNum
	movl $_Buf,%edi
	movl %edi,__TmpVec1
	movl $300,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	movl __ArgList,%eax
	pushl %eax
	pushl $__TmpVec1
	call __MovArg
	addl $16,%esp
	movb $0,__True
	movl $_Buf,%edi
	movl %edi,__TmpVec1
	movl $300,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-12,%esp
	pushl $__TmpVec1
	call __StrLen
	addl $16,%esp
	movl %eax,%eax
	movl %eax,__Tmp1
	movl __Tmp1,%ebx
	xorl %esi,%esi
	cmpl %esi,%ebx
	jne L4
	movl $255,%ebx
	jmp L5
	.p2align 4,,7
L4:
	xorl %ebx,%ebx
L5:
	orb %bl,__True
	cmpb $0,__True
	jne L6
	jmp L7
	.p2align 4,,7
L6:
	movb $1,__PrtPthNum
	movl $__StrConst1,%edi
	movl %edi,__TmpVec1
	movl $18,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec1
	call __PrintStr
	addl $16,%esp
/APP
	cmpl $-1,_STATUS
	jg _OELbl1
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl1:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $__CRLF,__XferAddr
	movl $2,_XferCount
	addl $-4,%esp
	movl _XferCount,%eax
	pushl %eax
	movl __XferAddr,%eax
	pushl %eax
	movzbl __PrtPthNum,%eax
	pushl %eax
	call _write
	addl $16,%esp
	movl %eax,_STATUS
/APP
	cmpl $-1,_STATUS
	jg _OELbl2
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl2:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $0,_POS
	addl $-12,%esp
	pushl $0
	call _exit
	addl $16,%esp
	.p2align 4,,7
L7:
/APP
	movl $BadFile,_ErrVec
/NO_APP
	movl $_Buf,%edi
	movl %edi,__TmpVec1
	movl $300,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	pushl $__TmpVec1
	pushl $__IOBufVec
	call __MovStr
	addl $16,%esp
	addl $-8,%esp
	pushl $0
	pushl $__IOBuffer
	call _open
	addl $16,%esp
	movl %eax,_STATUS
	movb _STATUS,%al
	movb %al,_InpFile
/APP
	cmpl $-1,_STATUS
	jg _OELbl3
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl3:
	movl $_ErrExit,_ErrVec
/NO_APP
L8:
	movb $0,__True
	movzbl _InpFile,%ebx
	movzbl %bl,%ebx
	movb %bl,__IOPthNum
	addl $-4,%esp
	pushl $1
	pushl $0
	movzbl __IOPthNum,%eax
	pushl %eax
	call _lseek
	addl $16,%esp
	movl %eax,_STATUS
	cmpl $-1,_STATUS
	jne L9
	jmp L10
	.p2align 4,,7
L9:
	movl $0,__Tmp1
	addl $-4,%esp
	pushl $2
	pushl $0
	movzbl __IOPthNum,%eax
	pushl %eax
	call _lseek
	addl $16,%esp
	movl %eax,__XferAddr
	movl _STATUS,%eax
	cmpl __XferAddr,%eax
	jne L11
	movl $1,__Tmp1
L11:
	addl $-4,%esp
	pushl $0
	movl _STATUS,%eax
	pushl %eax
	movzbl __IOPthNum,%eax
	pushl %eax
	call _lseek
	addl $16,%esp
	movl %eax,_STATUS
L10:
/APP
	cmpl $-1,_STATUS
	jg _OELbl4
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl4:
/NO_APP
	cmpl $0,__Tmp1
	sete %al
	movzbl %al,%edx
	movl %edx,__Tmp2
	movl __Tmp2,%ebx
	movl $1,%esi
	cmpl %esi,%ebx
	jne L12
	movl $255,%ebx
	jmp L13
	.p2align 4,,7
L12:
	xorl %ebx,%ebx
L13:
	orb %bl,__True
	cmpb $0,__True
	jne L14
	jmp L15
	.p2align 4,,7
L14:
	movzbl _InpFile,%ebx
	movzbl %bl,%ebx
	movb %bl,__IOPthNum
	movl $_Buf,%edi
	movl %edi,__TmpVec1
	movl $300,__TmpVec1+4
	movl $0,__TmpVec1+8
	movl __TmpVec1,%edi
	movl %edi,__DataPtr
	movl $300,__BlkCnt
L16:
	addl $-4,%esp
	pushl $1
	pushl $__IOBuffer
	movzbl __IOPthNum,%eax
	pushl %eax
	call _read
	addl $16,%esp
	movl %eax,_STATUS
	cmpl $-1,_STATUS
	jne L17
	jmp L18
	.p2align 4,,7
L17:
	cmpl $0,_STATUS
	jne L19
	jmp L20
	.p2align 4,,7
L19:
	movb __IOBuffer,%al
	cmpb __NewLine,%al
	jne L21
	jmp L20
	.p2align 4,,7
L21:
	movl __DataPtr,%eax
	movb __IOBuffer,%dl
	movb %dl,(%eax)
	incl __DataPtr
	decl __BlkCnt
	cmpl $0,__BlkCnt
	jne L22
	jmp L18
	.p2align 4,,7
L22:
	jmp L16
	.p2align 4,,7
L20:
	movl __DataPtr,%eax
	movb $0,(%eax)
L18:
/APP
	cmpl $-1,_STATUS
	jg _OELbl5
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl5:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	incw _LineNum
	movb $1,__PrtPthNum
	movzwl _LineNum,%ebx
	addl $-12,%esp
	pushl %ebx
	call __ZLtoA
	addl $16,%esp
	movl $__StrTmp1,%edi
	movl %edi,__TmpVec1
	movl $22,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	pushl $__CBuf1Vec
	pushl $__TmpVec1
	call __MovStr
	addl $16,%esp
	movl $__TmpVec1,%edi
	movl $5,%ebx
	addl $-4,%esp
	pushl $0
	pushl %ebx
	pushl %edi
	call __RightStr
	addl $16,%esp
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec1
	call __PrintStr
	addl $16,%esp
/APP
	cmpl $-1,_STATUS
	jg _OELbl6
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl6:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $__StrConst2,%edi
	movl %edi,__TmpVec2
	movl $2,__TmpVec2+4
	movl $0,__TmpVec2+8
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec2
	call __PrintStr
	addl $16,%esp
/APP
	cmpl $-1,_STATUS
	jg _OELbl7
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl7:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $_Buf,%edi
	movl %edi,__TmpVec3
	movl $300,__TmpVec3+4
	movl $0,__TmpVec3+8
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec3
	call __PrintStr
	addl $16,%esp
/APP
	cmpl $-1,_STATUS
	jg _OELbl8
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl8:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $__CRLF,__XferAddr
	movl $2,_XferCount
	addl $-4,%esp
	movl _XferCount,%eax
	pushl %eax
	movl __XferAddr,%eax
	pushl %eax
	movzbl __PrtPthNum,%eax
	pushl %eax
	call _write
	addl $16,%esp
	movl %eax,_STATUS
/APP
	cmpl $-1,_STATUS
	jg _OELbl9
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl9:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $0,_POS
	jmp L8
	.p2align 4,,7
L15:
	addl $-12,%esp
	pushl $0
	call _exit
	addl $16,%esp
/APP
	BadFile:
/NO_APP
L23:
	movb $1,__PrtPthNum
	movl $__StrConst3,%edi
	movl %edi,__TmpVec1
	movl $13,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec1
	call __PrintStr
	addl $16,%esp
/APP
	cmpl $-1,_STATUS
	jg _OELbl10
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl10:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $_Buf,%edi
	movl %edi,__TmpVec2
	movl $300,__TmpVec2+4
	movl $0,__TmpVec2+8
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec2
	call __PrintStr
	addl $16,%esp
/APP
	cmpl $-1,_STATUS
	jg _OELbl11
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl11:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $__CRLF,__XferAddr
	movl $2,_XferCount
	addl $-4,%esp
	movl _XferCount,%eax
	pushl %eax
	movl __XferAddr,%eax
	pushl %eax
	movzbl __PrtPthNum,%eax
	pushl %eax
	call _write
	addl $16,%esp
	movl %eax,_STATUS
/APP
	cmpl $-1,_STATUS
	jg _OELbl12
	movl _ErrVec,%eax
	jmp *%eax
	_OELbl12:
/NO_APP
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $0,_POS
	addl $-12,%esp
	pushl $0
	call _exit
	addl $16,%esp
/APP
	_ErrExit:
/NO_APP
	addl $-12,%esp
	pushl $LC0
	call _puts
	addl $16,%esp
	addl $-12,%esp
	call __errno
	movl %eax,%eax
	movl (%eax),%edx
	pushl %edx
	call _exit
	addl $16,%esp
L2:
	leal -40(%ebp),%esp
	popl %ebx
	popl %esi
	popl %edi
	leave
	ret
	.comm	__d2, 16	 # 4
	.comm	__PUArgs, 64	 # 60
	.comm	__ArgCount, 16	 # 4
	.comm	__ArgList, 16	 # 4
	.comm	__ArgNum, 16	 # 4
	.comm	__TestByte, 16	 # 1
	.comm	__Prompt, 16	 # 1
	.comm	__NewLine, 16	 # 1
	.comm	__CRLF, 16	 # 2
	.comm	_STATUS, 16	 # 4
	.comm	__ebuf, 64	 # 64
	.comm	__t, 16	 # 4
	.comm	__systime, 16	 # 4
	.comm	__ErrFlag, 16	 # 4
	.comm	__Poker, 16	 # 4
	.comm	__SrcAddr, 16	 # 4
	.comm	__DestAddr, 16	 # 4
	.comm	__BlkCnt, 16	 # 4
	.comm	__DummyArg, 16	 # 4
	.comm	_XferCount, 16	 # 4
	.comm	__XferAddr, 16	 # 4
	.comm	__Digits, 16	 # 2
	.comm	__Decimals, 16	 # 2
	.comm	__ArgSafe0, 16	 # 4
	.comm	__ArgSafe1, 16	 # 4
	.comm	__FltArgSafe0, 16	 # 4
	.comm	__FltArgSafe1, 16	 # 4
	.comm	__SwitchInt, 16	 # 4
	.comm	__SwitchStr, 16	 # 12
	.comm	__DblArgSafe0, 16	 # 8
	.comm	__DblArgSafe1, 16	 # 8
	.comm	__IOPthNum, 16	 # 1
	.comm	__PrtPthNum, 16	 # 1
	.comm	__SafeZone, 16	 # 2
	.comm	__IOBufPtr, 16	 # 4
	.comm	__IOBufVec, 16	 # 12
	.comm	_ErrVec, 16	 # 4
	.comm	_POS, 16	 # 4
	.comm	__PBufVec, 16	 # 12
	.comm	__DataPtr, 16	 # 4
	.comm	__DataPtrSaf, 16	 # 4
	.comm	__True, 16	 # 1
	.comm	__ConvBuf, 32	 # 22
	.comm	__ConvBuf1, 32	 # 22
	.comm	_ProgramName, 48	 # 40
	.comm	__CBufVec, 16	 # 12
	.comm	__CBuf1Vec, 16	 # 12
	.comm	__NullStr, 16	 # 2
	.comm	__IOBuffer, 304	 # 300
	.comm	__PrintBuf, 304	 # 300
.lcomm __LoopCtr,48
.lcomm __TmpVec1,16
.lcomm _InpFile,16
.lcomm _Buf,304
.lcomm _LineNum,16
.lcomm _AA,16
.lcomm __Tmp1,16
.lcomm __Tmp2,16
.lcomm __StrTmp1,32
.lcomm __TmpVec2,16
.lcomm __TmpVec3,16
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	__RightStr;	.scl	2;	.type	32;	.endef
	.def	__ZLtoA;	.scl	2;	.type	32;	.endef
	.def	_read;	.scl	2;	.type	32;	.endef
	.def	_lseek;	.scl	2;	.type	32;	.endef
	.def	_open;	.scl	2;	.type	32;	.endef
	.def	__MovStr;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_write;	.scl	2;	.type	32;	.endef
	.def	__PrintStr;	.scl	2;	.type	32;	.endef
	.def	__StrLen;	.scl	2;	.type	32;	.endef
	.def	__MovArg;	.scl	2;	.type	32;	.endef
	.def	__errno;	.scl	2;	.type	32;	.endef
