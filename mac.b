macro havis
x=~1
y=~2
z=~3
endmacro

dim a$ as string
dim x as long
dim y as long
dim z as long

havis 6,7,8

print x
print y
print z

input a$
print hex$(asc(a$))
