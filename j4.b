dim labelarray(5) as label
dim x as long

Table labelarray
 l1
 l2
 l3
 l4
 l5
end table

loop
	input x
	exitif x<1 or x>5
	gosub [labelarray(x)]
endloop
end

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


