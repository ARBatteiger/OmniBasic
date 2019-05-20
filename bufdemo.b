* This shows the use of memory buffers

 DIM A$ AS STRING*26
 DIM B$ AS STRING*26 VECTOR

 BUFFER Buf=26
 IF BUFSIZ(Buf)<26 THEN
        PRINT "Failure opening buffer"
        END
 END IF
 INIT Buf,02ah\ fill with '*'
 A$="abcdefghijklmnopqrstuvwxyz"
 SETVEC B$=BUFADR(Buf)
 PRINT B$
 B$=A$
 MAKEUPPER B$
 A$=B$
 PRINT A$

