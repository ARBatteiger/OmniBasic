dim labelarray(5) as label
dim x as long
dim v(5) as long vector
setvec v=addr(labelarray)

gosub setup

loop
input x
gosub [labelarray(x)]
print _ArgSafe0
endloop

l1:
print "one"
return
l2:
print "two"
return
l3:
print "three"
return
l4:
print "four"
return
l5:
print "five"
return

setup:
labelarray(1)=l1
print _ArgSafe0
labelarray(2)=l2
print _ArgSafe0
labelarray(3)=l3
print _ArgSafe0
labelarray(4)=l4
print _ArgSafe0
labelarray(5)=l5
print _ArgSafe0
for x=1 to 5
	print v(x)
next x
return

