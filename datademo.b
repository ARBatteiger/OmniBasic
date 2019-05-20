* Shows the use of the DATA statement

 CONST Red=1
 CONST Green=2
 CONST Blue=3

 DIM A$ AS STRING*10
 DIM X AS BYTE
 DIM Y AS BYTE
 DIM Z AS BYTE

 RESTORE Colors
 READ X,Y,Z,A$
 PRINT X,Y,Z,A$

Colors DATA Red,Green,Blue
 DATA "colors"

