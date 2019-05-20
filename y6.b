declare function andops(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print andops(x,y)
end loop

function andops(p1,p2)
return p1&p2
end function

