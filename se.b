dim edit as scintilla
dim scintilla as scintilla
dim loadbutton as button
dim savebutton as button
dim textbutton as button
dim xferbutton as button
dim xferbutton2 as button
dim exitbutton as button
dim textbox as textbox
dim s as string
dim filename as string

OBMain_Load:
SETPOSITION OBMain,200,100,624,568
CONSTRUCT edit
SETPOSITION edit,40,100,535,300
CONSTRUCT scintilla
SETPOSITION scintilla,40,420,535,20
construct textbox
setposition textbox,40,460,535,20
construct textbutton
setposition textbutton,400,500,80,30
textbutton.text="&Hello!"
construct xferbutton
setposition xferbutton,300,500,80,30
xferbutton.text="XferToText"
construct xferbutton2
setposition xferbutton2,200,500,80,30
xferbutton2.text="XferToSci"
construct loadbutton
setposition loadbutton,100,500,80,30
loadbutton.text="&Load"
construct savebutton
setposition savebutton,40,500,40,30
savebutton.text="&Save"
construct exitbutton
setposition exitbutton,500,500,80,30
exitbutton.text="E&xit"
s="This is a test."
scintilla.addtext addr(s),len(s)
s=" This is another test."
scintilla.addtext addr(s),len(s)
edit.hscroll=true
RETURN

exitbutton.command
end
end event

textbutton.command
scintilla.text="Hello World!"
end event

xferbutton.command
s=scintilla.text
textbox.text=s
end event

xferbutton2.command
s=textbox.text
scintilla.text=s
end event

loadbutton.command
filename=textbox.text
edit.loadfile filename
end event

savebutton.command
filename=textbox.text
edit.savefile filename
end event
