dim bool as boolean
dim x as byte
dim y as integer
dim z as long

bool=TRUE
print bool

print "Register Test"

z=$89abcdef
+movl _z,%eax
+movw %ax,_y
+movb %al,_x
+movl %eax,_z

print hex$(x),hex$(y),hex$(z)

+xorl %eax,%eax
+movb $123,%al
+movl %eax,_z

print z,"should be 123"

x=0
z=$76
+movb _z,%al
+movb %al,_x
print hex$(x)

'+xor %eax,%eax
+movb _bool,%al
+notb %al
+movl %eax,_z
+movb _z,%al
+movb %al,_bool
print bool,z

'mov al, byte [bool]; LoadReg
'not al; BOOLEAN NOT
'mov [_Tmp1],eax; StoreD0Tmp
'mov al, byte [_Tmp1]; LoadReg
'mov [bool],al; Store Reg0




