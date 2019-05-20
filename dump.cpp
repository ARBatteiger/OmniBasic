/*Compiler Declaration and Variable Section*/

#ifdef __cplusplus
extern "C" {
#endif
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

/*I/O Library Function Prototypes*/

int close(unsigned char);
int lseek(unsigned char,int,int);
int read(unsigned char,char *,int);
int open(char *,int);
int write(unsigned char,char *,int);

/*OmniBasic Library Function Prototypes*/

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
void _LtoH(long,long);
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
char *_XferAddr;
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

/* LN:1 * FDUMP File Dump Program  */
/* LN:3  DIM Character:BYTE */
unsigned char Character;
/* LN:4  DIM FileNum:BYTE */
unsigned char FileNum;
/* LN:5  DIM FileName:STRING[32] */
unsigned char FileName[32];
/* LN:6  DIM ByteCtr:LONG */
long ByteCtr;
/* LN:7  DIM AddrCtr:LONG */
long AddrCtr;
/* LN:8  DIM ASCII:STRING[16] */
unsigned char ASCII[16];
/* LN:9  DIM Hex:STRING[60] */
unsigned char Hex[60];
/* LN:10  DIM LineCtr:LONG */
long LineCtr;
/* LN:11  DIM HitEnter:STRING[1] */
unsigned char HitEnter[1];

/*Temporary Variable*/
long _Tmp1;

char _StrConst1[]="-?";

/*Temporary Vector*/
_vector _TmpVec2;

char _StrConst2[]="--help";
char _StrConst3[]="                ";
char _StrConst4[]=" ";

/*Temporary String Variable*/
unsigned char _StrTmp1[22];


/*Temporary Vector*/
_vector _TmpVec3;


/*Temporary Character Variable*/
char _ChrTmp1;

char _StrConst5[]=".";
char _StrConst6[]=" ";

/*Temporary Vector*/
_vector _TmpVec4;

void Display(void);
char _StrConst7[]="Hit ENTER to continue>";
void GetByte(void);
char _StrConst8[]="Cannot open ";
char _StrConst9[]="fdump FileName";
char _StrConst10[]="Performs hexadecimal and ASCII dump of file specified";

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

/* LN:13  AddrCtr=0 */
AddrCtr=0x0;
/* LN:14  LineCtr=0 */
LineCtr=0x0;
/* LN:15  ON ERROR GOTO BadFile */
_ErrFlag=setjmp(_ebuf);
if (_ErrFlag) goto BadFile;
/* LN:16  FileName=NextArg */
_a0=FileName;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_MovArg(&_TmpVec1,_ArgList);
/* LN:17  IF len(FileName)=0 THEN Help */
_True=0;
_a0=FileName;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_Tmp1=_StrLen(&_TmpVec1);
_d0=_Tmp1;
_d1=0x0;
if (_d0 == _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl1;
goto Help;
_Lbl1:;
/* LN:18  IF FileName="-?" OR FileName="--help" THEN Help */
_True=0;
_a0=FileName;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=3;
_TmpVec2._Lnk=0;
_d0=_CmpStr(&_TmpVec1,&_TmpVec2);
if (_d0 == 1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
_a0=FileName;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst2;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=7;
_TmpVec2._Lnk=0;
_d0=_CmpStr(&_TmpVec1,&_TmpVec2);
if (_d0 == 1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl2;
goto Help;
_Lbl2:;
/* LN:19  OPEN #FileNum,FileName:READ+BINARY */
errno=0;
_a0=FileName;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_MovStr(&_IOBufVec,&_TmpVec1);
STATUS=open(_IOBuffer,A_READ|A_BINARY);
FileNum=STATUS;
if (STATUS == -1) longjmp(_ebuf,1);
Lp1:;
/* LN:21  ByteCtr=0 */
ByteCtr=0x0;
/* LN:22  ASCII="                " */
_a0=ASCII;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
_a0=_StrConst3;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=17;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);
/* LN:23  Hex=ZHEX$(AddrCtr)+" " */
_a0=Hex;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=60;
_TmpVec1._Lnk=0;
_d0=AddrCtr;
_ZLtoH(_d0);
_a0=_StrTmp1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=22;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec2,&_CBuf1Vec);
_a0=_StrConst4;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=2;
_TmpVec3._Lnk=0;
_a0=&_TmpVec3;
_TmpVec2._Lnk=_a0;
_MovStr(&_TmpVec1,&_TmpVec2);
/* LN:24  AddrCtr=AddrCtr+16 */
_d0=AddrCtr;
_d1=0x10;
_d0=_d0+_d1;
AddrCtr=_d0;
Lp2:;
/* LN:26  GOSUB GetByte */
GetByte();
/* LN:27  IF STATUS<1 THEN */
_True=0;
_d0=STATUS;
_d1=0x1;
if (_d0 < _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl3;
/* LN:28  	IF ByteCtr>0 THEN */
_True=0;
_d0=ByteCtr;
_d1=0x0;
if (_d0 > _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl4;
/* LN:29  		GOSUB Display */
Display();
/* LN:30  	ENDIF */
_Lbl4:;
/* LN:31  	CLOSE #FileNum */
errno=0;
_d0=FileNum;
_d0=_d0&0xff;
_IOPthNum=_d0;
STATUS=close(_IOPthNum);
if (STATUS == -1) longjmp(_ebuf,1);
/* LN:32  	END */
exit(0);
/* LN:33  ENDIF */
_Lbl3:;
/* LN:34  INC ByteCtr */
ByteCtr++;
/* LN:35  IF Character>$1f AND Character<$7f THEN */
_True=0;
_d0=Character;
_d1=0x1f;
if (_d0 > _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
_d0=Character;
_d1=0x7f;
if (_d0 < _d1) _d0=0xff;
else _d0=0;
_True=_True&_d0;
if (_True==0) goto _Lbl5;
/* LN:36  	MID$(ASCII,ByteCtr,1)=CHR$(Character) */
_a0=ASCII;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
_a0=&_TmpVec1;
_d0=ByteCtr;
_d1=0x1;
_MidStr((long)_a0,_d0,_d1,255);
_d0=Character;
_a0=&_ChrTmp1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=1;
_TmpVec2._Lnk=0;
_ChrTmp1=_d0;
_MovStr(&_TmpVec1,&_TmpVec2);
/* LN:37  ELSE */
goto _Lbl6;
_Lbl5:;
/* LN:38  	MID$(ASCII,ByteCtr,1)="." */
_a0=ASCII;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=16;
_TmpVec1._Lnk=0;
_a0=&_TmpVec1;
_d0=ByteCtr;
_d1=0x1;
_MidStr((long)_a0,_d0,_d1,255);
_a0=_StrConst5;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=2;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);
/* LN:39  ENDIF */
_Lbl6:;
/* LN:40  Hex=Hex+RIGHT$(ZHEX$(Character),2)+" " */
_a0=Hex;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=60;
_TmpVec1._Lnk=0;
_d0=Character;
_ZLtoH(_d0);
_a0=_StrTmp1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=22;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec2,&_CBuf1Vec);
_a0=&_TmpVec2;
_d0=0x2;
_RightStr((long)_a0,_d0,0);
_a0=Hex;
_TmpVec3._Ptr=_a0;
_TmpVec3._Len=60;
_TmpVec3._Lnk=0;
_a0=_StrConst6;
_TmpVec4._Ptr=_a0;
_TmpVec4._Len=2;
_TmpVec4._Lnk=0;
_a0=&_TmpVec2;
_TmpVec3._Lnk=_a0;
_a0=&_TmpVec4;
_TmpVec2._Lnk=_a0;
_MovStr(&_TmpVec1,&_TmpVec3);
/* LN:41  IF ByteCtr=16 THEN */
_True=0;
_d0=ByteCtr;
_d1=0x10;
if (_d0 == _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl7;
/* LN:42  	GOSUB Display */
Display();
/* LN:43  	GOTO Lp1 */
goto Lp1;
/* LN:44  ENDIF */
_Lbl7:;
/* LN:45  GOTO Lp2 */
goto Lp2;
BadFile:;
/* LN:61  PRINT "Cannot open ";FileName */
_PrtPthNum=1;
_a0=_StrConst8;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=13;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_a0=FileName;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=32;
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
/* LN:62  END */
exit(0);
Help:;
/* LN:65  PRINT */
_PrtPthNum=1;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:66  PRINT "fdump FileName" */
_PrtPthNum=1;
_a0=_StrConst9;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=15;
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
/* LN:67  PRINT */
_PrtPthNum=1;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:68  PRINT "Performs hexadecimal and ASCII dump of file specified" */
_PrtPthNum=1;
_a0=_StrConst10;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=54;
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
/* LN:69  PRINT */
_PrtPthNum=1;
_XferAddr=_CRLF;
XferCount=2;
STATUS=write(_PrtPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
POS=0;
/* LN:70  END */
exit(0);
ErrExit:;
puts("Error Exit");
exit(errno);
}
#ifdef __cplusplus
}
#endif

/*Function and Subroutine Section*/


void Display(void)
{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
void *_a0;

_d0=0;
_d1=0;
_d0f=0;
_d1f=0;
_a0=0;

/* LN:48  PRINT Hex;TAB(60);ASCII */
_PrtPthNum=1;
_a0=Hex;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=60;
_TmpVec1._Lnk=0;
_PrintStr(&_TmpVec1,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_d0=0x3c;
_PrintTab(_d0);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
_a0=ASCII;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=16;
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
/* LN:49  INC LineCtr */
LineCtr++;
/* LN:50  IF LineCtr=16 THEN */
_True=0;
_d0=LineCtr;
_d1=0x10;
if (_d0 == _d1) _d0=0xff;
else _d0=0;
_True=_True|_d0;
if (_True==0) goto _Lbl8;
/* LN:51  	LineCtr=0 */
LineCtr=0x0;
/* LN:52  	INPUT "Hit ENTER to continue>",HitEnter */
_IOPthNum=0;
_a0=_StrConst7;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=23;
_TmpVec1._Lnk=0;
STATUS=write(1,(char *)_TmpVec1._Ptr,_TmpVec1._Len);
if (STATUS == -1) longjmp(_ebuf,1);
_a0=HitEnter;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=1;
_TmpVec2._Lnk=0;
_InpData(&_TmpVec2,6,_BufSize);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
/* LN:53  ENDIF */
_Lbl8:;
/* LN:54  RETURN */
return ;
}

void GetByte(void)
{

/*Pseudo Registers*/
register long _d0;
register long _d1;
double _d0f;
double _d1f;
void *_a0;

_d0=0;
_d1=0;
_d0f=0;
_d1f=0;
_a0=0;

/* LN:57  GET #FileNum,Character */
errno=0;
_d0=FileNum;
_d0=_d0&0xff;
_IOPthNum=_d0;
_a0=&Character;
_XferAddr=(char *)_a0;
XferCount=1;
STATUS=read(_IOPthNum,_XferAddr,XferCount);
if (STATUS == -1) longjmp(_ebuf,1);
XferCount=STATUS;
/* LN:58  RETURN */
return ;
}
