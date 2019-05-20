'********************************
'* PROGRAM: lst                 *
'* Lists a file                 *
'********************************
dim InpFile as long
dim Buf as string*300

Buf=NextArg
if len(Buf)=0 then
	print "No file specified"
	end
endif
on error goto BadFile
open #InpFile,Buf:read
on error
while not(eof(InpFile)) do
	read #InpFile,Buf
	print Buf
endwhile
end
BadFile:
print "Cannot open ";Buf

