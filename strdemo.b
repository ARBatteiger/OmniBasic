* This shows the use of strings

 DIM A$ AS STRING*10

 HEXOUT=INTEL' 0xxh format
 A$="1234567890"
 PRINT LEFT$(A$,3)' should print '123'
 PRINT RIGHT$(A$,3)' should print '890'
 PRINT MID$(A$,3,3)' should print '345'
 PRINT TAIL$(A$,3)' should print '34567890'
 PRINT SUBSTR("345",A$)' should print '3'
 PRINT SUBSTR("345",A$,4)' should print '0'
 PRINT HEX$(ASC(A$))' should print '031h'
 PRINT CHR$(041h)' should print 'A'
