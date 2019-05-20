/*Compiler Declaration and Variable Section*/

typedef struct {
void *_Ptr;
long _Len;
void *_Lnk;
} _vector;

typedef struct {
void *_BufPtr;
long _BufSiz;
} _buffer;

typedef struct {
long _Limit;
long _Step;
} _loopvec;

void _TrmStr();
void _PrtUsing();
void _ReadBool();
void _ReadByte();
void _ReadShort();
void _ReadLong();
void _ReadFlt();
void _ReadStr();
void _MovArg();
void _MovStr();
long _CmpStr();
long _StrLen();
long _SubStr();
void _MidStr();
void _LeftStr();
void _RightStr();
void _ClrConv();
double _AtoD();
long _AtoL();
void _ZLtoH();
void _ZLtoA();
void _LtoA();
void _DtoA();
void _LtoH();
void _PrintStr();
void _PrintTab();
void _InpData();
void _BtoA();
void _LCase();
void _UCase();
void _Remnant();

#define _BufSize 300
#include "basic.h"

long _d2;
long _PUArgs[15];
int _ArgCount;
long _ArgList;
long _ArgNum;
char _TestByte;
char _Prompt;
char _NewLine;
char _CRLF[2];
long STATUS;
jmp_buf _ebuf;
time_t _t;
struct tm *_systime;
long _ErrFlag;
unsigned char *_Poker;
void *_SrcAddr;
void *_DestAddr;
long _BlkCnt;
long _DummyArg;
long XferCount;
void *_XferAddr;
short _Digits;
short _Decimals;
long _ArgSafe0;
long _ArgSafe1;
float _FltArgSafe0;
float _FltArgSafe1;
long _SwitchInt;
_vector _SwitchStr;
double _DblArgSafe0;
double _DblArgSafe1;
unsigned char _IOPthNum;
FILE *_FilePtr;
unsigned char _PrtPthNum;
short _SafeZone;
long _IOBufPtr;
_vector _IOBufVec;
long POS;
int MX;
int MY;
int KM;
_vector _PBufVec;
unsigned char *_DataPtr;
unsigned char *_DataPtrSaf;
unsigned char _True;
char _ConvBuf[22];
char _ConvBuf1[22];
char ProgramName[40];
_vector _CBufVec;
_vector _CBuf1Vec;
char _NullStr[2];

char _IOBuffer[_BufSize];
char _PrintBuf[_BufSize];

static long _LoopCtr[10];

/*User Declaration and Variable Section*/

/*Temporary Vector*/
static _vector _TmpVec1;

/* LN:1 * This shows the use of functions */
/* LN:3 #FCN VoidFcn() VOID */
static void VoidFcn();
/* LN:4 #FCN IntFcn() INT */
static int IntFcn();
/* LN:5 #FCN FcnPtr() VOID POINTER */
static void (*FcnPtr)();
/* LN:7 DIM X:LONG */
static long X;

/*Temporary Variable*/
static long _Tmp1;


/*Temporary String Variable*/
static unsigned char _StrTmp1[22];

static char _StrConst1[]="Void Function";

/*Code Section*/

main(argc,argv)
int argc;
char *argv[];
{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
register void *_a0;

/*Initialize Variables*/
_a0=_ConvBuf;
_CBufVec._Ptr=_a0;
_CBufVec._Len=22;
_CBufVec._Lnk=0;
_a0=_ConvBuf1;
_CBuf1Vec._Ptr=_a0;
_CBuf1Vec._Len=22;
_CBuf1Vec._Lnk=0;
_a0=_PrintBuf;
_PBufVec._Ptr=_a0;
_PBufVec._Len=300;
_PBufVec._Lnk=0;
_a0=_IOBuffer;
_IOBufVec._Ptr=_a0;
_IOBufVec._Len=300;
_IOBufVec._Lnk=0;
/*Set ERROR Vector*/
_ErrFlag=setjmp(_ebuf);
if (_ErrFlag) goto ErrExit;
/*Initialize System Variables*/
_Digits=15;
_Decimals=2;
POS=0;
errno=0;
XferCount=0;
STATUS=0;
_CRLF[0]=0x0d;
_CRLF[1]=0x0a;
_NewLine=10;
_Prompt='?';
_ArgCount=argc;
_ArgNum=0;
_ArgList=(long)argv;
_TmpVec1._Ptr=ProgramName;
_TmpVec1._Len=28;
_TmpVec1._Lnk=0;
_MovArg(&_TmpVec1,_ArgList);

/* LN:9 X=4 */
X=0x4;
/* LN:11 VoidFcn() */
VoidFcn();
/* LN:12 PRINT IntFcn(X) */
_PrtPthNum=1;
_Tmp1=IntFcn(X);
_d0=_Tmp1;
_LtoA(_d0);
_a0=_StrTmp1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=22;
_TmpVec1._Lnk=0;
_MovStr(&_TmpVec1,&_CBuf1Vec);
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:13 FcnPtr=VoidFcn */
(long)FcnPtr=(long)VoidFcn;
/* LN:14 FcnPtr() */
(*FcnPtr)();
/* LN:16 * Functions begin here */
exit(0);
ErrExit:;
puts("Error Exit");
exit(errno);
}

/*Function and Subroutine Section*/

void VoidFcn()


{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
register void *_a0;

/* LN:19 PRINT "Void Function" */
_PrtPthNum=1;
_a0=_StrConst1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=14;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:20 RETURN */
return ;
}
int IntFcn(Z)

long Z; /* LN:23 PARAM Z:LONG */

{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
register void *_a0;

/* LN:24 RETURN Z*2 */
_d0=Z;
_d1=0x2;
_d0=_d0*_d1;
return _d0;
}
