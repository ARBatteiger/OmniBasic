dim a$ as string

text test1
mov eax,ecx
cmp eax,'4'
end text

restore test1
loop
	read a$
	if a$="end text" then
		end
	endif
	print a$
endloop


