type dt
	a$ as string*16
	a as byte
	b as integer
	c as long
end type

dim cpx as dt
dim cpxarray(10) as dt
dim x as long
dim b$ as string*16

x=addr(b$)

cpx.a$=b$
cpx.a$="test"

x=x+x
x=x+x+x

x=addr(cpx.a$)
x=addr(cpx)
x=addr(cpx.a)
x=addr(cpx.b)
x=addr(cpx.c)

x=addr(cpxarray)
x=addr(cpxarray(1))
x=addr(cpxarray(1).a)
x=addr(cpxarray(1).b)
x=addr(cpxarray(1).c)

x=addr(cpxarray(3))
x=addr(cpxarray(3).a)
x=addr(cpxarray(3).b)
x=addr(cpxarray(3).c)

