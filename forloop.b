dim i as long
dim t as long
dim x as long

t=gettickcount()
for i=1 to 100000000
	x=i*1000
next i
print (gettickcount()-t)

