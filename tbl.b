type dt
	x as long
	a$ as string*3
	y as integer
	b$ as string*5
end type
dim a(3) as dt
dim q as dt
dim q$ as string
dim qa(5) as string

dim w(7) as long

type dt1
	z as long
	zz as integer
end type
dim b(10) as dt1

type nt
	i as byte
	j as integer
	k as long
end type

dim v as long
dim bool as boolean

tbl tsttbl as string*9
	"12345678"
	"two"
	"three"
	"four"
endtbl

const con=44

table a
1,"1",1,"11"
2,"2",2,"22"
3,"3",3,"33"
end table

b(3).z=0

v=tablesize(a)
v=tablesize(b)
v=tablesize(w)
v=tablesize(tsttbl)

'bool=tsttbl(3)

q$=tsttbl(3)

q$=qa(3)

q$=a(2).b$

