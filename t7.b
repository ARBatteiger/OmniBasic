type dt
	a as long
	b as long
	c as long
	a$ as string*32
	c$ as string*32
endtype
dim cpx as dt
dim cpxarray(10) as dt
dim x as long
dim y as integer
dim z as byte
dim q(100) as long
dim r(100) as integer
dim s(100) as byte
dim b$ as string*16

cpx.a=cpx.b
cpxarray(5).a=cpxarray(6).b

cpx.a=x
cpx.b=x
cpx.c=x
cpxarray(r(7)).b=x

cpx.a=x
cpx.a$="x"
cpxarray(5).a=x
cpxarray(5).a$="y"

q(3)=x

cpxarray(x).a$=cpxarray(x).c$



