* This shows the use of user defined types

 TYPE UsrType
        Name AS STRING*20
        Address AS STRING*30
        City AS STRING*20
        State AS STRING*2
        ZipCode AS LONG
        PhoneNum(2) AS STRING*12 \ notice that arrays are allowed in types!
 END TYPE
 DIM Record AS UsrType

 Record.Name="John Doe"
 Record.Address="123 Main St"
 Record.City="Chicago"
 Record.State="IL"
 Record.ZipCode=12345
 Record.PhoneNum(1)="312-555-1212"
 Record.PhoneNum(2)="708-555-1212"
 PRINT Record.Name
 PRINT Record.Address
 PRINT Record.City;",";Record.State;" ";Record.ZipCode
 PRINT Record.PhoneNum(1)
 PRINT Record.PhoneNum(2)
