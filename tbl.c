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

/* LN:1 type dt */
/* LN:7 dim a(3) as dt */
static short a[21];
/* LN:8 dim q as dt */
static short q[7];
/* LN:9 dim q$ as string */
static unsigned char q_Str[255];
/* LN:10 dim qa(5) as string */
static unsigned char qa[1275];
/* LN:12 dim w(7) as long */
static long w[7];
/* LN:14 type dt1 */
/* LN:18 dim b(10) as dt1 */
static short b[30];
/* LN:20 type nt */
/* LN:26 dim v as long */
static long v;
/* LN:27 dim bool as boolean */
static unsigned char bool;
static char _StrConst1[]="12345678";
static char _StrConst2[]="two";
static char _StrConst3[]="three";
static char _StrConst4[]="four";

/*Temporary Vector*/
static _vector _TmpVec2;

static char _StrConst5[]="1";

/*Temporary Vector*/
static _vector _TmpVec3;

static char _StrConst6[]="11";
static char _StrConst7[]="2";
static char _StrConst8[]="22";
static char _StrConst9[]="3";
static char _StrConst10[]="33";

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

/* LN:29 tbl tsttbl as string*9 */
/* LN:30 "12345678" */
_a0=_StrConst1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=9;
_TmpVec1._Lnk=0;
/* LN:31 "two" */
_a0=_StrConst2;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=4;
_TmpVec1._Lnk=0;
/* LN:32 "three" */
_a0=_StrConst3;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=6;
_TmpVec1._Lnk=0;
/* LN:33 "four" */
_a0=_StrConst4;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=5;
_TmpVec1._Lnk=0;
/* LN:34 endtbl */
/* LN:36 const con=44 */
#define con 44
/* LN:38 table a */
_a0=a;
_d0=0x1;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+0;
(long)_TmpVec1._Ptr=_d0;
_d0=0x1;
*((long*)_TmpVec1._Ptr)=_d0;
_a0=a;
_d0=0x1;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
(long)_a0=4;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=3;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long)_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst5;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=2;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
_a0=a;
_d0=0x1;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+7;
(long)_TmpVec1._Ptr=_d0;
_d0=0x1;
*((short*)_TmpVec1._Ptr)=_d0;
_a0=a;
_d0=0x1;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
(long)_a0=9;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=5;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long)_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst6;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=3;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
_a0=a;
_d0=0x2;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+0;
(long)_TmpVec1._Ptr=_d0;
_d0=0x2;
*((long*)_TmpVec1._Ptr)=_d0;
_a0=a;
_d0=0x2;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
(long)_a0=4;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=3;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long)_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst7;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=2;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
_a0=a;
_d0=0x2;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+7;
(long)_TmpVec1._Ptr=_d0;
_d0=0x2;
*((short*)_TmpVec1._Ptr)=_d0;
_a0=a;
_d0=0x2;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
(long)_a0=9;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=5;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long)_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst8;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=3;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
_a0=a;
_d0=0x3;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+0;
(long)_TmpVec1._Ptr=_d0;
_d0=0x3;
*((long*)_TmpVec1._Ptr)=_d0;
_a0=a;
_d0=0x3;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
(long)_a0=4;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=3;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long)_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst9;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=2;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
_a0=a;
_d0=0x3;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+7;
(long)_TmpVec1._Ptr=_d0;
_d0=0x3;
*((short*)_TmpVec1._Ptr)=_d0;
_a0=a;
_d0=0x3;
_d0--;
_d0=_d0*14;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
(long)_a0=9;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=5;
_TmpVec2._Lnk=0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+(long)_TmpVec2._Ptr;
(long)_TmpVec1._Ptr=_d0;
_TmpVec1._Len=_TmpVec2._Len;
_TmpVec1._Lnk=_TmpVec2._Lnk;
_a0=_StrConst10;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=3;
_TmpVec3._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec3);
/* LN:44 b(3).z=0 */
_a0=b;
_d0=0x3;
_d0--;
_d0=_d0*6;
(long)_a0=(long)_a0+_d0;
_TmpVec1._Ptr=_a0;
_d0=(long)_TmpVec1._Ptr;
_d0=_d0+0;
(long)_TmpVec1._Ptr=_d0;
_d0=0x0;
*((long*)_TmpVec1._Ptr)=_d0;
/* LN:46 v=tablesize(a) */
/* LN:47 v=tablesize(b) */
/* LN:48 v=tablesize(w) */
/* LN:49 v=tablesize(tsttbl) */
/* LN:51 'bool=tsttbl(3) */
/* LN:53 q$=tsttbl(3) */
_a0=q_Str;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=255;
_TmpVec1._Lnk=0;
/* LN:55 'q$=qa(3) */
exit(0);
__asm__ __volatile__("_ErrExit:");
puts("Error Exit");
exit(errno);
}
