type dt
	b as string
	y as integer
end type
dim c(10) as dt
dim vc(1) as dt vector

c(3).b="Array String"
c(3).y=333
setvec vc=addr(c)
print c(3).b
print vc(3).b
print c(3).y
print vc(3).y

vc(7).b="subsript=7"
vc(7).y=777
print c(7).b
print vc(7).b
print c(7).y
print vc(7).y



