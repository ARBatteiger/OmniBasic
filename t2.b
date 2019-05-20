dim x as byte
dim y as integer
dim z as long
dim b(10000) as integer
dim bool as boolean
dim ba(10000) as boolean
dim p(10) as long

bool=TRUE
bool=FALSE
bool=not(bool)
ba(7)=not(bool)
ba(3)=not(ba(5))

const a=123

inc b(3)
dec b(4)

p(5)=b(22)

x=6
y=7
z=b(x)+b(y)

inc b(y)

inc x
dec x
inc y
dec y
inc z
dec z

x=a

z=x+x&y

z=x+land(x,y)
z=lor(x,y)
z=lxor(x,y)
z=mod(x,y)

