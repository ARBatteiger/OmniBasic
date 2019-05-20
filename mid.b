dim a$ as string*16
dim b$ as string*8

b$="1234"
a$=mid$(b$,1,3)
print a$
mid$(a$,2,1)="A"
print a$
print "bad:"
a$=left$(b$,2)
print a$
left$(a$,2)="ab"
print a$
print mid$(b$,2,2)
a$=mid$(b$,2,2)
print a$
print right$(b$,2)
print tail$(b$,2)
