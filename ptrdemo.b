* This demo shows the use of pointers

 DIM X(10) AS LONG
 DIM P AS LONG POINTER
 DIM I AS LONG

 FOR I=1 TO 10
        X(I)=I*100
 NEXT I
 P=ADDR(X)
 PRINT [P]' prints X(1)
 INC P
 PRINT [P]' prints X(2)
 P=INDEX(P,2)
 PRINT [P]' print X(4)
 [P]=1234
 PRINT X(4)


