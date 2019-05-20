dim byte1 as byte
dim byte2 as byte
dim integer1 as integer
dim integer2 as integer
dim long1 as long
dim long2 as long
dim a$ as string*16
dim z(10) as long
type cpxtype
	a as byte
	b as long
end type
dim cpxvar as cpxtype
dim cpxarray(100) as cpxtype
dim ptr as long pointer
dim i as integer

z(7)=z(8)
z(z(5)-z(4))=z(z(2))

a$=a$+"test"+"Hello"
integer1=asc(a$)

byte1=252
byte2=byte1

integer1=3333
integer2=integer1

long1=4444444
long2=long1

integer1=byte1
integer1=long1
byte1=integer1
byte1=long1
long1=byte1
long1=integer1

byte1=byte2-byte1
integer1=integer2-integer1
long1=long2-long1

gosub test1
end

test1:
long1=2
long2=long1
long1=long1+long2
integer1=long1+long2
byte2=long1+long2
long1=byte1+integer2+byte2
return

