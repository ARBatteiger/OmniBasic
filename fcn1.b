dim x as long
dim a$ as string*32

declare function uf1(integer,integer) as integer
declare function uf2(string,string) as string
declare procedure up1(integer,integer,string)
declare procedure up2()
declare procedure up3
declare procedure up4

x=uf1(2,7)
print x

a$=uf2("abc","123")
print a$

x=1

call up1(x+2,3,"String Test")
call up3
call up4
'call up2

function uf1(fx,fy)
return fx+fy
end function

function uf2(s1$,s2$)
return s1$+s2$
end function

procedure up3
dim fv as long
dim pss as string*16
fl:
fv=7
x=3
x=fv
x=x
fv=fv
fv=x
end procedure

procedure up4
dim fv as long
dim pss as string*16
fl:
fv=7
x=3
x=fv
x=x
fv=fv
fv=x
end procedure

procedure up1(p1,p2,ps)
print p1+p2
print ps
end procedure

x=4
