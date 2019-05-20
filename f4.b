dim i as long
dim j as long
dim x as long
type dt
	a as long
	b as long
	c as long
end type
dim cpx(10) as dt

for j=1 to 20
	for i=1 to 100000000
		if i>10 then
			cpx(3).c=x
		endif
	next i
next j
