type dt
	b as string
	y as integer
end type
dim c(10) as dt
dim vc(1) as dt vector
dim pc as dt pointer
dim pb as string pointer
dim py as integer pointer

c(3).b="Array String"
c(3).y=333
setvec vc=addr(c)
pc=addr(c)
pc=index(pc,2)
print c(3).b
print vc(3).b
print c(3).y
print vc(3).y
print [pc].b
print [pc].y

vc(7).b="subsript=7"
vc(7).y=777
print c(7).b
print vc(7).b
print c(7).y
print vc(7).y
pc=index(pc,4)
print [pc].b
print [pc].y

pc=addr(c(3))
print [pc].b
print [pc].y

py=addr(c(7).y)
print [py]+1
pb=addr(c(7).b)
print [pb]+" member"





