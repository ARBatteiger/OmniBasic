DIM richedit AS richedit
dim exitbutton as button

OBMain_Load:
SETPOSITION OBMain,200,100,624,568
CONSTRUCT richedit
SETPOSITION richedit,40,100,535,300
richedit.text="Hello World"
richedit.backcolor=$ffff00
construct exitbutton
setposition exitbutton,500,500,80,30
exitbutton.text="E&xit"
RETURN

exitbutton.command
end
end event

