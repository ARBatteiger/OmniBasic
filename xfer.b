dim inpfile as byte
dim outfile as byte
dim buf1 as string*300
dim buf2 as string*300

open #inpfile,"nb2.b":read+text
create #outfile,"nbz.b":write+text
while not(eof(inpfile)) do
	read #inpfile,buf1
	if left$(buf1,1)=" " then
		buf2=tail$(buf1,2)
	else
		buf2=buf1
	endif
	write #outfile,buf2
endwhile
