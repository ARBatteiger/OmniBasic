declare function fss(string,string,integer) as integer

dim a$ as string
dim b$ as string

a$="lmn"
b$="abcdefghijklmnopqrs"
print fss(a$,b$,1)
end

function fss(x$,y$,z)
dim i as long
for i=z to len(y$)
	if mid$(y$,i,len(x$))=x$ then
		return i
	endif
next i
end function


