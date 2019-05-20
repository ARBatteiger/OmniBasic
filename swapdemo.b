* This shows how to use the SWAP (alias EXCHANGE) statement

 DIM A$ AS STRING*7
 DIM B$ AS STRING*7

 A$="string1"
 B$="string2"

 PRINT A$,B$
 SWAP A$,B$
 PRINT A$,B$

* Note that swap works with any 2 like data types of the same size
* including user defined types and arrays.
