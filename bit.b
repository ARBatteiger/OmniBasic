dim x as long
dim b as boolean
dim a as byte vector

setvec a=addr(b)
x=$55
print bin$(x)
x=shl(x,1)
print bin$(x)
x=0
print bin$(x)
x=bitset(x,4)
print bin$(x)
x=bitchg(x,2)
print bin$(x)
x=bitchg(x,2)
print bin$(x)
x=bitclr(x,4)
print bin$(x)
x=bitset(x,15)
print bin$(x)
x=bitset(x,31)
print bin$(x)
b=bittst(x,31)
print a
if b=true then
	print "true"
else
	print "false"
endif
x=bitchg(x,31)
print bin$(x)
b=bittst(x,31)
print a
if b=true then
	print "true"
else
	print "false"
endif


