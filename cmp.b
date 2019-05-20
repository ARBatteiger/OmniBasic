dim a$ as string
dim b$ as string

a$="abc"
b$="bcd"
gosub comp
a$="ab"
gosub comp
a$="bcd"
gosub comp
a$="cde"
gosub comp
end

comp:
if a$=b$ then
	print "a$=b$"
endif
if a$>b$ then
	print "a$>b$"
endif
if a$<b$ then
	print "a$<b$"
endif
return

