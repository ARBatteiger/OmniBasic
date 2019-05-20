* Diminsion Variables
dim i as long
dim x as long
dim y as long
dim row as long
dim col as long
dim q(10) as byte
dim tempstr as string *32
dim strarray(100) as string *32
dim width as long
dim height as long
dim msgboxname as string * 32
dim msgboxtext as string * 32
dim display as string * 11
dim acc as long
dim hexflag as byte
dim opflag as byte
dim pendingop as byte

* Functions
#fcn decimal() void
#fcn hex() void
#fcn getdisplay() void

* Constants
const Justify_Right=$00010000
const keysize=50
const numrows=4
const numcols=4
const numkeys=numrows*numcols
const add=1
const sub=2
const mul=3
const div=4
const and=5
const or=6
const eq=7

* Diminsion Controls
dim keyframe as frame
dim keys(numkeys) as button
dim textfield as textfield
dim clearbutton as button
dim exitbutton as button
dim modeframe as frame
dim radiobutton(2) as radiobutton
dim operators(7) as button

#USE OBDefs.def

* construct controls
construct keyframe
construct keys in keyframe
construct textfield
construct clearbutton
construct exitbutton
construct modeframe
construct radiobutton in modeframe
construct operators

* make events
on keys.command call event
on clearbutton.command call event
on exitbutton.command call event
on radiobutton.command call event
on operators.command call event

main.size=450,450

* size and position keys
keyframe.size=(keysize+2)*numcols,(keysize+2)*numrows
keyframe.position=100,100
col=0
row=0
for i=1 to numkeys
	keys(i).size=keysize,keysize
	keys(i).text=ucase$(right$(hex$(i-1),1)) 
	keys(i).position=col*(keysize+2),row*(keysize+2)
	inc col
	if col=numcols then
		col=0
		inc row
	endif
next i

* size and posion operators
for i=1 to 7
	operators(i).size=30,30
	operators(i).position=320,60+i*32
next i

operators(1).text="+"
operators(2).text="-"
operators(3).text="*"
operators(4).text="/"
operators(5).text="AND"
operators(6).text="OR"
operators(7).text="="

decimal()\ set default mode
display="0"
textfield.text=display
acc=0
opflag=$ff
pendingop=0

modeframe.height=70
modeframe.position=155,320
modeframe.text="Mode"
radiobutton(1).text="Decimal"
radiobutton(2).text="Hex"

textfield.size=keysize*4,20
textfield.position=100,50
textfield.alignment=Justify_Right

clearbutton.size=40,40
clearbutton.position=270,350
clearbutton.text="&Clear"
clearbutton.backcolor=OBYellow

exitbutton.size=40,40
exitbutton.position=100,350
exitbutton.text="E&xit"
exitbutton.backcolor=OBRed

keys_command
if opflag<>0 then
	opflag=0
	display=""
endif
tempstr=keys(OBSel).text
display=display+tempstr
textfield.text=display
return 1

clearbutton_command
display="0"
textfield.text=display
x=0
acc=0
pendingop=0
return 1

exitbutton_command
end
return 1

radiobutton_command
if OBSel=1 then
	getdisplay()
	decimal()
	acc=x
	display=str$(acc)
else
	getdisplay()
	hex()
	acc=x
	display=ucase$(tail$(hex$(acc),2))
endif
textfield.text=display
return 1

operators_command
getdisplay()
opflag=$ff
select case pendingop
	case add
		acc=acc+x
	case sub
		acc=acc-x
	case mul
		acc=acc*x
	case div
		acc=acc/x
	case and
		acc=acc&x
	case or
		acc=acc|x
end select
select case OBSel
	case add
		pendingop=add
	case sub
		pendingop=sub
	case mul
		pendingop=mul
	case div
		pendingop=div
	case and
		pendingop=and
	case or
		pendingop=or
	case eq
		pendingop=0
end select
if hexflag=0 then
	display=str$(acc)
else
	display=ucase$(tail$(hex$(acc),2))
endif
textfield.text=display
return 1

decimal
for i=11 to 16
	keys(i).enabled=false
next i
operators(5).enabled=false
operators(6).enabled=false
hexflag=0
return

hex
for i=10 to 16
	keys(i).enabled=true
next i
operators(5).enabled=true
operators(6).enabled=true
hexflag=$ff
return

getdisplay
display=textfield.text
if hexflag<>0 then
	tempstr="$"+display
	display=tempstr
endif
x=val(display)	
return

rem
