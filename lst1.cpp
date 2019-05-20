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

/*Library Function Prototypes*/

void _TrmStr(_vector *);
void _PrtUsing(long,char *,long);
void _ReadBool(long);
void _ReadByte(long);
void _ReadShort(long);
void _ReadLong(long);
void _ReadFlt(long);
void _ReadStr(long,long);
void _MovArg(_vector *,long);
void _MovStr(_vector *,_vector *);
long _CmpStr(_vector *,_vector *);
long _StrLen(_vector *);
long _SubStr(_vector *,_vector *,long);
void _MidStr(long,long,long,char);
void _LeftStr(long,long,long,char);
void _RightStr(long,long,char);
void _ClrConv(void);
double _AtoD(void);
long _AtoL(void);
void _ZLtoH(long);
void _ZLtoA(long);
void _LtoA(long);
void _DtoA(double);
void _DtoA(double);
void _PrintStr(_vector *,long);
void _PrintTab(long);
void _InpData(_vector *,char,long);
void _BtoA(long);
long _LCase(_vector *);
long _UCase(_vector *);
void _Remnant(long,long,char);

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

long _LoopCtr[10];

/*User Declaration and Variable Section*/

/*Temporary Vector*/
_vector _TmpVec1;

/* LN:1 ******************************** */
/* LN:2 * PROGRAM: lst                 * */
/* LN:3 * Lists a file and adds line   * */
/* LN:4 * numbers                      * */
/* LN:5 ******************************** */
/* LN:6  dim InpFile:byte */
unsigned char InpFile;
/* LN:7  dim Buf:string[300] */
unsigned char Buf[300];
/* LN:8  dim LineNum:short */
unsigned short LineNum;

/*Temporary Variable*/
long _Tmp1;

char _StrConst1[]="No file specified";

/*Temporary Variable*/
long _Tmp2;


/*Temporary String Variable*/
unsigned char _StrTmp1[22];

char _StrConst2[]=" ";

/*Temporary Vector*/
_vector _TmpVec2;


/*Temporary Vector*/
_vector _TmpVec3;

char _StrConst3[]="Cannot open ";

/*Code Section*/

main(int argc,char *argv[])
{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
void *_a0;

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
_d0=0;
_d1=0;
_d0f=0;
_d1f=0;
_a0=0;

_ArgCount=argc;
_ArgNum=0;
_ArgList=(long)argv;
_TmpVec1._Ptr=ProgramName;
_TmpVec1._Len=28;
_TmpVec1._Lnk=0;
_MovArg(&_TmpVec1,_ArgList);

Start:;
/* LN:10  LineNum=0 */
LineNum=0x0;
/* LN:11  Buf=NextArg */
_a0=Buf;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=300;
_TmpVec1._Lnk=0;
_MovArg(&_TmpVec1,_ArgList);
/* LN:12  if len(Buf)=0 then */
_True=0;
_a0=Buf;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=300;
_TmpVec1._Lnk=0;
_Tmp1=_StrLen(&_TmpVec1);
_d0=_Tmp1;
_d1=0x0;
if (_d0 == _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl1;
/* LN:13 	print "No file specified" */
_PrtPthNum=1;
_a0=_StrConst1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=18;
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
/* LN:14 	end */
exit(0);
/* LN:15  endif */
_Lbl1:;
/* LN:16  on error goto BadFile */
_ErrFlag=setjmp(_ebuf);
if (_ErrFlag) goto BadFile;
/* LN:17  open #InpFile,Buf:read */
errno=0;
_a0=Buf;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=300;
_TmpVec1._Lnk=0;
_MovStr(&_IOBufVec,&_TmpVec1);
STATUS=open(_IOBuffer,A_READ);
InpFile=STATUS;
if (STATUS == -1) longjmp(_ebuf,1);
/* LN:18  on error */
_ErrFlag=setjmp(_ebuf);
if (_ErrFlag) goto ErrExit;
/* LN:19  while not(eof(#InpFile)) do */
_Lbl2:;
_True=0;
_d0=InpFile;
_d0=_d0&0xff;
_IOPthNum=_d0;
STATUS=lseek(_IOPthNum,0,1);
if (STATUS == -1) goto _FLbl1;
_Tmp1=0;
*((long*)&_XferAddr)=lseek(_IOPthNum,0,2);
if (STATUS == (long)_XferAddr) _Tmp1=1;
STATUS=lseek(_IOPthNum,STATUS,0);
_FLbl1:;
if (STATUS == -1) longjmp(_ebuf,1);
_Tmp2= (!_Tmp1);
_d0=_Tmp2;
_d1=1;
if (_d0 == _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl3;
/* LN:20 	read #InpFile,Buf */
errno=0;
_d0=InpFile;
_d0=_d0&0xff;
_IOPthNum=_d0;
_a0=Buf;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=300;
_TmpVec1._Lnk=0;

_DataPtr=_TmpVec1._Ptr;
_BlkCnt=300;
_Lbl4:;
STATUS=read(_IOPthNum,_IOBuffer,1);
if (STATUS == -1) goto _Lbl6;
if (STATUS == 0) goto _Lbl5;
if (_IOBuffer[0] == _NewLine) goto _Lbl5;
*_DataPtr=_IOBuffer[0];
_DataPtr++;
_BlkCnt--;
if (_BlkCnt == 0) goto _Lbl6;
goto _Lbl4;
_Lbl5:;
*_DataPtr=0;
_Lbl6:;
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
/* LN:21 	inc LineNum */
LineNum++;
/* LN:22 	print right$(zstr$(LineNum),5);" ";Buf */
_PrtPthNum=1;
_d0=LineNum;
_ZLtoA(_d0);
_a0=_StrTmp1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=22;
_TmpVec1._Lnk=0;
_MovStr(&_TmpVec1,&_CBuf1Vec);
_a0=&_TmpVec1;
_d0=0x5;
_RightStr((long)_a0,_d0,0);
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_a0=_StrConst2;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=2;
_TmpVec2._Lnk=0;
_PrintStr(&_TmpVec2,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_a0=Buf;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=300;
_TmpVec3._Lnk=0;
_PrintStr(&_TmpVec3,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:23  endwhile */
goto _Lbl2;
_Lbl3:;
/* LN:24  end */
exit(0);
BadFile:;
/* LN:26  print "Cannot open ";Buf */
_PrtPthNum=1;
_a0=_StrConst3;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=13;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_a0=Buf;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=300;
_TmpVec2._Lnk=0;
_PrintStr(&_TmpVec2,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
exit(0);
ErrExit:;
puts("Error Exit");
exit(errno);
}

/*Function and Subroutine Section*/

