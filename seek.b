dim a$ as string*32
dim f as long
dim x as long
dim b as boolean

seek #f,7/x

x=filpos(f)

x=filsiz(f)

b=eof(f)

put #f,x

get #f,x

write #f,a$

close #f

