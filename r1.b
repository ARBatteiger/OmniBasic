dim havis as label
dim array(10) as label
type type1
	label1 as label
	label2 as label
end type
dim complex as type1
dim complexarray(10) as type1
dim longarray(10) as long

l1:

longarray(5)=8

havis=l1

goto l1
gosub l1

goto [havis]
gosub [havis]
goto [array(7)]
gosub [array(7)]
goto [complex.label1]
gosub [complex.label2]
goto [complexarray(3).label1]
gosub [complexarray(3).label2]

array(5)=l1



