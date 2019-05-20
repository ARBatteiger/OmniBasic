DIM ExitButton AS BUTTON
DIM TestArray(12) AS BUTTON
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
DIM RB1 AS RADIOBUTTON
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

CONSTRUCT TextBox
SETPOSITION TextBox,100,40,80,20
SETTEXT TextBox,"TextBox"
SETCOLOR TextBox,$c0c000,$0080ff

CONSTRUCT ComboBox
SETPOSITION ComboBox,10,40,80,100
SETTEXT ComboBox,a$
SETCOLOR ComboBox,$000080,$00ffff
ADDITEM ComboBox,"Item1"
ADDITEM ComboBox,"Item2"
ADDITEM ComboBox,"Item3"
ADDITEM ComboBox,"Item4"
ADDITEM ComboBox,"Item5"
ADDITEM ComboBox,"Item6"

CONSTRUCT Header
SETPOSITION Header,10,80,80,20
SETTEXT Header,"Header"

CONSTRUCT StaticText1
SETPOSITION StaticText1,200,40,80,15
SETTEXT StaticText1,"StaticText1"
SETCOLOR StaticText1,$ff,$ffffff

CONSTRUCT StaticText2
SETPOSITION StaticText2,200,55,80,15
SETTEXT StaticText2,"StaticText2"
SETCOLOR StaticText2,$ff00,$ff0000

CONSTRUCT StaticText3
SETPOSITION StaticText3,200,70,80,15
SETTEXT StaticText3,"StaticText2"
SETCOLOR StaticText3,$ff0000,$00ffff

CONSTRUCT Slider
+invoke GetWindowLong,[Slider],GWL_STYLE
+or eax,TBS_NOTICKS
+invoke SetWindowLong,[Slider],GWL_STYLE,eax
'+invoke UpdateWindow,[Slider]
SETPOSITION Slider,300,40,120,20
SETTEXT Slider,"Frame",$80ff
SETCOLOR Slider,$80ff,0

CONSTRUCT RB1
SETPOSITION RB1,300,70,100,20
SETTEXT RB1,"Havis"
SETCOLOR RB1,$800080,$00ffff

CONSTRUCT CheckBox
SETPOSITION CheckBox,440,40,100,20
SETTEXT CheckBox,"CheckBox"
SETCOLOR CheckBox,$ff0000,$00ffff
;+invoke CheckDlgButton,[OBMain],109,BST_CHECKED
+invoke SendMessage,[CheckBox],BM_SETCHECK,BST_CHECKED,0

CONSTRUCT Frame
SETPOSITION Frame,10,70,130,140
SETTEXT Frame,"Frame"
;+invoke SetTextColor,[Frame],255
SETCOLOR Frame,$c0c0c0,$00009f

CONSTRUCT RadioButton1
SETPOSITION RadioButton1,15,100,100,20
SETTEXT RadioButton1,"Red"
SETCOLOR RadioButton1,$c0c0c0,$00009f

CONSTRUCT RadioButton2
SETPOSITION RadioButton2,15,120,100,20
SETTEXT RadioButton2,"Green"
SETCOLOR RadioButton2,$c0c0c0,$009f00

CONSTRUCT RadioButton3
SETPOSITION RadioButton3,15,140,100,20
SETTEXT RadioButton3,"Blue"
SETCOLOR RadioButton3,$c0c0c0,$9f0000

CONSTRUCT RadioButton4
SETPOSITION RadioButton4,15,160,100,20
SETTEXT RadioButton4,"Black"
SETCOLOR RadioButton4,$c0c0c0,$000000

CONSTRUCT RadioButton5
SETPOSITION RadioButton5,15,180,100,20
SETTEXT RadioButton5,"White"
SETCOLOR RadioButton5,$c0c0c0,$ffffff

;+invoke CheckRadioButton,[Frame],115,115,115
;+invoke CheckDlgButton,[Frame],114,BST_CHECKED
+invoke SendMessage,[RadioButton3],BM_SETCHECK,BST_CHECKED,0

CONSTRUCT TabFolder
SETPOSITION TabFolder,10,220,100,100
SETTEXT TabFolder,"TabFolder"
SETCOLOR TabFolder,$ff00ff,$00ffff

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
SETCOLOR ListBox,$ff0000,$ffffff

CONSTRUCT ButtonListBox
SETPOSITION ButtonListBox,150,220,100,100
SETCOLOR ButtonListBox,$ff00ff,$00ffff

CONSTRUCT Spinner
SETPOSITION Spinner,270,100,100,20
SETCOLOR Spinner,$ff00ff,$00ffff

CONSTRUCT ProgressBar
SETPOSITION ProgressBar,390,100,100,20
SETCOLOR ProgressBar,$ff00ff,$00ffff

CONSTRUCT TreeView
SETPOSITION TreeView,510,100,100,150
SETCOLOR TreeView,$ff00ff,$00ffff

CONSTRUCT Calendar
SETPOSITION Calendar,270,140,200,150

RETURN

OBMain_Command:
SETCOLOR StaticText1,$008000,$00ffff
RETURN

