********************************
* PROGRAM: lst                 *
* Lists a file and adds line   *
* numbers                      *
********************************
 dim InpFile:byte
 dim Buf:string[300]
 dim LineNum:short
Start
 LineNum=0
 Buf=NextArg
 if len(Buf)=0 then
	print "No file specified"
	end
 endif
 on error goto BadFile
 open #InpFile,Buf:read
 on error
 while not(eof(#InpFile)) do
	read #InpFile,Buf
	inc LineNum
	print right$(zstr$(LineNum),5);" ";Buf
 endwhile
 end
BadFile
 print "Cannot open ";Buf
