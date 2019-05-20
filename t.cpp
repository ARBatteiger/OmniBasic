// Standard Include Files
#include "basic.h"
#include"fx.h"

// Compiler Declaration and Variable Section

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

// I/O Library Function Prototypes
extern "C" {

int close(unsigned char);
int lseek(unsigned char,int,int);
int read(unsigned char,char *,int);
int open(char *,int, ...);
int write(unsigned char,char *,int);
int unlink(char *);

}
// OmniBasic Library Function Prototypes
extern "C" {

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
}

#define _BufSize 300

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
long _ArgSafe2;
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

// User Declaration and Variable Section

// Temporary Vector
_vector _TmpVec1;


// LN:1 * Diminsion Variables

// LN:2 dim ButtonText1 as string * 32
char ButtonText1[32];

// LN:3 dim ButtonText2 as string * 32
char ButtonText2[32];

// LN:4 dim ButtonText3 as string * 32
char ButtonText3[32];

// LN:5 dim ButtonText4 as string * 32
char ButtonText4[32];

// LN:6 dim ButtonText5 as string * 32
char ButtonText5[32];

// LN:7 dim WinTitle as string * 32
char WinTitle[32];

// LN:8 dim TextBoxText1 as string * 32
char TextBoxText1[32];

// LN:9 dim TextBoxText2 as string * 32
char TextBoxText2[32];

// LN:10 dim Tip as string * 32
char Tip[32];

// LN:11 dim LabelName as string * 32
char LabelName[32];

// LN:12 dim combo1 as string * 32
char combo1[32];

// LN:13 dim combo2 as string * 32
char combo2[32];

// LN:14 dim combo3 as string * 32
char combo3[32];

// LN:15 dim textfield1 as textfield
FXTextField *textfield1;

// LN:16 dim textfield2 as textfield
FXTextField *textfield2;

// LN:17 dim boolean as boolean
unsigned char boolean;

// LN:19 * Diminsion Controls

// LN:20 dim list as list
FXList *list;

// LN:21 dim havis(5) as button
FXButton *havis[5];

// LN:22 dim button as button
FXButton *button;

// LN:23 dim radio(3) as radiobutton
FXRadioButton *radio[3];

// LN:24 dim check(4) as checkbutton
FXCheckButton *check[4];

// LN:25 dim slider(2) as slider
FXSlider *slider[2];

// LN:26 dim arrowbutton as arrowbutton
FXArrowButton *arrowbutton;

// LN:27 dim vframe as verticalframe
FXVerticalFrame *vframe;

// LN:28 dim hframe as horizontalframe
FXHorizontalFrame *hframe;

// LN:29 dim combobox as combobox
FXComboBox *combobox;

// LN:30 dim statusbar as statusbar
FXStatusbar *statusbar;

// LN:31 dim label as label
FXLabel *label;

// LN:32 dim dial as dial
FXDial *dial;

// LN:33 dim spinner as spinner
FXSpinner *spinner;

// LN:34 dim header as header
FXHeader *header;

// LN:36 #set OBBlue=$ff0000
#define OBBlue 16711680

// LN:37 #set OBRed=$0000ff
#define OBRed 255

// LN:38 #set OBGreen=$00ff00
#define OBGreen 65280

// LN:39 #set OBPurp=$ff00ff
#define OBPurp 16711935

// LN:40 #set OBBlack=$000000
#define OBBlack 0

// LN:41 #set OBButton_ToolBar=$2000000
#define OBButton_ToolBar 33554432

// LN:42 #set Justify_Left=$00008000
#define Justify_Left 32768

// LN:43 #set Justify_Right=$00010000
#define Justify_Right 65536

char _StrConst1[]="First =C1A";

// Temporary Vector
_vector _TmpVec2;

char _StrConst2[]="Second = Connie";
char _StrConst3[]="Third = Havis";
char _StrConst4[]="Button Number 1 (Depressed)";
char _StrConst5[]="Button Number 2 (Flattened)";
char _StrConst6[]="Button &Number 3 (Normal)";
char _StrConst7[]="Button Number 4 (Normal)";
char _StrConst8[]="Button Number 5 (Normal)";
char _StrConst9[]="Window Title Goes Here";
char _StrConst10[]="Text Box 1 Text";
char _StrConst11[]="Text Box 2 Text";
char _StrConst12[]="Tool Tip is Me";
char _StrConst13[]="Hello World";

// Code Section

main(int argc,char *argv[])
{

// Pseudo Registers
register long _d0;
register long _d1;
double _d0f;
double _d1f;
void *_a0;

// Initialize Variables
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
// Set ERROR Vector
_ErrFlag=setjmp(_ebuf);
if (_ErrFlag) goto ErrExit;
goto _NoError;
ErrExit:;
puts("Error Exit");
exit(errno);
_NoError:;
// Initialize System Variables
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
// 
// Initialize Main Window
FXApp application("t","FoxTest");
application.init(argc,argv);
FXMainWindow *main=new FXMainWindow(&application,"t",NULL,NULL,DECOR_ALL);

// LN:45 combo1="First =C1A"
_a0=combo1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst1;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=11;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:46 combo2="Second = Connie"
_a0=combo2;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst2;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=16;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:47 combo3="Third = Havis"
_a0=combo3;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst3;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=14;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:48 ButtonText1="Button Number 1 (Depressed)"
_a0=ButtonText1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst4;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=28;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:49 ButtonText2="Button Number 2 (Flattened)"
_a0=ButtonText2;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst5;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=28;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:50 ButtonText3="Button &Number 3 (Normal)"
_a0=ButtonText3;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst6;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=26;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:51 ButtonText4="Button Number 4 (Normal)"
_a0=ButtonText4;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst7;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=25;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:52 ButtonText5="Button Number 5 (Normal)"
_a0=ButtonText5;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst8;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=25;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:53 WinTitle="Window Title Goes Here"
_a0=WinTitle;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst9;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=23;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:54 TextBoxText1="Text Box 1 Text"
_a0=TextBoxText1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst10;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=16;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:55 TextBoxText2="Text Box 2 Text"
_a0=TextBoxText2;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst11;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=16;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:56 Tip="Tool Tip is Me"
_a0=Tip;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst12;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=15;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:57 LabelName="Hello World"
_a0=LabelName;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_a0=_StrConst13;
_TmpVec2._Ptr=_a0;
_TmpVec2._Len=12;
_TmpVec2._Lnk=0;
_MovStr(&_TmpVec1,&_TmpVec2);

// LN:58 boolean=true
boolean=1;

// LN:59 boolean=false
boolean=0;

// LN:61 *construct vframe

// LN:62 *construct hframe

// LN:63 construct dial
dial=new FXDial(main,NULL,0,DIAL_CYCLIC|DIAL_HAS_NOTCH|DIAL_HORIZONTAL|LAYOUT_FILL_X|FRAME_RAISED|FRAME_THICK,0,0,120,0);

// LN:64 construct combobox
combobox=new FXComboBox(main,5,5,NULL,0,COMBOBOX_INSERT_LAST|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP);

// LN:65 construct header
header=new FXHeader(main,main,FXApp::ID_QUIT,HEADER_BUTTON|FRAME_RAISED|FRAME_THICK|LAYOUT_FILL_X);

// LN:66 *construct list

// LN:67 construct spinner
spinner=new FXSpinner(main,20,NULL,0,SPIN_NORMAL|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP);

// LN:68 construct havis
havis[0]=new FXButton(main,NULL,NULL,&application,FXApp::ID_QUIT);
havis[1]=new FXButton(main,NULL,NULL,&application,FXApp::ID_QUIT);
havis[2]=new FXButton(main,NULL,NULL,&application,FXApp::ID_QUIT);
havis[3]=new FXButton(main,NULL,NULL,&application,FXApp::ID_QUIT);
havis[4]=new FXButton(main,NULL,NULL,&application,FXApp::ID_QUIT);

// LN:69 construct button
button=new FXButton(main,NULL,NULL,&application,FXApp::ID_QUIT);

// LN:70 construct textfield1
textfield1=new FXTextField(main,20,NULL,0,JUSTIFY_LEFT|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP);

// LN:71 construct textfield2
textfield2=new FXTextField(main,20,NULL,0,JUSTIFY_LEFT|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP);

// LN:72 construct label
label=new FXLabel(main,LabelName,NULL,0);

// LN:73 construct radio
radio[0]=new FXRadioButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);
radio[1]=new FXRadioButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);
radio[2]=new FXRadioButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);

// LN:74 construct check
check[0]=new FXCheckButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);
check[1]=new FXCheckButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);
check[2]=new FXCheckButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);
check[3]=new FXCheckButton(main,NULL,NULL,0,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP);

// LN:75 construct slider
slider[0]=new FXSlider(main,NULL,0,LAYOUT_TOP|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT|SLIDER_HORIZONTAL,0,0,200,30);
slider[1]=new FXSlider(main,NULL,0,LAYOUT_TOP|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT|SLIDER_HORIZONTAL,0,0,200,30);

// LN:76 *construct arrowbutton

// LN:77 construct statusbar
statusbar=new FXStatusbar(main,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|STATUSBAR_WITH_DRAGCORNER);

// LN:79 combobox.addItem=combo1
_a0=combo1;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_MovStr(&_IOBufVec,&_TmpVec1);
combobox->appenditem(_IOBuffer);

// LN:80 combobox.additem=combo2
_a0=combo2;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_MovStr(&_IOBufVec,&_TmpVec1);
combobox->appenditem(_IOBuffer);

// LN:81 combobox.AddItem=combo3
_a0=combo3;
_TmpVec1._Ptr=_a0;
_TmpVec1._Len=32;
_TmpVec1._Lnk=0;
_MovStr(&_IOBufVec,&_TmpVec1);
combobox->appenditem(_IOBuffer);

// LN:84 rem
application.create();
main->show(PLACEMENT_SCREEN);
return application.run();
exit(0);
}

// Function and Subroutine Section

