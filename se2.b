DIM Edit AS SCINTILLA
DIM ExitButton AS BUTTON
DIM NewButton AS BUTTON
DIM OpenButton AS BUTTON
DIM SaveButton AS BUTTON
DIM SaveAsButton AS BUTTON
DIM PrintButton AS BUTTON
DIM GoToButton AS BUTTON
DIM GotoText AS TEXTBOX
DIM DelButton AS BUTTON
DIM CutButton AS BUTTON
DIM CopyButton AS BUTTON
DIM PasteButton AS BUTTON
DIM FindButton AS BUTTON
DIM ReplaceButton AS BUTTON
DIM CompileButton AS BUTTON
DIM CompileAsmButton AS BUTTON
DIM CompileTestButton AS BUTTON
DIM DebugButton AS BUTTON
DIM RunButton AS BUTTON
DIM AsmbButton AS BUTTON
DIM StopButton AS BUTTON
DIM GoButton AS BUTTON
DIM StepButton AS BUTTON
DIM EndButton AS BUTTON
DIM HelpButton AS BUTTON
DIM StatusBar AS STATUSBAR
DIM TempStr AS STRING
DIM FileName AS STRING
DIM SaveFileName AS STRING
DIM FileFilter AS STRING
DIM FilterArray(100) AS BYTE VECTOR
DIM InitDir AS STRING
DIM TempInt AS LONG
DIM SaveValid AS BOOLEAN

OBMain_Load:
SETPOSITION OBMain,0,0,1024,745
CONSTRUCT StatusBar
CONSTRUCT Edit
SETPOSITION Edit,0,32,1015,668
CONSTRUCT ExitButton
SETPOSITION ExitButton,0,0,40,30
ExitButton.TEXT="E&xit"
CONSTRUCT NewButton
SETPOSITION NewButton,40,0,40,30
NewButton.TEXT="&New"
CONSTRUCT OpenButton
SETPOSITION OpenButton,80,0,40,30
OpenButton.TEXT="&Open"
CONSTRUCT SaveButton
SETPOSITION SaveButton,120,0,40,30
SaveButton.TEXT="&Save"
CONSTRUCT SaveAsButton
SETPOSITION SaveAsButton,160,0,40,30
SaveAsButton.TEXT="SvAs"
CONSTRUCT PrintButton
SETPOSITION PrintButton,200,0,40,30
PrintButton.TEXT="&Print"
CONSTRUCT GoToButton
SETPOSITION GoToButton,240,0,40,30
GoToButton.TEXT="&GoTo"
CONSTRUCT GotoText
SETPOSITION GotoText,280,0,55,30
GotoText.TEXT=""
GotoText.BACKCOLOR=$c0c0c0
CONSTRUCT DelButton
SETPOSITION DelButton,335,0,40,30
DelButton.TEXT="&Del"
CONSTRUCT CutButton
SETPOSITION CutButton,375,0,40,30
CutButton.TEXT="&Cut"
CONSTRUCT CopyButton
SETPOSITION CopyButton,415,0,40,30
CopyButton.TEXT="C&opy"
CONSTRUCT PasteButton
SETPOSITION PasteButton,455,0,40,30
PasteButton.TEXT="&Paste"
CONSTRUCT FindButton
SETPOSITION FindButton,495,0,40,30
FindButton.TEXT="&Find"
CONSTRUCT ReplaceButton
SETPOSITION ReplaceButton,535,0,40,30
ReplaceButton.TEXT="&Rplc"
CONSTRUCT CompileButton
SETPOSITION CompileButton,575,0,40,30
CompileButton.TEXT="C&mpl"
CONSTRUCT CompileAsmButton
SETPOSITION CompileAsmButton,615,0,40,30
CompileAsmButton.TEXT="Cmp&A"
CONSTRUCT CompileTestButton
SETPOSITION CompileTestButton,655,0,40,30
CompileTestButton.TEXT="Cmp&T"
CONSTRUCT AsmbButton
SETPOSITION AsmbButton,695,0,40,30
AsmbButton.TEXT="&Asmb"
CONSTRUCT RunButton
SETPOSITION RunButton,735,0,40,30
RunButton.TEXT="Ru&n"
CONSTRUCT DebugButton
SETPOSITION DebugButton,775,0,40,30
DebugButton.TEXT="&Dbg"
CONSTRUCT StopButton
SETPOSITION StopButton,815,0,40,30
StopButton.TEXT="&Stop"
CONSTRUCT GoButton
SETPOSITION GoButton,855,0,40,30
GoButton.TEXT="&Go"
CONSTRUCT StepButton
SETPOSITION StepButton,895,0,40,30
StepButton.TEXT="S&tep"
CONSTRUCT EndButton
SETPOSITION EndButton,935,0,40,30
EndButton.TEXT="&End"
CONSTRUCT HelpButton
SETPOSITION HelpButton,975,0,40,30
HelpButton.TEXT="&Help"
SaveFileName=""
Edit.HSCROLL=TRUE
SaveValid=FALSE
SaveButton.ENABLED=FALSE
SaveAsButton.ENABLED=FALSE
InitDir="C:\nb"
SETVEC FilterArray=ADDR(FileFilter)
FilterArray(1)=ASC("O")
FilterArray(2)=ASC("B")
FilterArray(3)=ASC(" ")
FilterArray(4)=ASC("S")
FilterArray(5)=ASC("o")
FilterArray(6)=ASC("u")
FilterArray(7)=ASC("r")
FilterArray(8)=ASC("c")
FilterArray(9)=ASC("e")
FilterArray(10)=0
FilterArray(11)=ASC("*")
FilterArray(12)=ASC(".")
FilterArray(13)=ASC("b")
FilterArray(14)=0
FilterArray(15)=ASC("A")
FilterArray(16)=ASC("s")
FilterArray(17)=ASC("m")
FilterArray(18)=ASC(" ")
FilterArray(19)=ASC("F")
FilterArray(20)=ASC("i")
FilterArray(21)=ASC("l")
FilterArray(22)=ASC("e")
FilterArray(23)=ASC("s")
FilterArray(24)=0
FilterArray(25)=ASC("*")
FilterArray(26)=ASC(".")
FilterArray(27)=ASC("a")
FilterArray(28)=ASC("s")
FilterArray(29)=ASC("m")
FilterArray(30)=0
FilterArray(31)=ASC("A")
FilterArray(32)=ASC("l")
FilterArray(33)=ASC("l")
FilterArray(34)=ASC(" ")
FilterArray(35)=ASC("F")
FilterArray(36)=ASC("i")
FilterArray(37)=ASC("l")
FilterArray(38)=ASC("e")
FilterArray(39)=ASC("s")
FilterArray(40)=0
FilterArray(41)=ASC("*")
FilterArray(42)=ASC(".")
FilterArray(43)=ASC("*")
FilterArray(44)=0
FilterArray(45)=0
RETURN

ExitButton.COMMAND
END
END EVENT

NewButton.COMMAND
Edit.CLEAR
SaveValid=FALSE
SaveButton.ENABLED=FALSE
SaveAsButton.ENABLED=FALSE
END EVENT

OpenButton.COMMAND
FileName=""
OPENDIALOG FileName,FileFilter,InitDir 
IF STATUS<>0 THEN
	Edit.LOADFILE FileName
	SaveFileName=FileName
	SaveValid=True
	SaveButton.ENABLED=TRUE
	SaveAsButton.ENABLED=TRUE
	OBMain.TEXT=FileName
ENDIF
END EVENT

SaveButton.COMMAND
IF SaveValid=TRUE THEN
	Edit.SAVEFILE SaveFileName
	'SaveValid=FALSE
	'SaveButton.ENABLED=FALSE
ENDIF
END EVENT

SaveAsButton.COMMAND
FileName=""
SAVEDIALOG FileName,FileFilter,InitDir
IF STATUS<>0 THEN
	Edit.SAVEFILE FileName
	SaveFileName=FileName
	'SaveValid=FALSE
	'SaveButton.ENABLED=FALSE
	OBMain.TEXT=FileName
ENDIF
END EVENT

DelButton.COMMAND

END EVENT

CutButton.COMMAND

END EVENT

CopyButton.COMMAND

END EVENT

PasteButton.COMMAND

END EVENT

FindButton.COMMAND

END EVENT

ReplaceButton.COMMAND

END EVENT

CompileButton.COMMAND

END EVENT

CompileAsmButton.COMMAND

END EVENT

CompileTestButton.COMMAND

END EVENT

AsmbButton.COMMAND

END EVENT

RunButton.COMMAND

END EVENT

DebugButton.COMMAND

END EVENT

StopButton.COMMAND

END EVENT

GoButton.COMMAND

END EVENT

StepButton.COMMAND

END EVENT

EndButton.COMMAND

END EVENT

HelpButton.COMMAND

END EVENT





