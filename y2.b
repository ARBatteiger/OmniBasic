declare function addops(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print addops(x,y)
end loop

function addops(p1,p2)
return p1+p2
end function

