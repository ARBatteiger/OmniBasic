 dim inpfile:byte
 dim outfile:byte
 dim dta:byte
 dim filename:string[32]
 input "enter input file>",filename
 open #inpfile,filename:read
 input "enter output file>",filename
 create #outfile,filename:write
 while not(eof(#inpfile)) do
 	get #inpfile,dta
 	if dta=$0a then
 		dta=$0d
 		put #outfile,dta
 		dta=$0a
 	endif
 	put #outfile,dta
 endwhile
 
