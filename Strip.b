dim InpFile as byte
dim OutFile as byte
dim InpFileName as string*32
dim OutFileName as string*32
dim SeekAdr as long
dim StopAdr as long
dim Buf as string*300
dim RawData as string*1
dim DLLName as string*32
dim First as boolean

First=true
input "Enter input file name",InpFileName
input "Enter output file name",OutFileName

open #InpFile,InpFileName:read+binary
create #OutFile,OutFileName:write

input "Enter start byte number",SeekAdr
input "Enter stop byte number",StopAdr
seek #InpFile,SeekAdr
Buf=""

while SeekAdr<StopAdr+1 do
	get #InpFile,RawData
	inc SeekAdr
	if RawData="" then
		if First=true then
			DLLName=Buf
			First=false
		else
			write #OutFile,Buf
		endif
		Buf=DLLName+" "
	else
		Buf=Buf+RawData
	endif
end while





