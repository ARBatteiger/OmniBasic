dim x as integer
dim px as integer pointer
dim a as string*16
dim pa as string pointer
type dt
	b as string
	y as integer
end type
dim c as dt
dim pc as dt pointer
dim vc as dt vector

x=49
px=addr(x)
[px]=[px]+1
print x
print [px]

a="test"
pa=addr(a)
a=[pa]+"1"
print a
print [pa]

pc=addr(c)
[pc].b="cpxstring"
[pc].y=89
[pc].y=[pc].y+1
print c.b
print [pc].b
print c.y
print [pc].y

setvec vc=addr(c)
print vc.b
print vc.y



