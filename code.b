 dim ChrCode as string * 1

 print "Enter with no previous key stops program"
 loop
 	input "Hit any key ",ChrCode
	if ChrCode="" then
		end
	end if
	print "The code is:";hex$(asc(ChrCode))
 end loop

