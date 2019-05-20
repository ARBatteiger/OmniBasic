dim i as long
dim j as long
dim x as long

for i=1 to 4
	for j=1 to 100000000
		if i>2 then
			x=land(x,44)
		endif
	next j
next i

