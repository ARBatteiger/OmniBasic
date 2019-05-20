dim lbl as label
dim lblarray(10) as label
type cpxdata
	z as long
	l as label
endtype
dim cpx as cpxdata
dim cpxarray(10) as cpxdata
dim x as long

lbl1:
x=1

cpx.l=lbl1
goto [cpx.l]
gosub [cpx.l]

lblarray(2)=lbl1
goto [lblarray(2)]
gosub [lblarray(2)]

cpxarray(3).l=lbl1
goto [cpxarray(3).l]
gosub [cpxarray(3).l]

lbl=lbl1
goto [lbl]
gosub [lbl]

goto lbl1
gosub lbl1
