* This shows the use of functions

#FCN VoidFcn() VOID
#FCN IntFcn() INT
#FCN FcnPtr() VOID POINTER

DIM X:LONG

X=4

VoidFcn()
PRINT IntFcn(X)
FcnPtr=VoidFcn
FcnPtr()

* Functions begin here

VoidFcn:
PRINT "Void Function"
RETURN

IntFcn:
PARAM Z:LONG
RETURN Z*2

