declare function divops(integer,integer) as integer
dim x as long
dim y as long

loop
	input x
	input y
	print divops(x,y)
end loop

function divops(p1,p2)
return p1/p2
end function

