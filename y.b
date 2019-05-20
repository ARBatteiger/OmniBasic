* Diminsion Variables
dim ButtonText1 as string * 32
dim ButtonText2 as string * 32
dim ButtonText3 as string * 32
dim ButtonText4 as string * 32
dim ButtonText5 as string * 32
dim WinTitle as string * 32
dim TextBoxText1 as string * 32
dim TextBoxText2 as string * 32
dim Tip as string * 32
dim LabelName as string * 32
dim combo1 as string * 32
dim combo2 as string * 32
dim combo3 as string * 32
dim boolean as boolean
dim x as long
dim q(10) as byte
dim tempstr as string *32
dim strarray(100) as string *32
dim width as long
dim height as long

#set numbuttons=5

* Diminsion Controls
dim list(3) as list
dim button as button
dim buttonarray(numbuttons) as button
dim textfield1 as textfield
dim textfield2 as textfield
dim textarray(2) as textfield
dim radio(4) as radiobutton
dim check(4) as checkbutton
dim hslider(2) as hslider
dim vslider as vslider
dim vframe as verticalframe
dim hframe as horizontalframe
dim combobox as combobox
dim statusbar as statusbar
dim label as label
dim vdial as vdial
dim hdial as hdial
dim spinner(2) as spinner
dim header1 as header
dim header2 as header
dim listbox as listbox
dim frame4 as frame
dim frame3 as frame
dim frame1 as frame
dim frame2 as frame
dim progressbar as progressbar
dim table as table
dim text as text
dim tabbook as tabbook
dim tabitem1 as tabitem
dim tabitem2 as tabitem
dim menubar as menubar
dim menupane as menupane
dim optionmenu as optionmenu
dim menubutton as menubutton
dim frame5 as frame

#USE OBDefs.def

#set Justify_Left=$00008000
#set Justify_Right=$00010000

* make events
*on button.click call event
*on combobox.click call event
*on vslider.change call event
*on buttonarray.click call event
*on radio.change call event

combo1="First =C1A"
combo2="Second = Connie"
combo3="Third = Havis"
ButtonText1="Button Number 1 (Normal)"
ButtonText2="Button Number 2 (Flattened)"
ButtonText3="Button &Number 3 (Normal)"
ButtonText4="Button Number 4 (Normal)"
ButtonText5="Button Number 5 (Normal)"
WinTitle="Window Title Goes Here"
TextBoxText1="Text Box 1 Text"
TextBoxText2="Text Box 2 Text"
Tip="Tool Tip is Me"
LabelName="Hello World"
boolean=true
boolean=false

*construct vframe
*construct hframe
*construct vdial
*construct hdial
construct combobox
construct header1
construct header2
construct list
construct spinner
construct button
construct buttonarray
construct textfield1
construct textfield2
construct textarray
construct label
construct vslider
construct hslider
construct statusbar
construct listbox
construct frame4
construct frame3 in frame4
construct frame1 in frame3
construct frame2 in frame3
construct progressbar
construct radio in frame2
construct check in frame1
construct table
*construct text
construct tabbook
construct tabitem1 in tabbook
construct tabitem2 in tabbook
*construct menubar
*construct menupane in menubar
*construct optionmenu
*construct menubutton
construct frame5\ must construct after list for list to be visible

*optionmenu.position=50,50

*menubutton.position=0,100

*menubar.width=width
*menubar.backcolor=OBBlue
*;new FXMenuTitle(main,"&File",NULL,main);
*;new FXMenuCommand(menupane,"&Open\tCtl-O\tOpen a file.",NULL,menupane);
*;new FXMenuCommand(menupane,"Open Dir\t\tOpen a directory.",NULL,menupane);
*;new FXMenuCommand(main,"&Open\tCtl-O\tOpen a file.",NULL,menupane);
*;new FXMenuCommand(main,"Open Dir\t\tOpen a directory.",NULL,menupane);

main.title="New Title"

main.minimize

width=1000
height=700

main.size=width,height

for i=1 to 10
	q(i)=i
next i

combobox.addItem=combo1
combobox.additem=combo2
combobox.AddItem=combo3
combobox.additem="fourth Item"
combobox.backcolor=OBLtYellow
combobox.textcolor=OBOrange
combobox.text=LabelName
combobox.selbackcolor=OBWhite
combobox.seltextcolor=OBViolet

tabbook.y=200
tabitem1.position=0,0
tabitem2.position=0,40
tabitem1.text="Tab 1"
*tabitem2.text="Tab 2"
*tabitem1.backcolor=OBBlue

*;copyicon=new FXGIFIcon(getApp(),copy_gif);

statusbar.position=0,height-20
statusbar.width=width

listbox.addItem=combo1
listbox.additem=combo2
listbox.AddItem=combo3
listbox.additem="fourth Item"
listbox.backcolor=OBLtYellow
listbox.textcolor=OBOrange
listbox.position=200,300
listbox.selbackcolor=OBWhite
listbox.seltextcolor=OBViolet

label.position=200,210
spinner(1).position=290,210
spinner(2).position=340,210
progressbar.position=400,210

textfield1.position=200,240
textfield2.position=200,270
textarray(1).position=400,240
textarray(2).position=400,270

*label.size=200,20

x=4


button.text="&OmniBasic"
button.enabled=false

tempstr=button.text

strarray(22)=button.text

label.text=strarray(22)

textfield2.enabled=TRUE

textfield1.text=TextBoxText1
textfield1.textcolor=OBBlue
textfield1.editable=false
textfield1.selbackcolor=OBRed
;textfield1->setFocus();
;textfield1->setCursorPos(5);
textfield1.columns=18
;textfield1->setTipText(Tip);
textfield1.alignment=Justify_Right
textfield1.seltextcolor=OBGreen
textfield1.backcolor=OBPink

textarray(1).text="text array (1)"
textarray(2).text="text array (2)"


textfield2.text=TextBoxText2+" Literal Text"
textfield2.TextColor=OBViolet
textfield2.Editable=true
textfield2.SelBackColor=OBBlue
;textfield2->setFocus();
;textfield2->setCursorPos(5);
textfield2.Columns=18
;textfield2->setTipText(Tip);
textfield2.alignment=Justify_Left
textfield2.SelTextColor=OBBlack
textfield2.BackColor=OBMint

spinner(1).Range=1,999
spinner(1).cyclic=true
spinner(2).Range=990,999
spinner(2).cyclic=false

label.backcolor=OBViolet
label.textcolor=OBYellow
label.text="Louise"


textarray(1).backcolor=textfield2.backcolor

check(3).backcolor=OBLtYellow
*check(3).text="Check 3"

*radio(1).backcolor=OBRed

x=label.textcolor

*x=radio(1).backcolor

q(3)=label.textcolor

*q(3)=radio(2).backcolor

q(3)=x

q(3)=q(4)

textfield2.editable=textfield1.editable
hslider(1).range=0,99
hslider(1).value=99
hslider(1).backcolor=OBLtBlue
hslider(2).range=0,99
hslider(2).value=hslider(1).value
hslider(2).backcolor=hslider(1).backcolor

vslider.range=0,99
vslider.value=0
vslider.backcolor=OBLtBlue

*combobox.clear

frame4.size=320,190
frame4.position=260,460
frame4.text="Bigger Frame"
frame3.size=280,150
frame3.position=20,20
frame3.text="Big Frame"
frame3.textcolor=OBBlue
frame1.position=20,20
button.enabled=true
frame1.text="Havis"
frame1.size=110,110
frame2.size=110,110
frame2.text="Radio"
frame1.textcolor=OBRed
frame2.position=150,20
button.backcolor=OBViolet
button.textcolor=OBYellow
button.width=80
button.height=20
button.x=200
button.y=390
textarray(1).focus=true
vslider.position=200,420
*check(1).position=40,20
*check(2).position=40,40
*check(3).position=40,60
*check(4).position=40,80
*radio(1).position=20,20
*radio(2).position=20,40
*radio(3).position=20,60
radio(1).text="Radio Button 1"
radio(2).text="Radio Button 2"
radio(3).text="Radio Button 3"
radio(4).text="Radio Button 4"
radio(1).textcolor=OBViolet
check(1).text="Check Button 1"
check(2).textcolor=OBBlue
check(2).text="Check Button 2"
check(3).textcolor=OBOrange
check(3).text="Check Button 3"
check(4).textcolor=OBDkGreen
check(4).text="Check Button 4"

*main.backcolor=OBLtBlue
table.position=600,50
table.tablesize=100,5
table.backcolor=OBYellow
table.gridcolor=OBGray
*table.cellcolor=0,0,OBYellow
*table.cellcolor=1,1,OBYellow
table.shadowcolor=OBMint
table.textcolor=OBDkGreen
table.selbackcolor=OBViolet
table.seltextcolor=OBYellow
table.colwidth=0,80
table.fixedrowstop=1
table.fixedrowsbottom=1
table.fixedcolsleft=1
for i=0 to 99
	table.rowheight=i,15
next i
for i=0 to 99
	for j=0 to 3
		table.textmatrix=i,j,"havis "+str$(i)+","+str$(j)
	next j
next i
table.display=33,3

;table->moveContents(33,3);
table.visiblerows=2

header1.position=0,560
header2.position=80,560
list(1).position=0,575
list(2).position=80,575
list(3).position=600,400
*text.position=700,550
list(3).backcolor=OBLtBlue
list(3).additem="First Item"
list(3).additem="Second Item"
list(3).additem="Third Item"
list(3).additem="Fourth Item"
list(3).additem="Fifth Item"
list(3).additem="Sixth Item"
list(3).additem="Seventh Item"
list(3).additem="Eighth Item"
list(3).additem="Nineth Item"
list(3).additem="Tenth Item"
list(3).additem="Eleventh Item"
list(3).additem="Twelfth Item"
list(3).additem="Thirteenth Item"
list(3).additem="Fourteenth Item"
list(3).additem="Fifteenth Item"
list(3).additem="Sixteenth Item"
list(3).additem="Seventeenth Item"
list(3).additem="Eighteenth Item"
list(3).textcolor=OBDkBlue
list(3).size=200,250
frame5.size=204,254
frame5.position=598,398
list(1).backcolor=OBMint
list(2).backcolor=OBPink
list(1).additem=combo1
list(1).additem=combo2
list(1).additem=combo3
list(2).additem="First"
list(2).additem="Second"
list(2).additem="Third"
list(2).additem="Fourth"
list(2).additem="Fifth"
list(2).additem="Sixth"
list(2).additem="Seventh"
list(2).additem="Eighth"
list(2).additem="Nineth"
list(2).selbackcolor=OBRed
list(2).seltextcolor=OBYellow
header1.text="Header 1"
header2.text="Header 2"
header1.backcolor=OBGray
header2.backcolor=OBGray

progressbar.progress=75
progressbar.color=OBBlue
progressbar.backcolor=OBWhite
ButtonText1="Button "

x=100

for i=1 to 5
	buttonarray(i).size=80,20
	buttonarray(i).position=200+(i-1)*100,360
	buttonarray(i).text=ButtonText1+"&"+str$(i)
	buttonarray(i).backcolor=100+i*20
	buttonarray(i).textcolor=OBYellow-i*20
next i

combobox.position=200,330

hslider(1).position=400,300
hslider(2).position=400,330

spinner(1).value=995
spinner(2).value=spinner(1).value

*button.canfocus=boolean\ test for invalid operand



rem
