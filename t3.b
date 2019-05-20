dim x as byte
dim y as integer
dim z as long
type dt
	a as byte
	b as integer
	c as long
end type
dim cpx as dt
dim cpxarray(100) as dt

x=2
y=3
cpx.c=200
cpxarray(cpx.c).c=x+y*2

'cpxarray(asl(cpxarray(3).a).b,5)=cpx.c
x=shl(cpxarray(3).a,5)
x=shr(cpxarray(3).a,5)
x=sal(cpxarray(3).a,5)
x=sar(cpxarray(3).a,5)
x=rol(cpxarray(3).a,5)
x=ror(cpxarray(3).a,5)
x=rcl(cpxarray(3).a,5)
x=rcr(cpxarray(3).a,5)

'cpxarray(LAND(cpxarray(3).a).b,5)=cpx.c
x=LAND(cpxarray(3).b,5)
