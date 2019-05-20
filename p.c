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
unsigned char _PrtPthNum;
short _SafeZone;
long _IOBufPtr;
_vector _IOBufVec;
long ErrVec;
long POS;
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

/* LN:1 dim x as integer */
static unsigned short x;
/* LN:2 dim px as integer pointer */
static long px;
/* LN:3 dim a as string*16 */
static unsigned char a[16];
/* LN:4 dim pa as string pointer */
static long pa;
/* LN:5 type dt */
/* LN:9 dim c as dt */
static short c[129];
/* LN:10 dim pc as dt pointer */
static long pc;

/*Temporary Variable*/
static long _Tmp1;


/*Temporary Vector*/
static _vector _TmpVec2;


/*Temporary String Variable*/
static unsigned char _StrTmp1[22];

static char _StrConst1[]="test";
static char _StrConst2[]="1";

/*Temporary Vector*/
static _vector _TmpVec3;

static char _StrConst3[]="cpxstring";

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

/* LN:12 x=49 */
x=0x31;
/* LN:13 px=addr(x) */
_a0=&x;
_Tmp1=(long)_a0;
_d0=_Tmp1;
(long)px=_d0;
/* LN:14 [px]=[px]+1 */
( long )_TmpVec1._Ptr=px;
( long )_TmpVec2._Ptr=px;
_d0=*((short*)_TmpVec2._Ptr);
_d1=0x1;
_d0=_d0+_d1;
*((short*)_TmpVec1._Ptr)=_d0;
/* LN:15 print x */
_PrtPthNum=1;
_d0=x;
_LtoA(_d0);
_a0=_StrTmp1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=22;
_TmpVec1._Lnk=0;
_MovStr(&_TmpVec1,&_CBuf1Vec);
_PrintStr(&_TmpVec1,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl1");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl1:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl2");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl2:");
XferCount=STATUS;
POS=0;
/* LN:16 print [px] */
_PrtPthNum=1;
( long )_TmpVec1._Ptr=px;
_d0=*((short*)_TmpVec1._Ptr);
_LtoA(_d0);
_a0=_StrTmp1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=22;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec2,&_CBuf1Vec);
_PrintStr(&_TmpVec2,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl3");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl3:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl4");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl4:");
XferCount=STATUS;
POS=0;
/* LN:18 a="test" */
_a0=a;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
_a0=_StrConst1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=5;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);
/* LN:19 pa=addr(a) */
_a0=a;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
_a0=_TmpVec1._Ptr;
_Tmp1=(long)_a0;
_d0=_Tmp1;
(long)pa=_d0;
/* LN:20 a=[pa]+"1" */
_a0=a;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
( long )_TmpVec2._Ptr=pa;
_TmpVec2._Len=255;
_TmpVec2._Lnk=0;
_a0=_StrConst2;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=2;
_TmpVec3._Lnk=0;
_a0=&_TmpVec3;
_TmpVec2._Lnk=_a0;
_MovStr(&_TmpVec1,&_TmpVec2);
/* LN:21 print a */
_PrtPthNum=1;
_a0=a;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl5");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl5:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl6");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl6:");
XferCount=STATUS;
POS=0;
/* LN:22 print [pa] */
_PrtPthNum=1;
( long )_TmpVec1._Ptr=pa;
_TmpVec1._Len=255;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl7");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl7:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl8");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl8:");
XferCount=STATUS;
POS=0;
/* LN:24 pc=addr(c) */
_a0=c;
_TmpVec1._Ptr=_a0;
_a0=_TmpVec1._Ptr;
_Tmp1=(long)_a0;
_d0=_Tmp1;
(long)pc=_d0;
/* LN:25 [pc].b="cpxstring" */
( long )_TmpVec1._Ptr=pc;
(long)_a0=0;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=255;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long )_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst3;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=10;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
/* LN:26 [pc].y=89 */
( long )_TmpVec1._Ptr=pc;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0 + 256;
(long )_TmpVec1._Ptr=_d0;
_d0=0x59;
*((short*)_TmpVec1._Ptr)=_d0;
/* LN:27 [pc].y=[pc].y+1 */
( long )_TmpVec1._Ptr=pc;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0 + 256;
(long )_TmpVec1._Ptr=_d0;
( long )_TmpVec2._Ptr=pc;
_d0=(long)_TmpVec2._Ptr;
_d0=_d0 + 256;
(long )_TmpVec2._Ptr=_d0;
_d0=*((short*)_TmpVec2._Ptr);
_d1=0x1;
_d0=_d0+_d1;
*((short*)_TmpVec1._Ptr)=_d0;
/* LN:28 print c.b */
_PrtPthNum=1;
(long)_a0=0;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=255;
_TmpVec1._Lnk=0;
_a0=c;
_TmpVec2._Ptr=_a0;
_d0=(long)_TmpVec2._Ptr;
_d0=_d0+(long)_TmpVec1._Ptr;
(long )_TmpVec2._Ptr=_d0;
_TmpVec2._Len=_TmpVec1._Len;
_TmpVec2._Lnk=_TmpVec1._Lnk;
_PrintStr(&_TmpVec2,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl9");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl9:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl10");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl10:");
XferCount=STATUS;
POS=0;
/* LN:29 print [pc].b */
_PrtPthNum=1;
( long )_TmpVec1._Ptr=pc;
(long)_a0=0;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=255;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long )_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_PrintStr(&_TmpVec1,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl11");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl11:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl12");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl12:");
XferCount=STATUS;
POS=0;
/* LN:30 print c.y */
_PrtPthNum=1;
_a0=c;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0 + 256;
(long )_TmpVec1._Ptr=_d0;
_d0=*((short*)_TmpVec1._Ptr);
_LtoA(_d0);
_a0=_StrTmp1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=22;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec2,&_CBuf1Vec);
_PrintStr(&_TmpVec2,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl13");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl13:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl14");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl14:");
XferCount=STATUS;
POS=0;
/* LN:31 print [pc].y */
_PrtPthNum=1;
( long )_TmpVec1._Ptr=pc;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0 + 256;
(long )_TmpVec1._Ptr=_d0;
_d0=*((short*)_TmpVec1._Ptr);
_LtoA(_d0);
_a0=_StrTmp1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=22;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec2,&_CBuf1Vec);
_PrintStr(&_TmpVec2,_BufSize);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl15");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl15:");
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
__asm__ __volatile__("cmpl $-1,_STATUS");
__asm__ __volatile__("jg _OELbl16");
__asm__ __volatile__("movl _ErrVec,%eax");
__asm__ __volatile__("jmp *%eax");
__asm__ __volatile__("_OELbl16:");
XferCount=STATUS;
POS=0;
exit(0);
__asm__ __volatile__("_ErrExit:");
puts("Error Exit");
exit(errno);
}
