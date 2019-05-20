	.file	"shell.c"
gcc2_compiled.:
___gnu_compiled_c:
.data
__StrConst1:
	.ascii "havis\0"
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
	movl $__StrConst1,%edi
	movl %edi,__TmpVec1
	movl $6,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	pushl $__TmpVec1
	pushl $__IOBufVec
	call __MovStr
	addl $16,%esp
	addl $-12,%esp
	pushl $__IOBuffer
	call _system
	addl $16,%esp
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	__MovStr;	.scl	2;	.type	32;	.endef
	.def	__MovArg;	.scl	2;	.type	32;	.endef
	.def	__errno;	.scl	2;	.type	32;	.endef
