declare function mulops(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print mulops(x,y)
end loop

function mulops(p1,p2)
return p1*p2
end function

