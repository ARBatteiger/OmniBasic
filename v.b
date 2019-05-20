dim v(28) as byte vector
dim a$ as string*9
dim t as long
dim i as long

a$="abcdefghi"
print len(a$)
setvec v=addr(a$)
for i=1 to len(a$)
	t=v(i)
	print hex$(t)
next i

