* This shows an array with more than 64k diminision

 DIM X(100000) AS BYTE
 DIM I AS LONG

 FOR I=1 TO 100000
        X(I)=I*100
 NEXT

