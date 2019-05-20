dim i as byte
dim t as long

t=gettickcount()
for i=1 to 254
	print i
next i
print (gettickcount()-t)


