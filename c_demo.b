* This show the use of inline C code

 DIM A AS STRING*32
 DIM B AS STRING*32

 A="This is a test"
 B=" of C mixing"

#C
puts(A);
strcat(A,B);
#ENDC

;puts(A);

 PRINT A
