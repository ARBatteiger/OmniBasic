dim ctr as long
dim button(5) as button
dim exitbutton as button
dim static(5) as statictext
dim textbox(5) as textbox
dim combobox(5) as combobox
dim slider(5) as slider
dim progressbar(5) as progressbar
dim frame as frame
dim frame2 as frame
dim radiobutton(10) as radiobutton
dim statictext as statictext
dim i as long
dim tempstr as string
dim tempint as long
dim x as long
dim marquee(20) as statictext
dim marquee2(20) as statictext
dim marquee3(20) as statictext
dim marquee4(20) as statictext
dim marquee5(20) as statictext
dim marquee6(20) as statictext

dim color(8) as long
dim colornum as long

OBMain_Load:

ctr=0
colornum=1
color(1)=$0000ff
color(2)=$00ff00
color(3)=$ffff00
color(4)=$ff00ff
color(5)=$00ffff
color(6)=$0080ff
color(7)=$ff0000
color(8)=$ffffff

SETPOSITION OBMain,200,100,624,568
OBMain.TEXT="Innomation Systems GUI Array Test" 

CONSTRUCT frame
SETPOSITION frame,10,200,130,140
frame.TEXT="BackColor"
frame.FORECOLOR=$ff00ff

CONSTRUCT frame2
SETPOSITION frame2,160,200,130,140
frame2.TEXT="ForeColor"
frame2.FORECOLOR=$0080ff

construct exitbutton
setposition exitbutton,520,500,80,20
exitbutton.text="E&xit"

for i=1 to 5
	construct button(i)
	setposition button(i),(i-1)*90+10,10,80,20
	tempstr="Button"+str$(i)
	button(i).text=tempstr
	construct static(i)
	setposition static(i),(i-1)*90+10,40,80,20
if i=3 then
	static(i).backcolor=$0000ff
	static(i).forecolor=$00ffff
endif
	tempstr="Static"+str$(i)
	static(i).text=tempstr
	construct textbox(i)
	setposition textbox(i),(i-1)*90+10,70,80,20
if i=4 then
	textbox(i).backcolor=$ff0000
	textbox(i).forecolor=$ffffff
endif
	tempstr="Text"+str$(i)
	textbox(i).text=tempstr
	construct combobox(i)
	setposition combobox(i),(i-1)*90+10,100,80,100
if i=2 then
	combobox(i).backcolor=$00ff00
	combobox(i).additem "First"
	combobox(i).additem "Second"
	combobox(i).additem "Third"
endif
	tempstr="Combo"+str$(i)
	combobox(i).text=tempstr
	construct slider(i)
	setposition slider(i),(i-1)*90+10,130,80,20
	slider(i).value=i*15
	construct progressbar(i)
	setposition progressbar(i),(i-1)*90+10,160,80,20
	progressbar(i).value=i*15
	construct radiobutton(i) in frame
	setposition radiobutton(i),5,(i-1)*20+30,100,20
	construct radiobutton(i+5) in frame2
	setposition radiobutton(i+5),5,(i-1)*20+30,100,20
	select case i
		case 1
			radiobutton(i).text="red"
			radiobutton(i).forecolor=$0000ff
			radiobutton(i+5).text="red"
			radiobutton(i+5).forecolor=$0000ff
		case 2
			radiobutton(i).text="green"
			radiobutton(i).forecolor=$00ff00
			radiobutton(i+5).text="green"
			radiobutton(i+5).forecolor=$00ff00
		case 3
			radiobutton(i).text="blue"
			radiobutton(i).forecolor=$ff0000
			radiobutton(i+5).text="blue"
			radiobutton(i+5).forecolor=$ff0000
		case 4
			radiobutton(i).text="black"
			radiobutton(i).forecolor=$000000
			radiobutton(i+5).text="black"
			radiobutton(i+5).forecolor=$000000
		case 5
			radiobutton(i).text="white"
			radiobutton(i).forecolor=$ffffff
			radiobutton(i+5).text="white"
			radiobutton(i+5).forecolor=$ffffff
end select		
next i

construct statictext
setposition statictext,10,500,20,20
statictext.backcolor=$00ffff

for i=1 to 20
	construct marquee(i)
	setposition marquee(i),40+(i-1)*20,500,20,20
	marquee(i).backcolor=0
	construct marquee2(i)
	setposition marquee2(i),420-(i-1)*20,520,20,20
	marquee2(i).backcolor=0

	construct marquee3(i)
	setposition marquee3(i),455+(i-1)*5,40,5,5
	marquee3(i).backcolor=0
	construct marquee4(i)
	setposition marquee4(i),550-(i-1)*5,45,5,5
	marquee4(i).backcolor=0
	construct marquee5(i)
	setposition marquee5(i),455+(i-1)*5,50,5,5
	marquee5(i).backcolor=0
	construct marquee6(i)
	setposition marquee6(i),550-(i-1)*5,55,5,5
	marquee6(i).backcolor=0
next i

Timer2.interval=10

return

button.command
tempint=ArrayIndex
statictext.text=str$(ArrayIndex)
Timer1.interval=1000
select case tempint
	case 1
		Timer2.interval=10
	case 2
		Timer2.interval=200
	case 3
		Timer2.interval=500
	case 4
		Timer2.interval=700
	case 5
		Timer2.interval=1000
end select	
end event

Timer1.timer
Timer1.stop
statictext.text=""
end event

radiobutton.command
select case ArrayIndex
	case 1
		combobox(4).backcolor=$0000ff
	case 2
		combobox(4).backcolor=$00ff00
	case 3
		combobox(4).backcolor=$ff0000
	case 4
		combobox(4).backcolor=$000000
	case 5
		combobox(4).backcolor=$ffffff
	case 6
		combobox(5).backcolor=$0000ff
	case 7
		combobox(5).backcolor=$00ff00
	case 8
		combobox(5).backcolor=$ff0000
	case 9
		combobox(5).backcolor=$000000
	case 10
		combobox(5).backcolor=$ffffff
end select
end event

exitbutton.command
end
end event

Timer2.timer
inc ctr
if ctr>20 then
	ctr=1
	marquee(1).backcolor=color(colornum+1)
	marquee3(1).backcolor=color(colornum+1)
	marquee5(1).backcolor=color(colornum+1)
	marquee(20).backcolor=0
	marquee3(20).backcolor=0
	marquee5(20).backcolor=0
	marquee2(1).backcolor=color(colornum+1)
	marquee4(1).backcolor=color(colornum+1)
	marquee6(1).backcolor=color(colornum+1)
	marquee2(20).backcolor=0
	marquee4(20).backcolor=0
	marquee6(20).backcolor=0
	inc colornum
	if colornum>8 then
		colornum=1
	endif
else
	marquee(ctr).backcolor=color(colornum)
	marquee3(ctr).backcolor=color(colornum)
	marquee5(ctr).backcolor=color(colornum)
	marquee(ctr-1).backcolor=0
	marquee3(ctr-1).backcolor=0
	marquee5(ctr-1).backcolor=0
	marquee2(ctr).backcolor=color(colornum)
	marquee4(ctr).backcolor=color(colornum)
	marquee6(ctr).backcolor=color(colornum)
	marquee2(ctr-1).backcolor=0
	marquee4(ctr-1).backcolor=0
	marquee6(ctr-1).backcolor=0
endif
end event

static.command
if ArrayIndex<1 or ArrayIndex>20 THEN
	return
endif
tempint=ArrayIndex
select case tempint
	case 1
		for i=1 to 20
			marquee(i).visible=false
			marquee2(i).visible=false
		next i
	case 2
		for i=1 to 20
			marquee(i).visible=true
			marquee2(i).visible=false
		next i
	case 3
		for i=1 to 20
			marquee(i).visible=false
			marquee2(i).visible=true
		next i
	case 4
		for i=1 to 20
			marquee(i).visible=true
			marquee2(i).visible=true
		next i	
end select
end event

slider.scroll
tempint=ArrayIndex
statictext.text=str$(ArrayIndex)
Timer1.interval=1000
x=slider(tempint).value
progressbar(tempint).value=x
end event
