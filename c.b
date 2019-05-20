dim i as long
type test
	a as long
	b as string
	c as label
	d as byte
endtype
dim testvar(10) as test
dim array(10) as long

table testvar
	11,"teststring",l2,22
	44,"havis",l1,55
endtable

print testvar(1).a,testvar(1).b,testvar(1).d
print testvar(2).a,testvar(2).b,testvar(2).d

gosub [testvar(1).c]

table array
	10
	9
	8
	7
	6
	5
	4
	3
	2
	1
endtable

for i=1 to 10
	print array(i)
next i

l1:
end

l2:
print "got here ok"
return
