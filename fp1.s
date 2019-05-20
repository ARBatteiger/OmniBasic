	.file	"fp1.c"
gcc2_compiled.:
___gnu_compiled_c:
	.def	___main;	.scl	2;	.type	32;	.endef
.text
LC2:
	.ascii "Error Exit\0"
	.align 8
LC0:
	.long 0x9999999a,0x3ff19999
	.align 8
LC1:
	.long 0x9999999a,0x40019999
	.align 4
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl %ebp
	movl %esp,%ebp
	subl $48,%esp
	pushl %esi
	pushl %ebx
	call ___main
	movl $__ConvBuf,-20(%ebp)
	movl -20(%ebp),%eax
	movl %eax,__CBufVec
	movl $22,__CBufVec+4
	movl $0,__CBufVec+8
	movl $__ConvBuf1,-20(%ebp)
	movl -20(%ebp),%eax
	movl %eax,__CBuf1Vec
	movl $22,__CBuf1Vec+4
	movl $0,__CBuf1Vec+8
	movl $__PrintBuf,-20(%ebp)
	movl -20(%ebp),%eax
	movl %eax,__PBufVec
	movl $300,__PBufVec+4
	movl $0,__PBufVec+8
	movl $__IOBuffer,-20(%ebp)
	movl -20(%ebp),%eax
	movl %eax,__IOBufVec
	movl $300,__IOBufVec+4
	movl $0,__IOBufVec+8
	addl $-12,%esp
	pushl $__ebuf
	call __setjmp
	addl $16,%esp
	movl %eax,__ErrFlag
	cmpl $0,__ErrFlag
	je L3
	jmp L4
	.p2align 4,,7
L3:
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
	fldl LC0
	fstpl _x
	fldl LC1
	fstpl _y
	fldl _x
	fstpl -8(%ebp)
	fldl _y
	fstpl -16(%ebp)
	fldl -8(%ebp)
	faddl -16(%ebp)
	fstpl -8(%ebp)
	fldl -8(%ebp)
	fstpl _x
	movb $1,__PrtPthNum
	fldl _x
	fstpl -8(%ebp)
	addl $-8,%esp
	fldl -8(%ebp)
	subl $8,%esp
	fstpl (%esp)
	call __DtoA
	addl $16,%esp
	movl $__StrTmp1,-20(%ebp)
	movl -20(%ebp),%eax
	movl %eax,__TmpVec1
	movl $22,__TmpVec1+4
	movl $0,__TmpVec1+8
	addl $-8,%esp
	pushl $__CBuf1Vec
	pushl $__TmpVec1
	call __MovStr
	addl $16,%esp
	addl $-8,%esp
	pushl $300
	pushl $__TmpVec1
	call __PrintStr
	addl $16,%esp
	cmpl $-1,_STATUS
	jne L5
	addl $-8,%esp
	pushl $1
	pushl $__ebuf
	call _longjmp
	addl $16,%esp
	.p2align 4,,7
L5:
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
	cmpl $-1,_STATUS
	jne L6
	addl $-8,%esp
	pushl $1
	pushl $__ebuf
	call _longjmp
	addl $16,%esp
	.p2align 4,,7
L6:
	movl _STATUS,%eax
	movl %eax,_XferCount
	movl $0,_POS
	addl $-12,%esp
	pushl $0
	call _exit
	addl $16,%esp
	.p2align 4,,7
L4:
	addl $-12,%esp
	pushl $LC2
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
	leal -56(%ebp),%esp
	popl %ebx
	popl %esi
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
	.comm	__FilePtr, 16	 # 4
	.comm	__PrtPthNum, 16	 # 1
	.comm	__SafeZone, 16	 # 2
	.comm	__IOBufPtr, 16	 # 4
	.comm	__IOBufVec, 16	 # 12
	.comm	_POS, 16	 # 4
	.comm	_MX, 16	 # 4
	.comm	_MY, 16	 # 4
	.comm	_KM, 16	 # 4
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
.lcomm _x,16
.lcomm _y,16
.lcomm __StrTmp1,32
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_write;	.scl	2;	.type	32;	.endef
	.def	_longjmp;	.scl	2;	.type	32;	.endef
	.def	__PrintStr;	.scl	2;	.type	32;	.endef
	.def	__MovStr;	.scl	2;	.type	32;	.endef
	.def	__DtoA;	.scl	2;	.type	32;	.endef
	.def	__MovArg;	.scl	2;	.type	32;	.endef
	.def	__errno;	.scl	2;	.type	32;	.endef
	.def	__setjmp;	.scl	2;	.type	32;	.endef
