DIM ExitButton AS BUTTON
DIM TestArray(10) AS BUTTON
DIM ComboBox AS COMBOBOX
DIM TextBox AS TEXTBOX
DIM Frame AS FRAME
DIM StaticText1 AS STATICTEXT
DIM StaticText2 AS STATICTEXT
DIM StaticText3 AS STATICTEXT
DIM ListBox AS LISTBOX
DIM Slider AS SLIDER
DIM Spinner AS SPINNER
DIM ProgressBar AS PROGRESSBAR
DIM Calendar AS CALENDAR
DIM Header AS Header
DIM TreeView AS TREEVIEW
DIM TabFolder AS TABFOLDER
DIM ButtonListBox AS BUTTONLISTBOX
DIM ToolBar AS TOOLBAR
DIM StatusBar AS STATUSBAR
DIM CheckBox AS CheckBox
DIM RadioButton1 AS RADIOBUTTON
DIM RadioButton2 AS RADIOBUTTON
DIM RadioButton3 AS RADIOBUTTON
DIM RadioButton4 AS RADIOBUTTON
DIM RadioButton5 AS RADIOBUTTON
dim test1(10) as button
dim a$ as string*32
type junk
x as long
y as long
z as long
endtype
dim trash(10) as junk

OBMain_Load:
SETPOSITION OBMain,200,200,624,368
SETTEXT OBMain,"Innomation Systems, Inc."

a$="Combo"

'setbackcolor OBMain,$ff0000

CONSTRUCT ToolBar

Construct StatusBar

CONSTRUCT ExitButton
SETPOSITION ExitButton,550,280,64,32
SETTEXT ExitButton,"E&xit"

CONSTRUCT ComboBox
SETPOSITION ComboBox,10,40,80,100
SETTEXT ComboBox,a$
SETBACKCOLOR ComboBox,$00ff00
SETFORECOLOR ComboBox,$0000ff

CONSTRUCT Header
SETPOSITION Header,10,80,80,20
SETTEXT Header,"Header"

CONSTRUCT TextBox
SETPOSITION TextBox,100,40,80,20
SETTEXT TextBox,"TextBox"
SETBACKCOLOR TextBox,$00ff00
SETFORECOLOR TextBox,$0000ff

CONSTRUCT StaticText1
SETPOSITION StaticText1,200,40,80,15
SETTEXT StaticText1,"StaticText1"
SETBACKCOLOR StaticText1,$ff
SETFORECOLOR StaticText1,$ffffff

CONSTRUCT StaticText2
SETPOSITION StaticText2,200,55,80,15
SETTEXT StaticText2,"StaticText2"
SETBACKCOLOR StaticText2,$ff00
SETFORECOLOR StaticText2,$ff0000

CONSTRUCT StaticText3
SETPOSITION StaticText3,200,70,80,15
SETTEXT StaticText3,"StaticText2"
SETBACKCOLOR StaticText3,$ff0000
SETFORECOLOR StaticText3,$00ffff

CONSTRUCT Slider
+invoke GetWindowLong,[Slider],GWL_STYLE
+or eax,TBS_NOTICKS
+invoke SetWindowLong,[Slider],GWL_STYLE,eax
'+invoke UpdateWindow,[Slider]
SETPOSITION Slider,300,40,120,20
SETTEXT Slider,"Frame"
SETBACKCOLOR Slider,$80ff

CONSTRUCT CheckBox
SETPOSITION CheckBox,440,40,100,20
SETTEXT CheckBox,"CheckBox"
SETBACKCOLOR CheckBox,$ff0000
SETFORECOLOR CheckBox,$00ffff
;+invoke CheckDlgButton,[OBMain],109,BST_CHECKED
+invoke SendMessage,[CheckBox],BM_SETCHECK,BST_CHECKED,0

CONSTRUCT Frame
SETPOSITION Frame,10,70,130,140
SETTEXT Frame,"Frame"
;+invoke SetTextColor,[Frame],255
SETBACKCOLOR Frame,$00ffff
SETFORECOLOR Frame,$0000ff

CONSTRUCT RadioButton1 IN Frame
SETPOSITION RadioButton1,5,30,100,20
SETTEXT RadioButton1,"Red"
SETBACKCOLOR RadioButton1,$000000
SETFORECOLOR RadioButton1,$0000ff

CONSTRUCT RadioButton2 IN Frame
SETPOSITION RadioButton2,5,50,100,20
SETTEXT RadioButton2,"Green"
SETBACKCOLOR RadioButton2,$000000
SETFORECOLOR RadioButton2,$00ff00

CONSTRUCT RadioButton3 IN Frame
SETPOSITION RadioButton3,5,70,100,20
SETTEXT RadioButton3,"Blue"
SETBACKCOLOR RadioButton3,$000000
SETFORECOLOR RadioButton3,$ff0000

CONSTRUCT RadioButton4 IN Frame
SETPOSITION RadioButton4,5,90,100,20
SETTEXT RadioButton4,"Black"

CONSTRUCT RadioButton5 IN Frame
SETPOSITION RadioButton5,5,110,100,20
SETTEXT RadioButton5,"White"

;+invoke CheckRadioButton,[Frame],115,115,115
;+invoke CheckDlgButton,[Frame],114,BST_CHECKED
+invoke SendMessage,[RadioButton3],BM_SETCHECK,BST_CHECKED,0

CONSTRUCT TabFolder
SETPOSITION TabFolder,10,220,100,100
SETTEXT TabFolder,"TabFolder"

CONSTRUCT ListBox
SETPOSITION ListBox,150,100,100,100
ADDITEM ListBox,"Item1"
ADDITEM ListBox,"Item2"
ADDITEM ListBox,"Item3"
ADDITEM ListBox,"Item4"
ADDITEM ListBox,"Item5"
ADDITEM ListBox,"Item6"
ADDITEM ListBox,"Item7"
ADDITEM ListBox,"Item8"
SETBACKCOLOR ListBox,$ff0000
SETFORECOLOR ListBox,$ffffff

CONSTRUCT ButtonListBox
SETPOSITION ButtonListBox,150,220,100,100

CONSTRUCT Spinner
SETPOSITION Spinner,270,100,100,20

CONSTRUCT ProgressBar
SETPOSITION ProgressBar,390,100,100,20

CONSTRUCT TreeView
SETPOSITION TreeView,510,100,100,100

CONSTRUCT Calendar
SETPOSITION Calendar,270,140,200,150

ADDITEM ComboBox,"Item1"
ADDITEM ComboBox,"Item2"
ADDITEM ComboBox,"Item3"
ADDITEM ComboBox,"Item4"
ADDITEM ComboBox,"Item5"
ADDITEM ComboBox,"Item6"

RETURN

OBMain_Command:
SETFORECOLOR StaticText1,$ffff
RETURN

