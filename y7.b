declare function orops(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print orops(x,y)
end loop

function orops(p1,p2)
return p1|p2
end function

