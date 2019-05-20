dim x$ as string
dim y$ as string

dim a$ as string vector
dim b$ as string vector

setvec a$=addr(x$)
setvec b$=addr(y$)

a$=a$+b$
