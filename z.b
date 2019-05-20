dim x(10) as long
dim y as long
type dt1
	p as long
	q as long
	r as long
	m$ as string*17
	n$(15) as string*6
	n(9) as long
end type
dim c as dt1
dim ca1(10) as dt1
dim a$ as string*16

x(7)=0
ca1(8).q=0
a$="z"
a$=ca1(3).n$(2)
ca1(5).m$="x"
c.m$="x"
ca1(7).n(3)=0
y=addr(c)
y=c.r+addr(y)
c.r=y
y=addr(c.r)
y=addr(ca1)
y=addr(ca1(3))
y=addr(ca1(3).q)
y=addr(ca1(3).n(5))
y=addr(y)
y=addr(x)
y=addr(x(3))


