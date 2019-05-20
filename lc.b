dim a$ as string
dim b$(10) as string
dim f$ as string
type dt
	x as long
	c$ as string
end type
dim cpx as dt

a$="Michael L. Smith 482-52-1244"
print a$
f$=ucase$(a$)
print a$
print f$
makelower f$
print f$
makeupper f$
print f$

'b$(7)="AbCd 1234"
'print lcase$(b$(7))
'print ucase$(b$(7))

'cpx.c$="WxYz 5678"
'print lcase$(cpx.c$)
'print ucase$(cpx.c$)


