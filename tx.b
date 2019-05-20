dim f as long
dim x as long
dim a$ as string*5

create #f,"qazqaz":write
a$="one"
gosub putfile
a$="two"
gosub putfile
a$="three"
gosub putfile



close #f
end

putfile:
put #f,a$
x=XferCount
return



