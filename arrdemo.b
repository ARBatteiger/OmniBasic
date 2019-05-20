* This shows the use of arrays

 DIM X(4) AS BYTE
 DIM Y(2,2) AS BYTE VECTOR
 DIM I AS LONG

 SETVEC Y=ADDR(X)
 FOR I=1 TO 4
        X(I)=I*2
 NEXT I
 FOR I=1 TO 2
        PRINT Y(I,1)
        PRINT Y(I,2)
 NEXT I
