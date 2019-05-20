
*******************************************
* CDL Scripture                           *
* Copyright 1997 Computer Design Lab      *
* All Rights Reserved                     *
*******************************************

#SET NumBooks=66
#SET NumChaps=1189
#SET NumComWds=128
#SET NumWds=12748
#SET M=0\ REM 0 for Intel, 1 for Motorola

* Define Functions
#FCN GetBkNum() VOID
#FCN GetBkNam() VOID
#FCN FmtOutput() VOID
#FCN IncRef() VOID
#FCN DecRef() VOID
#FCN WdLookUp() VOID
#FCN MakLower() VOID
#FCN EatSpaces() VOID
#FCN Default() VOID
#FCN WordMatch() INT
#FCN ReportLim() VOID
#FCN FixEndian() VOID

* Define Macros
#MACRO GetRef
 SEEK #IvFile,IvfPtr
 GET #IvFile,RefGroup
 BookNum=RefGroup(1)
 Chap=RefGroup(2)
 Vers=RefGroup(3)
 Verse=Vers+Chap*$0100+BookNum*$010000
#ENDM

#MACRO GetByte
 GET #~1,~2
#ENDM
#MACRO GetString
 Get #~1,~2
#ENDM

#IF M=0

#MACRO GetShort
 SETVEC ShortEndian=ADDR(~2)
 GET #~1,ShortEndian(2)
 GET #~1,ShortEndian(1)
#ENDM

#MACRO GetLong
 SETVEC LongEndian=ADDR(~2)
 GET #~1,LongEndian(4)
 GET #~1,LongEndian(3)
 GET #~1,LongEndian(2)
 GET #~1,LongEndian(1)
#ENDM

#ELSE

#MACRO GetShort
 GET #~1,~2
#ENDM

#MACRO GetLong
 GET #~1,~2
#ENDM

#LIB -k=2

#ENDIF

* Diminsion Variables\
 DIM EndianPointer AS LONG POINTER
 DIM ShortEndian(2) AS BYTE VECTOR
 DIM LongEndian(4) AS BYTE VECTOR
 DIM DisplayFlag AS BYTE
 DIM Display AS LONG
 DIM HiVersWd AS LONG
 DIM HiVerse AS LONG
 DIM SrchFlag AS BYTE
 DIM AutoFlag AS BYTE
 DIM VersCount AS SHORT
 DIM More AS STRING * 5
 DIM LoBook AS LONG
 DIM HiBook AS LONG
 DIM LBTemp AS LONG
 DIM HBTemp AS LONG
 DIM Words(20) AS STRING * 17
 DIM SrchWdNdx AS LONG
 DIM SMax AS LONG
 DIM SErr AS BYTE
 DIM WdIvfPtr(20) AS LONG
 DIM WdIvfLim(20) AS LONG
 DIM WdErrFlag(20) AS BYTE
 DIM WdVerse(20) AS LONG
 DIM WdBookNum(20) AS BYTE
 DIM RefGroup(3) AS BYTE
 DIM Verse AS LONG
 DIM EqFlag AS BYTE
 DIM TVerse AS LONG
 DIM IvPos AS LONG
 DIM IvfNum AS LONG
 DIM IvFPos AS LONG
 DIM IvfRoot AS LONG
 DIM IvfPtr AS LONG
 DIM IvfLim AS LONG
 DIM Lo AS LONG
 DIM Hi AS LONG
 DIM Bottom AS BYTE
 DIM ErrFlag AS BYTE
 DIM MaxChap(NumBooks) AS BYTE
 DIM MaxVers(NumChaps) AS BYTE
 DIM DblFlag AS BYTE
 DIM CapFlag AS BYTE
 DIM ScripPtr AS LONG
 DIM Scrip AS BYTE
 DIM RqLine AS STRING * 299
 DIM Command AS STRING * 1
 DIM i AS LONG
 DIM j AS LONG
 DIM ComWds(NumComWds) AS STRING * 17
 DIM CwdPtr(NumComWds) AS LONG
 DIM wds(NumWds) AS STRING * 17
 DIM WdPtr(NumWds) AS LONG
 DIM LSB AS BYTE
 DIM MSB AS BYTE
 DIM Acc AS LONG
 DIM VersOffs AS SHORT
 DIM InpFile AS BYTE
 DIM IvFile AS BYTE
 DIM Temp AS STRING * 80
 DIM Temp1 AS STRING * 80
 DIM BookNum AS BYTE
 DIM Chap AS BYTE
 DIM Chap$ AS STRING * 3
 DIM Vers AS BYTE
 DIM Vers$ AS STRING * 3
 DIM Versbyte AS LONG
 DIM XPtr AS LONG
 DIM VersNdx AS LONG
 DIM BookName(NumBooks) AS STRING * 16
 DIM ChapPtr(NumBooks) AS LONG
 DIM DiskAdr(NumChaps) AS LONG
 DIM VersBeg AS LONG
 DIM VersEnd AS LONG
 DIM VersPtr(NumChaps) AS LONG
 DIM VersFile AS BYTE
 DIM ASCII AS BYTE
 DIM Word AS STRING * 17

Start
 RqLine=NextArg
 IF LEN(RqLine)<>0 THEN
    PRINT "KJV has no command line options"
    END
 END IF
* Initialize Variables
 ON ERROR GOTO ETzbooks
 OPEN #InpFile,"zbooks":READ+BINARY
 GetString InpFile,BookName
 GET #InpFile,ChapPtr
 EndianPointer=ADDR(ChapPtr)
 FixEndian(NumBooks)
 GetByte InpFile,MaxChap
 CLOSE #InpFile
 ON ERROR GOTO ETzchaps
 OPEN #InpFile,"zchaps":READ+BINARY
 GET #InpFile,DiskAdr
 EndianPointer=ADDR(DiskAdr)
 FixEndian(NumChaps)
 GET #InpFile,VersPtr
 EndianPointer=ADDR(VersPtr)
 FixEndian(NumChaps)
 GetByte InpFile,MaxVers
 CLOSE #InpFile
 ON ERROR GOTO ETinvfile
 OPEN #IvFile,"invfile":READ+BINARY
 ON ERROR GOTO ETverses
 OPEN #VersFile,"verses":READ+BINARY
 LoBook=1
 HiBook=66
 AutoFlag=$ff
 DisplayFlag=0
 Bottom=0
 ErrFlag=0
 BookNum=1
 Chap=1
 Vers=1
 VersNdx=0
 ON ERROR GOTO ETzcomwds
 OPEN #InpFile,"zcomwds":READ+BINARY
 GetString InpFile,ComWds
 GET #InpFile,CwdPtr
 EndianPointer=ADDR(CwdPtr)
 FixEndian(NumComWds)
 CLOSE #InpFile
 ON ERROR GOTO ETzwds
 OPEN #InpFile,"zwds":READ+BINARY
 GetString InpFile,wds
 GET #InpFile,WdPtr
 EndianPointer=ADDR(WdPtr)
 FixEndian(NumWds)
 CLOSE #InpFile
 ON ERROR GOTO ETscrip
 OPEN #InpFile,"scriptur":READ+BINARY
 ON ERROR

* Greeting
 PRINT
 PRINT "CDL Scripture Version 1.0"
 PRINT "Copyright 1995 Computer Design Lab"
 PRINT "All Rights Reserved"
 PRINT

MainMenu
 SrchFlag=0
 ErrFlag=0
 INPUT "read(r), search(s), limits(l), auto(a), quit(q) ?",Command 
 SELECT CASE Command
    CASE "a"
        AutoFlag=LNOT(AutoFlag)
        IF AutoFlag=0 THEN
            PRINT "Auto is OFF"
        ELSE
            PRINT "Auto is ON"
        END IF
        GOTO MainMenu
    CASE "r"
        GOTO ReadOpt
    CASE "s"
        GOTO SearchOpt
    CASE "q"
        GOTO QuitOpt
    CASE "l"
        INPUT "Low limit book ?",RqLine
        IF LEN(RqLine)=0 THEN
            HiBook=1
            LoBook=2
            Default()
            GOTO MainMenu
        END IF
        GetBkNum()
        IF i=0 THEN
            PRINT RqLine; " does not exist"
            GOTO MainMenu
        END IF
        LoBook=i
        INPUT "High limit book ?",RqLine
        IF LEN(RqLine)=0 THEN
            HiBook=LoBook
            Default()
            GOTO MainMenu
        END IF
        GetBkNum()
        IF i=0 THEN
            PRINT RqLine; " does not exist"
            GOTO MainMenu
        END IF
        HiBook=i
        Default()
        GOTO MainMenu 
    CASE ELSE
        GOTO MainMenu
 END SELECT
       
ReadOpt
 INPUT "book ?",RqLine
 IF LEN(RqLine)=0 THEN
    RqLine="gen"
 END IF
 GetBkNum()
 IF i=0 THEN
    PRINT
    PRINT RqLine; " does not exist"
    PRINT
    GOTO MainMenu
 END IF
 INPUT "Chapter ?",Chap$
 IF LEN(Chap$)=0 THEN
    Chap=1
 ELSE
    Chap=VAL(Chap$)
 END IF
 INPUT "verse ?",Vers$
 IF LEN(Vers$)=0 THEN
    Vers=1
 ELSE
    Vers=VAL(Vers$)
 END IF
ReadOpt1
 FmtOutput()
 IF ErrFlag=1 THEN MainMenu
ReadOpt2
 INPUT "next(n), previous(p), context(c), display(d), or quit(q) ?",Command
 SELECT CASE Command
    CASE "n"
        IncRef()
        GOTO ReadOpt1
    CASE ""
        IncRef()
        GOTO ReadOpt1
    CASE "p"
        DecRef()
        GOTO ReadOpt1
    CASE "c"
        DecRef()
        FmtOutput()
        IncRef()
        FmtOutput()
        IncRef()
        FmtOutput()
        GOTO ReadOpt2
    CASE "d"
        DisplayFlag=$ff
        INPUT "Number of verses to display ?",RqLine
        FOR Display=1 TO VAL(RqLine)
            FmtOutput()
            IncRef()
        NEXT Display
        DisplayFlag=0
        PRINT
        PRINT
        GOTO ReadOpt2
    CASE "q"  
        GOTO MainMenu
    CASE ELSE
        GOTO ReadOpt2 
 END SELECT

SearchOpt
 SrchFlag=$ff
 VersCount=0
 HiVerse=0
 More=""
 SErr=0
 ReportLim()
 FOR i=1 TO 20
    Words(i)=""
 NEXT i
 j=1
 PRINT "enter search word(s) or quit(q)"
 PRINT
 INPUT ">",RqLine
 PRINT
 IF LEN(RqLine)=0 THEN MainMenu
 REM Get match Words (max 20)
 FOR i=1 TO LEN(RqLine)
    ASCII=ASC(MID$(RqLine,i,1))
    IF ASCII<>$20 THEN\ not a space
        IF ASCII>$40 AND ASCII<$5b THEN
            ASCII=LOR(ASCII,$20)\ make lower case
        END IF
        Words(j)=Words(j)+CHR$(ASCII)
    ELSE
        INC j
        IF j=21 THEN
            PRINT "Too many search words"
            GOTO SearchOpt
        END IF
    END IF
 NEXT i
 SMax=j
 IF Words(1)="q" OR Words(1)="Q" THEN MainMenu
 FOR SrchWdNdx=1 TO SMax
    Word=Words(SrchWdNdx)
    LBTemp=LoBook
    HBTemp=HiBook
    WdLookUp()
    IF ErrFlag<>0 THEN
        SErr=1
    END IF
    WdIvfPtr(SrchWdNdx)=IvfPtr
    WdIvfLim(SrchWdNdx)=IvfLim
    WdErrFlag(SrchWdNdx)=ErrFlag
    GetRef
    WdVerse(SrchWdNdx)=Verse
    IF Verse>HiVerse THEN
        HiVerse=Verse
    END IF
 NEXT SrchWdNdx
 IF SErr=1 THEN
    SErr=0
    FOR SrchWdNdx=1 TO SMax
        PRINT Words(SrchWdNdx);
        IF WdErrFlag(SrchWdNdx)=0 THEN
            PRINT " is valid"
        END IF
        IF WdErrFlag(SrchWdNdx)=1 THEN
            PRINT " is invalid"
        END IF
        IF WdErrFlag(SrchWdNdx)=2 THEN
            PRINT " is out of limits"
        END IF
        IF WdErrFlag(SrchWdNdx)=3 THEN
            PRINT " is not a key word"
        END IF
    NEXT SrchWdNdx
    PRINT
    GOTO SearchOpt
 END IF
Search1
 IF WordMatch(0)=0 OR BookNum>HiBook THEN
    PRINT
    PRINT "no ";More;"matches"
    IF More="more " THEN
        PRINT VersCount;" occurence(s)"
    END IF
    PRINT
    GOTO SearchOpt
 END IF
 INC VersCount
 FmtOutput()
 FOR SrchWdNdx=1 TO SMax
    WdIvfPtr(SrchWdNdx)=WdIvfPtr(SrchWdNdx)+3
    GetRef
    WdVerse(SrchWdNdx)=Verse
    IF Verse>HiVerse THEN
        HiVerse=Verse
    END IF
 NEXT SrchWdNdx
 More="more "

SrchMenu
 IF AutoFlag=0 THEN Search1
 INPUT "more(m), next(n), previous(p), context(c), or quit(q) ",Command
 SELECT CASE Command
    CASE "m"
        GOTO Search1
    CASE ""
        GOTO Search1
    CASE "n"
        REM NEXT VERSE
        IncRef()
        FmtOutput()
        GOTO SrchMenu
    CASE "p"
        REM PREVIOUS VERSE
        DecRef()
        FmtOutput()
        GOTO SrchMenu
    CASE "c"
        REM CONTEXT
        DecRef()
        FmtOutput()
        IncRef()
        FmtOutput()
        IncRef()
        FmtOutput()
        GOTO SrchMenu
    CASE "q"
        GOTO SearchOpt
    CASE ELSE
        GOTO SrchMenu
 END SELECT

FmtOutput()
 REM format output
 XPtr=ChapPtr(BookNum)+Chap-1
 IF Chap>MaxChap(BookNum) THEN
    PRINT
    PRINT "Chapter number too large... re-enter"
    PRINT
    ErrFlag=1
    RETURN
 END IF
 VersNdx=VersPtr(XPtr)-1
 VersNdx=VersNdx*2
 VersNdx=VersNdx+(Vers-1)*2
 IF Vers>MaxVers(XPtr) THEN
    PRINT
    PRINT "Verse number too large... re-enter"
    PRINT
    ErrFlag=1
    RETURN
 END IF
 SEEK #VersFile,VersNdx
 GetShort VersFile,VersOffs
 VersBeg=DiskAdr(XPtr)+VersOffs
 GetShort VersFile,VersOffs
 IF VersOffs=0 THEN
    VersEnd=DiskAdr(XPtr+1)-1
 ELSE
    VersEnd=DiskAdr(XPtr)+VersOffs-1
 END IF
 DblFlag=0
 CapFlag=0
 Acc=BookNum
 GetBkNam()
 IF AutoFlag=$ff OR SrchFlag=0 THEN
    PRINT
 END IF
 PRINT Temp1; " "; Chap; ":"; Vers
 IF AutoFlag=0 AND SrchFlag=$ff THEN
    RETURN
 END IF
 SEEK #InpFile,VersBeg
 FOR i=VersBeg TO VersEnd
    GetByte InpFile,Scrip
    IF Scrip>$7f AND DblFlag=0 THEN
        MSB=LAND(Scrip,$7f)
        DblFlag=1
        GOTO FmtOut2
    END IF
    IF DblFlag=1 THEN
        LSB=Scrip
        Acc=MSB*256+LSB
        ScripPtr=Acc
        PRINT " ";
        GOTO FmtOut1
    END IF
    ScripPtr=Scrip
    IF ScripPtr>11 THEN
        PRINT " ";
    END IF
    IF ScripPtr=6 THEN
        PRINT CHR$($2c);
        GOTO FmtOut2
    END IF
    IF ScripPtr=1 THEN
        CapFlag=1
        GOTO FmtOut2
    END IF
    IF ScripPtr=2 THEN
        CapFlag=2
        GOTO FmtOut2
    END IF
FmtOut1
    IF ScripPtr<128 THEN
        Word=ComWds(ScripPtr+1)
    ELSE
        Word=wds(ScripPtr-127)
    END IF
    IF CapFlag=1 THEN
        Temp=""
        FOR j=1 TO LEN(Word)
            ASCII=ASC(MID$(Word,j,1))
            IF j=1 THEN
                ASCII=LAND(ASCII,$df)
            END IF
            Temp=Temp+CHR$(ASCII)
        NEXT j
        Word=Temp
        CapFlag=0
    END IF
    IF CapFlag=2 THEN
        Temp=""
        FOR j=1 TO LEN(Word)
            ASCII=ASC(MID$(Word,j,1))
            IF ASCII>$60 AND ASCII<$7b THEN
                ASCII=LAND(ASCII,$df)
            END IF
            Temp=Temp+CHR$(ASCII)
        NEXT j
        Word=Temp
        CapFlag=0
    END IF
    IF POS>60 THEN
        IF ScripPtr>12 OR DblFlag<>0 THEN
            PRINT
        END IF
    END IF
    DblFlag=0
    PRINT Word;
FmtOut2
 NEXT i
 IF DisplayFlag=0 THEN
    PRINT
    PRINT
 END IF
 RETURN

WdLookUp()
 REM Look up Word
 ErrFlag=0
 Lo=0
 Hi=129
WdLook1
 i=(Hi-Lo)/2+Lo
 IF Hi-Lo<=1 THEN WdLook3
 IF Word=ComWds(i) THEN
    IvfRoot=CwdPtr(i)
    IF IvfRoot=$ffff THEN
        ErrFlag=3
        RETURN
    END IF
    IF i<128 THEN
        j=0
        LOOP
            INC j
            EXIT IF CwdPtr(i+j)<>$ffff
        END LOOP
        IvfLim=CwdPtr(i+j)
    ELSE
        IvfLim=WdPtr(1)
    END IF
    GOTO WdLook5
 END IF
 IF Word<ComWds(i) THEN
    Hi=i
 ELSE
    Lo=i
 END IF
 GOTO WdLook1
WdLook3
 Lo=0
 Hi=12749
WdLook4
 i=(Hi-Lo)/2+Lo
 IF Hi-Lo<=1 THEN
    ErrFlag=1
    RETURN
 END IF
 IF Word=wds(i) THEN
    IvfRoot=WdPtr(i)
    IF i=12748 THEN
        IvfLim=IvfRoot+3
    ELSE
        IvfLim=WdPtr(i+1)
    END IF
    GOTO WdLook5
 END IF
 IF Word<wds(i) THEN
    Hi=i
 ELSE
    Lo=i
 END IF
 GOTO WdLook4
WdLook5
 IvfPtr=IvfRoot
 GetRef
 IF IvfLim-IvfRoot<4 THEN
    IF BookNum<LBTemp OR BookNum>HBTemp THEN
        ErrFlag=2
    END IF
    RETURN
 END IF
 Lo=IvfRoot
 Hi=IvfLim
WdLook6
 IvfNum=(Hi-Lo)/3
 IF IvfNum<=1 THEN
    IF BookNum<LBTemp THEN
        ErrFlag=2
    END IF
    IvfPtr=IvfRoot
    RETURN
 END IF
 IvFPos=IvfNum/2
 IvFPos=IvFPos*3+Lo
 SEEK #IvFile,IvFPos
 GetByte IvFile,BookNum
 IF LBTemp=BookNum THEN
    j=0
WdLook7
 j=j+3
    IF IvFPos-j=IvfRoot THEN
        IvfPtr=IvFPos-j
        RETURN
    END IF
    SEEK #IvFile,IvFPos-j
    GetByte IvFile,BookNum
    IF LBTemp=BookNum THEN WdLook7
    IvfPtr=IvFPos+3-j
    RETURN
 END IF
 IF LBTemp<BookNum THEN
    Hi=IvFPos
 ELSE
    Lo=IvFPos
 END IF
 GOTO WdLook6
 RETURN

GetBkNum()
* RqLine > BookNum
 MakLower()
 EatSpaces()
 i=0
GetBkNum1
 INC i
 IF i>66 THEN
    i=0
    RETURN
 END IF
 Temp=BookName(i)
 Temp1=""
 FOR j=1 TO LEN(Temp)
    IF MID$(Temp,j,1)<>" " THEN
        Temp1=Temp1+MID$(Temp,j,1)
    END IF
 NEXT j
 IF RqLine<>MID$(Temp1,1,LEN(RqLine)) THEN GetBkNum1
 BookNum=i
 RETURN

IncRef()
 REM inc Book/Chap/Verse
 INC Vers
 IF Vers>MaxVers(XPtr) THEN
    Vers=1
    INC Chap
    IF Chap>MaxChap(BookNum) THEN
        Chap=1
        INC BookNum
    END IF
 END IF
 IF BookNum=67 THEN
    BookNum=66
    Chap=22
    Vers=21
 END IF
 RETURN

DecRef()
 REM dec BookNum/Chap/Verse
 Vers=Vers-1
 IF Vers<1 THEN
    Chap=Chap-1
    IF Chap<1 THEN
        BookNum=BookNum-1
        IF BookNum<1 THEN
            Bottom=1
            BookNum=1
        END IF
        Chap=MaxChap(BookNum)
    END IF
    XPtr=ChapPtr(BookNum)+Chap-1
    Vers=MaxVers(XPtr)
    IF Bottom=1 THEN
        Chap=1
        Vers=1
        Bottom=0
    END IF
 END IF
 RETURN

MakLower()
 REM make RqLine Lower case
 Temp=""
 FOR i=1 TO LEN(RqLine)
    ASCII=ASC(MID$(RqLine,i,1))
    IF ASCII>$40 AND ASCII<$5b THEN
        ASCII=LOR(ASCII,$20)
    END IF
    Temp=Temp+CHR$(ASCII)
 NEXT i
 RqLine=Temp
 RETURN

EatSpaces()
 REM remove spaces from RqLine
 Temp=""
 FOR i=1 TO LEN(RqLine)
    IF MID$(RqLine,i,1)<>" " THEN
        Temp=Temp+MID$(RqLine,i,1)
    END IF
 NEXT i
 RqLine=Temp
 RETURN

GetBkNam()
 REM BookName(Acc) > Temp1 (all caps)
 Temp=BookName(Acc)
 Temp1=""
* make upper case
 FOR i=1 TO LEN(Temp)
    ASCII=ASC(MID$(Temp,i,1))
    IF ASCII>$40 AND ASCII<$7b THEN
        ASCII=LAND(ASCII,$df)
    END IF
    Temp1=Temp1+CHR$(ASCII)
 NEXT i
 RETURN

WordMatch()
WdMatch
 SrchWdNdx=0
MatchLp
 INC SrchWdNdx
MatchLp1
 IF WdIvfPtr(SrchWdNdx)<WdIvfLim(SrchWdNdx) THEN
    IvfPtr=WdIvfPtr(SrchWdNdx)
    GetRef
    IF Verse<HiVerse THEN
        WdIvfPtr(SrchWdNdx)=WdIvfPtr(SrchWdNdx)+3
        GOTO MatchLp1
    END IF
    IF Verse>HiVerse THEN
        HiVerse=Verse
        HiVersWd=SrchWdNdx
        GOTO WdMatch
    END IF
    IF SrchWdNdx<SMax THEN MatchLp
 ELSE
    RETURN 0
 END IF
 IF BookNum<LoBook THEN
    WdIvfPtr(1)=WdIvfPtr(1)+3
    GOTO WdMatch
 END IF
 RETURN $ff

ReportLim()
 Acc=LoBook
 GetBkNam(0)
 PRINT "Limits: ";Temp1;"-";
 Acc=HiBook
 GetBkNam(0)
 PRINT Temp1
 RETURN

FixEndian()
 PARAM NumElements:LONG
#IF M=0
 FOR i=1 TO NumElements
    SETVEC LongEndian=EndianPointer
    SWAP LongEndian(1),LongEndian(4)
    SWAP LongEndian(2),LongEndian(3)
    INC EndianPointer
 NEXT i
#ENDIF
 RETURN
 
Default()
 IF HiBook<LoBook THEN
    LoBook=1
    PRINT
    HiBook=66
 END IF
 ReportLim()
 RETURN

QuitOpt
 CLOSE #InpFile
 CLOSE #IvFile
 CLOSE #VersFile
 END

ETzbooks
 PRINT "Cannot open zbooks"
 END

ETzchaps
 PRINT "Cannot open zchaps"
 END

ETinvfile
 PRINT "Cannot open invfile"
 END

ETverses
 PRINT "Cannot open verses"
 END

ETzcomwds
 PRINT "Cannot open zcomwds"
 END

ETzwds
 PRINT "Cannot open zwds"
 END

ETscrip
 Print "Cannot open scripture"
 END
