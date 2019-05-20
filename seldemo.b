* This shows the use of SELECT/CASE/ENDSELECT

 DIM A$ AS STRING*1

 LOOP
        INPUT "Enter a single character ('/' to quit)",A$
        SELECT CASE A$
                CASE "a" TO "z"
                        PRINT A$;" is lower case"
                CASE "A" TO "Z"
                        PRINT A$;" is upper case"
                CASE "0" TO "9"
                        PRINT A$;" is numeric"
                CASE "/"
                        END
                CASE ELSE
                        PRINT A$;" is not alpha-numeric"
        END SELECT
 END LOOP
