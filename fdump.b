* FDUMP File Dump Program 

 DIM Character:BYTE
 DIM FileNum:BYTE
 DIM FileName:STRING[32]
 DIM ByteCtr:LONG
 DIM AddrCtr:LONG
 DIM ASCII:STRING[16]
 DIM Hex:STRING[60]
 DIM LineCtr:LONG
 DIM HitEnter:STRING[1]

 AddrCtr=0
 LineCtr=0
 ON ERROR GOTO BadFile
 FileName=NextArg
 IF len(FileName)=0 THEN Help
 IF FileName="-?" OR FileName="--help" THEN Help
 OPEN #FileNum,FileName:READ+BINARY
Lp1
 ByteCtr=0
 ASCII="                "
 Hex=ZHEX$(AddrCtr)+" "
 AddrCtr=AddrCtr+16
Lp2
 GOSUB GetByte
 IF STATUS<1 THEN
 	IF ByteCtr>0 THEN
 		GOSUB Display
 	ENDIF
 	CLOSE #FileNum
 	END
 ENDIF
 INC ByteCtr
 IF Character>$1f AND Character<$7f THEN
 	MID$(ASCII,ByteCtr,1)=CHR$(Character)
 ELSE
 	MID$(ASCII,ByteCtr,1)="."
 ENDIF
 Hex=Hex+RIGHT$(ZHEX$(Character),2)+" "
 IF ByteCtr=16 THEN
 	GOSUB Display
 	GOTO Lp1
 ENDIF
 GOTO Lp2

Display
 PRINT Hex;TAB(60);ASCII
 INC LineCtr
 IF LineCtr=16 THEN
 	LineCtr=0
 	INPUT "Hit ENTER to continue>",HitEnter
 ENDIF
 RETURN

GetByte
 GET #FileNum,Character
 RETURN

BadFile
 PRINT "Cannot open ";FileName
 END

Help
 PRINT
 PRINT "fdump FileName"
 PRINT
 PRINT "Performs hexadecimal and ASCII dump of file specified"
 PRINT
 END

