dim labelarray(5) as label
dim x as long

labelarray(1)=l1
labelarray(2)=l2
labelarray(3)=l3
labelarray(4)=l4
labelarray(5)=l5

loop
	input x
	exitif x<1 or x>5
	gosub [labelarray(x)]
endloop
end

l1:
print "one"
l2:
print "two"
l3:
print "three"
l4:
print "four"
l5:
print "five"
return


