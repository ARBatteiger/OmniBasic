declare function power(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print power(x,y)
end loop

function power(p1,p2)
dim i as long
dim t as long
t=p1
if p2=0 then
	t=1
else
	for i=1 to p2-1
		t=t*p1
	next i
endif
return t
end function

