dim x as long
dim y as long
dim i as long

x=5
y=6

'for i=100 to x
'	x=x
'next i

loop count=3
	inc y
	loop count=2
		x=x+3
	endloop
endloop

for i=1 to 10
	dec x
	continue if x=3
	exitif x>44
	x=4
	dec y
next i

testlabel:

if x>y then
	inc y
endif

if x<y and x=5 then
	inc x
endif

while x<20
	inc x
	continue if x=3
	x=4
endwhile

if x=0 then testlabel

repeat
	inc y
until y=33

