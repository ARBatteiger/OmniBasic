' This shows the use of macros

MACRO REVERSE\ prints the string arg in reverse
 FOR _StrNdx=LEN(~1) TO 1 STEP -1
        PRINT MID$(~1,_StrNdx,1);
 NEXT
 PRINT
END MACRO
