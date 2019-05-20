declare function lc(string) as string

dim a$ as string

a$="ABC"
a$=lc(a$)
print a$
end

function lc(x$)
dim i as long
for i=1 to len(x$)
	if mid$(x$,i,1)>="A" and mid$(x$,i,1)<="Z" then
		mid$(x$,i,1)=chr$(asc(mid$(x$,i,1))|$20)
	endif
next i
return x$
end function


